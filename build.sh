#!/bin/bash

container_cmd="docker run -v=$(pwd):/kikit -w=/kikit --rm yaqwsx/kikit:v1.3.0-v7"
container_cmd_draw="docker run -v=$(pwd):/kikit -w=/kikit --rm --entrypoint pcbdraw yaqwsx/kikit:v1.3.0-v7"

# Images
echo "Drawing image files"
mkdir -p images
for name in "pcb" "plate"
do
	for option in "$name"/*/
	do
		short_option="$(basename "$option")"
		file="$(find $option -type f -name '*.kicad_pcb')"
		${container_cmd_draw} plot --style set-blue-hasl "$file" images/"$name"_"$short_option".png >> /dev/null
		${container_cmd_draw} plot --style set-blue-hasl --side back "$file" images/"$name"_"$short_option"_back.png >> /dev/null
	done
done

# Gerbers
echo "Generating gerbers"
mkdir -p gerbers
for name in "pcb" "plate"
do
	prefix="case"
	if [[ "$name" == "pcb" ]]; then 
		prefix="pcb"
	fi
	mkdir -p gerbers/"$prefix"
	for option in "$name"/*/
	do
		if [[ "$name" == "plate" ]] && [[ "$option" =~ ^.*\/laser_plastic.*$ ]]; then # Solid bottoms/plates may be a choice
			continue
		fi
		short_option="$(basename "$option")"
		file="$(find $option -type f -name '*.kicad_pcb')"
		${container_cmd} fab jlcpcb --no-assembly "$file" gerbers/"$name"_"$short_option" --no-drc
		mv gerbers/"$name"_"$short_option"/gerbers.zip gerbers/"$prefix"/"$name"_"$short_option"_gerbers.zip
		rm -r gerbers/"$name"_"$short_option"
	done
done

zip -jr gerbers/case/gerber_case_files gerbers/case/
