#!/usr/bin/env sh

filetypes=('.css' '.js')
min='.min'
compressor=$EDITOR_SUGAR_PATH'/Scripts/yuicompressor.jar'

IFS=$'\r\n' input=($(cat))
if [ -z "${input}" ]
then
    input=$EDITOR_DIRECTORY_PATH
fi

crawl() {
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
			for i in ${!filetypes[*]}
			do
				filetype=${filetypes[$i]}
				if [ "${filename: -${#filetype}}" == "${filetype}" ]
				then
					minfiletype=${min}${filetype}
					if [ "${filename: -${#minfiletype}}" == "${minfiletype}" ]
					then
						break
					fi
					output=${filepath:0:${#filepath}-${#filetype}}${minfiletype}
					args=()
					if [ "${filename: -${#filetype}}" == ".css" ]
					then
						args+=(--type css --line-break 0)
					fi
					if [ "${filename: -${#filetype}}" == ".js" ]
					then
						args+=(--type js)
					fi
					args+=(-o "${output}")
					java -jar "${compressor}" "${args[@]}" "${filepath}" &
					break
				fi
			done
		fi
	done
}

crawl ${input[@]}