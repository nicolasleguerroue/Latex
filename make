#!/bin/bash
#Ce fichier permet de compiler un projet Latex
#La première phase permet de préparer le répertoire de compilation



default="\033[0m"
black="\033[30m"
red="\033[31m"
green="\033[32m"
orange="\033[33m"
blue="\033[34m"


output_dir="Output"
img_dir="Images"
utils_dir="Utils"


#Vérification du dossier $output_dir
if [[ ! -d $output_dir ]]; then
	mkdir $output_dir
fi
main="main" #Nom du fichier de compilation principal

#Fast compilation

if [ "$1" == "-f" ];then
	echo "Fast compiling..."
	pdflatex --output-dir=$output_dir $main >> render_report.txt
	pdflatex --output-dir=$output_dir $main >> render_report.txt
	mv $output_dir/$main.pdf $main.pdf >> render_report.txt
	echo -e "Done !"
	exit
fi

#Gestion des images



parts_dir="Parts"

echo -e "$green"
echo -e "[Etape 1 / 8] >>> Nettoyage du répertoire $output_dir..."
echo -e "$orange"
rm -R $output_dir/*
echo -e "$green"
echo -e "[Etape 1 / 8] >>> Nettoyage du répertoire $output_dir effectué"
echo -e "[Etape 2 / 8] >>> Nettoyage du fichier des journaux Latex..."
echo "" > render_report.txt
echo -e "[Etape 2 / 8] >>> Nettoyage du fichier des journaux Latex effectué"

echo -e "[Etape 3 / 8] >>> Génération du fichier d'importation (import_content.tex)..."
#lecture des parties

#images
echo -n "\newcommand{\rootImages}{Images/empty}" >> $output_dir/add_content.tex
echo -e "" >> $output_dir/add_content.tex
for item in $parts_dir/*
do	

#check if directory
if [ -d $item ]
then
	echo -e "$blue >>> Dossier $item ajouté ! $default"
	img_name=`echo $item | cut -d '.' -f2`

	if [ ! -d "$img_dir/$img_name" ]
	then
		echo -e "$red Le dossier $img_name n'existe pas dans le répertoire $img_dir. \nTous les fichiers avec des images dépendantes de ce dossier ($img_dir/$img_name) ne seront pas importées !$orange\n Dossier(s) dans le répertoire $img_dir: \n" 
		ls $img_dir
		echo -e $default
		exit
	fi
	echo -n "\renewcommand{\rootImages}{Images/$img_name}" >> $output_dir/add_content.tex
	echo -e "" >> $output_dir/add_content.tex
	for item_s in $item/*
	do
		if [ "`echo $item_s | grep part`" != "" ]
		then
			name_part=`echo $item_s | cut -d '.' -f4`
			echo "\part{"$name_part"}" >> $output_dir/add_content.tex
		fi
		echo -e "$blue >>> Fichier $item_s ajouté ! $default"
		echo "\input{"$item_s"}" >> $output_dir/add_content.tex
		done
fi
done


echo -e "$green"
echo -e "[Etape 3 / 8] >>> Génération du fichier d'importation des parties effectuée"

echo -e "[Etape 4 / 8] >>> Génération du fichier d'importation des bilbiothèques..."
#Génération du fichier d'inclusion des bibliothèques
echo -e "$blue"

#create Utils file
echo -e "%############################################################
%###### Package Utils 
%###### This package include Latex tools
%###### Author  : Nicolas LE GUERROUE
%###### Contact : nicolasleguerroue@gmail.com
%############################################################
%######
%###### Include packages
%######
%############################################################" > $utils_dir/Utils.sty
for item in $utils_dir/*
do
	#echo $output_dir/$item
	if [ -f "$item" ];then
		if [ `echo $item | grep Utils/Utils.sty` ];then
			echo -e "$green"
			echo -e ">>> Fichier d'inclusion des bibliothèques trouvée!"
			echo -e "$blue"
		else
			echo -e ">>> Bibliothèques "$item" importée !"
			lib_name=`echo $item | cut -d '.' -f1`
			echo -n "\usepackage{$lib_name}" >> $utils_dir/Utils.sty
			echo -e "" >> $utils_dir/Utils.sty
		fi
	fi
done
echo -e "$green"
echo -e "[Etape 4 / 8] >>> Première compilation du fichier $main.tex..."
echo -e "$orange"
pdflatex --output-dir=$output_dir $main >> render_report.txt
echo -e "$green"
echo -e "[Etape 4 / 8] >>> Première compilation du fichier $main.tex effectuée"
echo -e "[Etape 5 / 8] >>> Compilation du glossaire..."
echo -e "$orange"
makeglossaries $output_dir/$main >> render_report.txt
echo -e "$green"
echo -e "[Etape 5 / 8] >>> Compilation du glossaire effectuée"
echo -e "[Etape 6 / 8] >>> Compilation de la nomenclature...."
echo -e "$orange"
makeindex $output_dir/$main >> render_report.txt
makeindex $output_dir/$main.nlo -s nomencl.ist -o $output_dir/$main.nls >> render_report.txt
echo -e "$green"
echo -e "[Etape 6 / 8] >>> Compilation de la nomenclature effectuée"
echo -e "[Etape 7 / 8] >>> Seconde compilation du fichier $main.tex..."
echo -e "$orange"
pdflatex --output-dir=$output_dir $main >> render_report.txt
echo -e "$green"
echo -e "[Etape 7 / 8] >>> Seconde compilation du fichier $main.tex terminée"
echo -e "[Etape 8 / 8] >>> Déplacement du fichier $main.pdf..."
echo -e "$orange"
mv $output_dir/$main.pdf $main.pdf >> render_report.txt
echo -e "$green"
echo -e "[Etape 8 / 8] >>> Déplacement du fichier $main.pdf à la racine du projet..."
echo -e ">>> Compilation terminée ! $default"

if [ "$1" == "--git" ];then
	if [ "$2" == "" ];then
	echo -e "$red Abandon de la requête Git : message de mise à jour vide.$default"
	exit
	fi
	git add .
	git commit -m "$2"
	git push origin master
	echo -e "Mise à jour du dépot terminée !"
	exit
fi
