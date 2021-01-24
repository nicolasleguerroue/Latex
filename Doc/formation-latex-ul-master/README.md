> Ceci est le fichier `README.md` du paquetage LaTeX
> `formation-latex-ul`. Les noms de répertoires ci-dessous sont ceux
> du paquetage et non ceux du dépôt.
>
> Le paquetage est distribué via
> [CTAN](https://www.ctan.org/pkg/formation-latex-ul).
>
> La
> [page du projet](https://vigou3.gitlab.io/formation-latex-ul)
> fournit de l'information plus détaillée sur le paquetage.

# formation-latex-ul

Package **formation-latex-ul** contains the supporting documentation,
slides, exercise files and templates for an introductory LaTeX course
(in French) prepared for Université Laval, Québec, Canada.

## License

Creative Commons Attribution-ShareAlike 4.0 International.

## Author

Vincent Goulet <vincent.goulet@act.ulaval.ca>

> The rest of this file is in French for the target audience.

# formation-latex-ul

Le paquetage **formation-latex-ul** propose une formation à
l'utilisation de LaTeX développée à l'origine pour la Bibliothèque de
l'[Université Laval](https://www.ulaval.ca).

La formation est formée des éléments suivants:

1. *Rédaction avec LaTeX*, un document de référence de près de
   200 pages; voir le fichier `doc/formation-latex-ul.pdf`;

2. des diapositives pour une formation en classe couvrant grosso modo
   les quatre premiers chapitres du document de référence; voir le
   fichier `doc/formation-latex-ul-diapos.pdf`;

3. les fichiers nécessaires pour compléter certains exercices, ainsi
   qu'un gabarit pour composer les solutions des autres exercices; voir
   le dossier `doc/`.

Les quatre premiers chapitres du document de référence couverts par
les diapositives traitent des concepts de base pour un nouvel
utilisateur de LaTeX: processus d'édition, compilation, visualisation;
séparation du contenu et de l'apparence du texte; mise en forme du
texte; séparation du document en parties; rudiments du mode
mathématique.

Les six autres chapitres du document de référence visent à rendre
l'utilisateur de LaTeX débutant ou intermédiaire autonome dans la
rédaction de documents relativement complexes comportant des tableaux,
des figures, des équations mathématiques élaborées, une bibliographie,
etc.

## Composition des documents

Le dossier `source/` contient tous les fichiers nécessaires pour
composer le document principal et les diapositives avec XeLaTeX. La
compilation du document requiert les polices de caractères suivantes:

- [Lucida Bright OT, Lucida Math OT et Lucida Mono DK](https://tug.org/store/lucida/). 
  Ces polices de très grande qualité sont payantes. La Bibliothèque de
  l'Université Laval détient une licence d'utilisation de cette
  police. Les étudiants et le personnel de l'Université peuvent s'en
  procurer une copie gratuitement en écrivant à
  [mailto:lucida@bibl.ulaval.ca].
- [Fira Sans](https://www.fontsquirrel.com/fonts/fira-sans) (les
  versions OpenType de Mozilla) en graisses *Book*, *Semi Bold*, *Book
  Italic* et *Semi Bold Italic*.
- [Font Awesome](https://fontawesome.com/). Cette police fournit une
  multitude d'icônes et de symboles. Depuis octobre 2020, le document
  utilise la version 5.x de la police. Celle-ci est normalement
  installée avec TeX Live.
