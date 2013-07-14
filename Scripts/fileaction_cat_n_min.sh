#!/usr/bin/env sh

filetypes=('.min.css' '.min.js' '.css' '.js')
options=(' --type css --line-break 0' ' --type js' ' --type css --line-break 0' ' --type js')
compressor=$EDITOR_SUGAR_PATH'/Scripts/yuicompressor.jar'
min='.min'

IFS=$'\r\n' input=($(cat))
if [ -z "${input}" ]
then
    input=$EDITOR_DIRECTORY_PATH
fi

crawl() {
	local content=
	local name=
	local path=
	for filepath in ${@}
	do
		if [ -d ${filepath} ]
		then
			filepath=${filepath}"/*.*"
			crawl ${filepath}
			continue
		fi
		if [ -f ${filepath} ]
		then
			filename=$(basename ${filepath})
			path=$(dirname ${filepath})
			for i in ${!filetypes[*]}
			do
				filetype=${filetypes[$i]}
				if [ "${filename: -${#filetype}}" == "${filetype}" ]
				then
					file=${filename:0:${#filename}-${#filetype}}
					file=$(echo $file | sed -E 's/^(([0-9])+_)+//')
					content[$i]+=`cat "${filepath}"`
					name[$i]=${name[$i]}'_'${file}
					break
				fi
			done
		fi
	done
	
	for i in ${!filetypes[*]}
	do
		if [ -n "${name[$i]}" ]
		then
			filetype=${filetypes[$i]}
			name[$i]=${name[$i]:1:${#name[$i]}}${min}${filetypes[$i]}
			name[$i]=${path}/${name[$i]}
			echo "${content[$i]}" > "${name[$i]}"

			args=()
			if [ "${filetype: -4}" == ".css" ]
			then
				args+=(--type css --line-break 0)
			fi
			if [ "${filetype: -3}" == ".js" ]
			then
				args+=(--type js)
			fi
			args+=(-o "${name[$i]}")
			java -jar "${compressor}" "${args[@]}" "${name[$i]}" &
		fi
	done
}

crawl ${input[@]}