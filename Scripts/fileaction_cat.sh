#!/usr/bin/env sh

filetypes=('.min.css' '.min.js' '.css' '.js')
begin=('/* @group %s */' '/* file %s */' '/* @group %s */' '/* file %s */')
end=('/* @end */' '/* %s end */' '/* @end */' '/* %s end */')
compressor=$EDITOR_SUGAR_PATH'/Scripts/yuicompressor.jar'

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
					content[$i]+="$(printf "\n${begin[$i]}\n\r\n" ${file})"
					content[$i]+=`cat "${filepath}"`
					content[$i]+="$(printf "\n\n${end[$i]}" ${file})"
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
			name[$i]=${name[$i]:1:${#name[$i]}}${filetypes[$i]}
			content[$i]=${content[$i]:1:${#content[$i]}}
			echo "${content[$i]}" > "${path}/${name[$i]}"
		fi
	done
}

crawl ${input[@]}