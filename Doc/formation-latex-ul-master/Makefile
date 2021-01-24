### -*-Makefile-*- pour préparer le paquetage formation-latex-ul
##
## Copyright (C) 2019 Vincent Goulet
##
## 'make pdf' (recette par défaut) compile les documents auxiliaires,
## puis le document principal et les diapositives avec XeLaTeX.
##
## 'make update-copyright' met à jour l'année de copyright dans toutes
## les sources du document
##
## 'make zip' crée l'archive du paquetage conformément aux exigences
## de CTAN.
##
## 'make release' crée une nouvelle version dans GitLab et téléverse
## le fichier .zip. Il n'y a pas de lien vers cette version dans la
## page web.
##
## Auteur: Vincent Goulet
##
## Ce fichier fait partie du projet formation-latex-ul
## https://gitlab.com/vigou3/formation-latex-ul


## Nom du paquetage sur CTAN
PACKAGENAME = formation-latex-ul

## Principaux fichiers
MASTER = ${PACKAGENAME}.pdf
MASTERDIAPOS = ${PACKAGENAME}-diapos.pdf
ARCHIVE = ${PACKAGENAME}.zip
README = README.md
NEWS = NEWS
LICENSE = LICENSE
CONTRIBUTING = CONTRIBUTING.md

## Informations de publication extraites du fichier maitre
TITLE = $(shell grep "\\\\title" ${MASTER:.pdf=.tex} \
	| cut -d { -f 2 | tr -d })
REPOSURL = $(shell grep "newcommand{\\\\reposurl" ${MASTER:.pdf=.tex} \
	| cut -d } -f 2 | tr -d {)
YEAR = $(shell grep "newcommand{\\\\year" ${MASTER:.pdf=.tex} \
	| cut -d } -f 2 | tr -d {)
MONTH = $(shell grep "newcommand{\\\\month" ${MASTER:.pdf=.tex} \
	| cut -d } -f 2 | tr -d {)
VERSION = ${YEAR}.${MONTH}

## Sources du document principal
TEXFILESMAIN = \
	$(filter-out ${MASTER:.pdf=.tex} \
	               $(wildcard *-diapos.tex) \
	               $(wildcard solutions-*.tex),\
		     $(wildcard *.tex)) \
	${MASTER:.pdf=.bib} \
	francais.bst

## Sources des diapositives
TEXFILESDIAPOS = $(wildcard *-diapos.tex)

