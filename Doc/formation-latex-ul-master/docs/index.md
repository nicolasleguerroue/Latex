---
title: Rédaction avec LaTeX
tagline: La formation LaTeX de l'Université Laval
description: Formation en français sur l'utilisation du système de mise en page LaTeX
---

# Présentation

*Rédaction avec LaTeX* est une formation à l'utilisation du système de
mise en page [LaTeX](https://fr.wikipedia.org/wiki/LaTeX) développée
pour la Bibliothèque de l'[Université Laval](https://www.ulaval.ca).
Elle est distribuée sous forme de paquetage dans le site
[Comprehensive TeX Archive Network (CTAN)](https://ctan.org/); voir
[ci-dessous](#obtenir) pour les détails.

La formation contient:

- un document de référence de près de 200 pages;
- les diapositives pour une formation en classe couvrant grosso modo
  les quatre premiers chapitres du document de référence;
- tous les fichiers nécessaires pour compléter les exercices.


# Thèmes abordés

Les quatre premiers chapitres du document de référence (ceux couverts
par les diapositives) traitent des concepts de base pour un nouvel
utilisateur: 

- processus d'édition, compilation, visualisation;
- séparation du contenu et de l'apparence du texte; 
- mise en forme du texte;
- séparation du document en parties;
- rudiments du mode mathématique.

Les six autres chapitres visent à rendre l'utilisateur de LaTeX
débutant ou intermédiaire autonome dans la rédaction de documents
relativement complexes comportant des tableaux, des figures, des
équations mathématiques élaborées, une bibliographie, etc.

La table des matières abrégée est reproduite [ci-dessous](#tdm)


# <a name="obtenir"></a> Obtenir la formation

Le paquetage contenant la formation est distribué via
[CTAN](https://ctan.org/pkg/formation-latex-ul).

Le paquetage fait également partie des distributions
[TeX Live](https://tug.org/texlive) et [MiKTeX](https://miktex.org).
Le document de référence et les diapositives sont accessibles depuis une invite
de commande avec la commande `texdoc`.

```bash
texdoc formation-latex-ul
texdoc formation-latex-ul-diapos
```

La plupart des logiciels intégrés de rédaction LaTeX offrent une
interface pour accéder à la documentation.

- [TeXShop](http://www.texshop.org/): menu `Aide|Afficher l'aide pour le package`.
- [Texmaker](http://www.xm1math.net/texmaker/index_fr.html): menu `Aide|TeXDoc [selection]`.
- [GNU Emacs](http://www.gnu.org/software/emacs/): commande `TeX-doc`du mode spécialisé
  [AUCTeX](https://www.gnu.org/software/auctex).

Une
[mise à jour](http://tex.stackexchange.com/questions/55437/how-do-i-update-my-tex-distribution)
de votre distribution peut s'avérer nécessaire pour obtenir la plus
récente version de la formation.


# Prérequis pour la formation

Vous devez disposer d'une distribution LaTeX sur votre poste de
travail. Nous recommandons la distribution [TeX
Live](https://tug.org/texlive).
	
- [Vidéo explicative de l'installation sur macOS](https://youtu.be/kA53EQ3Q47w)
- [Vidéo explicative de l'installation sur Windows](https://youtu.be/7MfodhaghUk)

Les logiciels de rédaction intégrés facilitent grandement l'édition de
document LaTeX. 

- La distribution [TeX Live](https://tug.org/texlive) pour Windows est
  livrée avec [TeXworks](http://www.tug.org/texworks/). Nous
  recommandons plutôt d'installer
  [Texmaker](http://www.xm1math.net/texmaker/index_fr.html).
- La distribution [MacTeX](http://tug.org/mactex/) (TeX Live pour
  macOS) est livrée avec l'excellent éditeur
  [TeXShop](http://www.texshop.org/). Il n'y a donc rien d'autre à
  installer.

Enfin, nous recommandons de composer un premier document très simple
de type «Hello World!». (Il s'agit de l'exercice 1.1 du document de
référence.)

- [Démonstration sur macOS avec TeXShop](https://youtu.be/vZfiZUSsP68)
- [Démonstration sur Windows avec Texmaker](https://youtu.be/mMgFVQhZbiM)


# Quelques caractéristiques

- Traitement de certains thèmes moins souvent abordés dans les
  documents d'introduction à LaTeX:
    - principe de séparation du contenu et de l'apparence;
    - renvois automatiques dans les documents PDF avec **hyperref**;
    - document contenu dans plusieurs fichiers;
    - changement de la police de caractères du document;
    - conception de beaux tableaux avec **booktabs**;
    - utilisation de la couleur dans un document;
    - production de rapports avec analyse intégrée (programmation
      lettrée de type [Sweave](https://en.wikipedia.org/wiki/Sweave));
    - remplacement des classes de documents standards par la classe
      [memoir](http://texdoc.net/pkg/memman).
- Vidéos explicatives sur l'installation de la distribution TeX Live
  sur [macOS](https://youtu.be/kA53EQ3Q47w) et
  [Windows](https://youtu.be/7MfodhaghUk).
- Vidéos explicatives sur la composition d'un premier document très
  simple sur [macOS avec TeXShop](https://youtu.be/vZfiZUSsP68) et sur
  [Windows avec Texmaker](https://youtu.be/mMgFVQhZbiM).
- Large place faite à l'utilisation de LaTeX en français.
- Renvois vers la documentation d'un paquetage ou d'une classe dans le
  site [TeXdoc Online](http://texdoc.net).
- Nombreuses remarques spécifiques à la classe de documents
  [ulthese](https://ctan.org/pkg/ulthese) pour les étudiantes et
  étudiants de l'Université Laval occupés à la rédaction de leur thèse
  ou de leur mémoire. (Les autres lecteurs pourront sans mal escamoter
  ces passages.)
- Exercices à la fin de chaque chapitre. (Les solutions sont fournies en
  annexe.)
- Index colligeant les références aux commandes et environnements
  LaTeX, aux paquetages et aux classes.
- Rubriques *Conseil du TeXpert* offrant conseils et astuces glanés au
  fil de nos vingt années d'utilisation de LaTeX.


# <a name="tdm"></a> Table des matières abrégée

Introduction  
1\. Présentation de TeX et LaTeX  
2\. Principes de base  
3\. Organisation d'un document  
4\. Apparence et disposition du texte  
5\. Boîtes  
6\. Tableaux et figures  
7\. Mathématiques  
8\. Bibliographie et citations  
9\. Commandes et environnements définis par l'usager  
10\. Trucs et astuces divers  
A. Classe pour les thèses et mémoires de l'Université Laval  
B. Solutions des exercices  
Bibliographie  
Index


## Accolades

Non pas les caractères typographiques si communs dans LaTeX, mais
plutôt celles que l'on donne en signe de reconnaissance. Ce document a
été en grande partie rédigé à la
[Brulerie Vieux-Limoilou](http://lesbruleries.com) et à la
[Brasserie artisanale La Souche](http://www.lasouche.ca). Dont acte!
