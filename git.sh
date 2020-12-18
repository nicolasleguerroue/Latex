#!/bin/bash

echo -e "Start"
#confg

git config --global user.name "nicolasleguerroue"
git config --global user.email "n8leguer@enib.fr"


#creéation depot dans git
#puis
echo "# Bash" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/nicolasleguerroue/Bash.git
git push -u origin master




git clone https://github.com/nicolasleguerroue/Utils.git

#se placer dans le dossier courznt
#git add .
#git ommit -m "message"
#git push origin master