#!/usr/bin/env sh

input=$(cat)

filetypes=('.css' '.js')
options=('--type css --line-break 0' '--type js')
compressor=$EDITOR_SUGAR_PATH'/Scripts/yuicompressor.jar'
filename=${EDITOR_ROOT_ZONE}

for i in ${!filetypes[*]}
do
	filetype=${filetypes[$i]}
	if [ "${filename: -${#filetype}}" == "${filetype}" ]
	then
		echo "${input}" | java -jar "${compressor}" ${options[$i]}
		break
	fi
done