## Documents auxiliaires insérés dans le document principal (et donc à
## compiler avant)
AUXDOC = $(addsuffix .pdf,$(basename $(wildcard auxdoc/*.tex)))

## Fichiers de code source (aucun traitement préalable)
LISTINGS = $(wildcard listings/*)

## Fichiers des exercices (sans les solutions)
EXERCICES = $(filter-out $(wildcard exercices/*-solution*),$(wildcard exercices/*))

## Images
IMAGES = $(wildcard images/*)

## Liens symboliques vers des fichiers de source/ à insérer dans doc/
## (pour éviter les doublons qui ne sont pas tolérés par CTAN)
SYMLINKS = \
	images/ul_p.pdf \
	formation-latex-ul.bib

# Outils de travail
TEXI2DVI = LATEX=xelatex TEXINDY=makeindex texi2dvi -b
CP = cp -pR
RM = rm -r

## L'archive doit débuter par un répertoire portant le nom du
## paquetage
BUILDDIR = ${PACKAGENAME}

## Dépôt GitLab et authentification
REPOSNAME = $(shell basename ${REPOSURL})
APIURL = https://gitlab.com/api/v4/projects/vigou3%2F${REPOSNAME}
OAUTHTOKEN = $(shell cat ~/.gitlab/token)

## Variable automatique
TAGNAME = v${VERSION}


all: pdf

${AUXDOC}:
	cd auxdoc && \
	${TEXI2DVI} $(notdir ${AUXDOC:.pdf=.tex})

${MASTER}: ${MASTER:.pdf=.tex} ${TEXFILESMAIN} \
	   ${AUXDOC} ${LISTINGS} ${EXERCICES} ${IMAGES}
	${TEXI2DVI} ${MASTER:.pdf=.tex}

${MASTERDIAPOS}: ${MASTERDIAPOS:.pdf=.tex} ${TEXFILESDIAPOS} \
	         ${AUXDOC} ${EXERCICES} ${IMAGES}
	${TEXI2DVI} ${MASTERDIAPOS:.pdf=.tex}

.PHONY: pdf
pdf: ${MASTER} ${MASTERDIAPOS}

.PHONY: release
release: update-copyright zip check-status upload create-release publish

.PHONY: update-copyright
update-copyright: ${MASTER:.pdf=.tex} ${TEXFILESMAIN} ${TEXFILESDIAPOS}
	for f in $?; \
	    do sed -E '/^(#|%)* +Copyright \(C\)/s/20[0-9]{2}/${YEAR}/' \
	           $$f > $$f.tmp && \
	           ${CP} $$f.tmp $$f && \
	           ${RM} $$f.tmp; \
	done

.PHONY: zip
zip: ${MASTER} ${MASTERDIAPOS} ${README} ${NEWS} ${LICENSE} ${CONTRIBUTING}
	if [ -d ${BUILDDIR} ]; then ${RM} ${BUILDDIR}; fi
	mkdir -p ${BUILDDIR}/source/auxdoc \
	         ${BUILDDIR}/source/listings \
	         ${BUILDDIR}/source/images \
	         ${BUILDDIR}/doc
	touch ${BUILDDIR}/${README} && \
	  awk '(state == 0) && /^# / { state = 1 }; \
	       /^## Author/ { printf("## Version\n\n%s\n\n", "${VERSION}") } \
	       state' ${README} >> ${BUILDDIR}/${README}
	${CP} ${NEWS} ${LICENSE} ${CONTRIBUTING} ${BUILDDIR}
	${CP} ${MASTER:.pdf=.tex} \
	      ${TEXFILESMAIN} \
	      ${MASTERDIAPOS:.pdf=.tex} \
	      ${TEXFILESDIAPOS} ${BUILDDIR}/source
	${CP} ${AUXDOC} \
	      ${AUXDOC:.pdf=.tex} ${BUILDDIR}/source/auxdoc
	${CP} ${LISTINGS} ${BUILDDIR}/source/listings
	${CP} ${IMAGES} ${BUILDDIR}/source/images
	${CP} ${MASTER} \
	      ${MASTERDIAPOS} \
	      ${EXERCICES} ${BUILDDIR}/doc
	cd ${BUILDDIR}/doc && \
	  for file in ${SYMLINKS}; do ln -s ../source/$$file; done
	zip --filesync --symlinks -r ${ARCHIVE} ${BUILDDIR}
	${RM} ${BUILDDIR}

.PHONY: check-status
check-status:
	@echo ----- Checking status of working directory...
	@if [ "master" != $(shell git branch --list | grep ^* | cut -d " " -f 2-) ]; then \
	     echo "not on branch master"; exit 2; fi
	@if [ -n "$(shell git status --porcelain | grep -v '^??')" ]; then \
	     echo "uncommitted changes in repository; not creating release"; exit 2; fi
	@if [ -n "$(shell git log origin/master..HEAD)" ]; then \
	    echo "unpushed commits in repository; pushing to origin"; \
	     git push; fi

.PHONY: upload
upload:
	@echo ----- Uploading archive to GitLab...
	$(eval upload_url=$(shell curl --form "file=@${ARCHIVE}" \
	                               --header "PRIVATE-TOKEN: ${OAUTHTOKEN}"	\
	                               --silent \
	                               ${APIURL}/uploads \
	                          | awk -F '"' '{ print $$8 }'))
	@echo url to file:
	@echo "${upload_url}"
	@echo ----- Done uploading files

.PHONY: create-release
create-release :
	@echo ----- Creating release on GitLab...
	if [ -e relnotes.in ]; then ${RM} relnotes.in; fi
	touch relnotes.in
	awk 'BEGIN { ORS = " "; print "{\"tag_name\": \"${TAGNAME}\"," } \
	      /^$$/ { next } \
	      (state == 0) && /^# / { \
		state = 1; \
		out = $$2; \
	        for(i = 3; i <= NF; i++) { out = out" "$$i }; \
	        printf "\"name\": \"Édition %s\", \"description\":\"", out; \
	        next } \
	      (state == 1) && /^# / { exit } \
	      state == 1 { printf "%s\\n", $$0 } \
	      END { print "\",\"assets\": { \"links\": [{ \"name\": \"${ARCHIVE}\", \"url\": \"${REPOSURL}${upload_url}\" }] }}" }' \
	     ${NEWS} >> relnotes.in
	curl --request POST \
	     --header "PRIVATE-TOKEN: ${OAUTHTOKEN}" \
	     "${APIURL}/repository/tags?tag_name=${TAGNAME}&ref=master"
	curl --request POST \
	     --data @relnotes.in \
	     --header "PRIVATE-TOKEN: ${OAUTHTOKEN}" \
	     --header "Content-Type: application/json" \
	     --output /dev/null --silent \
	     ${APIURL}/releases
	${RM} relnotes.in
	@echo ----- Done creating the release

.PHONY: publish
publish:
	@echo ----- Publishing the web page...
	git checkout pages && \
	  ${MAKE} && \
	  git checkout master
	@echo ----- Done publishing

.PHONY: check-url
check-url: ${MASTER:.pdf=.tex} ${TEXFILESMAIN} \
	   ${MASTERDIAPOS:.pdf=.tex} ${TEXFILESDIAPOS} \
	   ${AUXDOC} ${EXERCICES}
	@echo ----- Checking urls in sources...
	$(eval url=$(shell grep -E -o -h 'https?:\/\/[^./]+(?:\.[^./]+)+(?:\/[^ ]*)?' $? \
		   | cut -d \} -f 1 \
		   | cut -d ] -f 1 \
		   | cut -d '"' -f 1 \
		   | sort | uniq))
	for u in ${url}; \
	    do if curl --output /dev/null --silent --head --fail --max-time 5 $$u; then \
	        echo "URL exists: $$u"; \
	    else \
		echo "URL does not exist (or times out): $$u"; \
	    fi; \
	done

.PHONY: clean
clean:
	${RM} ${MASTER} \
	      ${ARCHIVE} \
	      solutions-* \
	      *.aux *.log *.blg *.bbl *.out *.ilg *.idx *.ind
