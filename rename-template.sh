#!bash

NEW_NAME=$1

if [[ -z "$NEW_NAME" ]]; then
    echo "Must provide a new name as argument" 1>&2
    exit 1
fi

for EXT in tex sty bib; do
    mv sd-lab-template.$EXT sd-lab-$NEW_NAME.$EXT 
done

for FILE in `ls sd-lab-$NEW_NAME.{tex,sty,bib} .gitignore .github/workflows/*.yml`; do
    sed -i '.bak' -e "s/sd-lab-template/sd-lab-$NEW_NAME/g" $FILE
done

rm *.bak .github/workflows/*.bak *.sh
