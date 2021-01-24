%############################################################
%###### Class 'Utils' 
%###### Author  : Nicolas LE GUERROUE
%###### Contact : nicolasleguerroue@gmail.com
%############################################################
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utils_report}[15/01/2021 Classe personnelle Utils pour document report, V1.0]
\LoadClass[12pt]{report}
\RequirePackage[french]{babel}  
\RequirePackage{Utils}        %Utils package


%Quotes
\RequirePackage{cite}
\RequirePackage{epigraph}
\RequirePackage{quotchap}

\newcommand{\addQuote}[2]{
   \epigraph{\textit{\og #1 \fg{}}}{#2}
}


\listfiles

%################################################################
