\PassOptionsToPackage{table,xcdraw}{xcolor}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uia}[2017 Class for UiA Computer Science Thesis]

%
% Set default values for the variables used by our implementation of \maketitle
%

\newcommand{\SubTitle}{}
\newcommand{\SuperVisor}{Supervisor Name}
\newcommand{\DegreeType}{"Insert Degree"}
\newcommand{\Faculty}{ }
\newcommand{\Department}{}
\newcommand{\CopyrightNotice}{}
\newcommand{\ISBNPrinted}{N/A}
\newcommand{\ISBNElectronic}{N/A}
\newcommand{\SerialNumber}{\number\year:N/A}
\newcommand{\Month}{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi}
\newcommand{\Year}{\number\year}
\renewcommand{\@author}{Firstname-Middlename Lastname}
\renewcommand{\@title}{Thesis Name}

%
% Set the default values for margin settings
%
\newcommand{\GeometryOptions}{margin=20mm,top=15mm,bindingoffset=10mm}
\newcommand{\CropOptions}{}
\newcommand{\CropLandscapeFlag}{}

%
% Commodity command to give two different versions of code, the first for printout mode
% and the second for screen mode. Useful for large pictures and layouts in absolute units.
%
\newcommand{\printandscreen}[2]{\ifthenelse{\isundefined{\ScreenMode}}{#1}{#2}}

%
% Process options passed to the class
%
\DeclareOption{a4crop}{\renewcommand{\CropOptions}{cam,a4,center}}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{screen}{
	\renewcommand{\CropLandscapeFlag}{landscape}
	\renewcommand{\GeometryOptions}{margin=10mm,screen}
	\newcommand{\ScreenMode}{true}
}
\DeclareOption*{\PackageWarning{uia}{Unknown option `\CurrentOption´.}}
\ProcessOptions\relax

\LoadClass[b5paper,11pt,twoside,openright,onecolumn,titlepage]{report}

% Set appropriate margins
\RequirePackage[\GeometryOptions,includeheadfoot,headheight=14.5pt]{geometry}

% Set cropping marks, if a4crop has been specified.
\RequirePackage[\CropOptions,\CropLandscapeFlag]{crop}

% Necessary to set the headers; notice that right and left headers are swapped.
\RequirePackage{fancyhdr}

% Used in some conditional statements
\RequirePackage{ifthen}

% Necessary to include the UIA logo
\RequirePackage{graphicx}

% Need Colorx for front page
\RequirePackage[pages=some]{background}

\RequirePackage{hyphenat}

\RequirePackage{tocloft}

% Include some regular used packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage[utf8]{inputenc}

\RequirePackage{glossaries}
\RequirePackage{algorithm}% http://ctan.org/pkg/algorithms
\RequirePackage{algpseudocode}% http://ctan.org/pkg/algorithmicx
\RequirePackage{booktabs} % For prettier tables
\RequirePackage{multirow}
\RequirePackage{pdfpages}
\RequirePackage{footnote}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{emptypage}

\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}




\newenvironment{preface}
{
	\thispagestyle{plain}
	\addcontentsline{toc}{chapter}{\numberline{}Preface}%
	\null\vfil
	\@beginparpenalty\@lowpenalty
	\begin{center}%
		\bfseries Preface
		\@endparpenalty\@M
\end{center}}%
{\par\vfil\null}

\newcommand{\listpublicationname}{List of Publications}
\newlistof{publication}{pub}{\listpublicationname}
\newcommand{\publication}[1]{%
	\refstepcounter{publication}
	\addcontentsline{pub}{publication}
	{\protect\numberline{\thechapter.}#1}\par}


\renewenvironment{abstract}
{
	\thispagestyle{plain}
	\addcontentsline{toc}{chapter}{\numberline{}Abstract}%
	\null\vfil
	\@beginparpenalty\@lowpenalty
	\begin{center}%
		\bfseries Abstract
		\@endparpenalty\@M
\end{center}}%
{\par\vfil\null}


%
% Define the commands to set the variables used by \maketitle
%

\newcommand{\subtitle}[1]{\renewcommand{\SubTitle}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\SuperVisor}{#1}}
\newcommand{\degreetype}[1]{\renewcommand{\DegreeType}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\Faculty}{#1}}
\newcommand{\department}[1]{\renewcommand{\Department}{#1}}
\newcommand{\copyrightnotice}[1]{\renewcommand{\CopyrightNotice}{#1}}
\newcommand{\isbnprinted}[1]{\renewcommand{\ISBNPrinted}{#1}}
\newcommand{\isbnelectronic}[1]{\renewcommand{\ISBNElectronic}{#1}}
\newcommand{\serialnumber}[1]{\renewcommand{\SerialNumber}{#1}}
\newcommand{\setyear}[1]{\renewcommand{\Year}{#1}}
\newcommand{\setmonth}[1]{\renewcommand{\Month}{#1}}

\backgroundsetup{
	scale=1,
	color=black,
	opacity=0.4,
	angle=0,
	contents={%
		\includegraphics[width=\paperwidth,height=\paperheight]{bg}
	}%
}


%
% Override the \maketitle command
%
\renewcommand{\maketitle}{
	\begin{titlepage}
	\newgeometry{top=0.6in,bottom=1in,right=2cm,left=6cm}
	\BgThispage	
	\parindent=0cm
	
	\begin{center}



	% UiA Logo
	\begin{picture}(0,0) \put(0, 0 ){\hbox{\includegraphics[scale=0.85]{uia_eng}}}\end{picture} 
	
	% Title
	\printandscreen{\vspace{3cm}}{\vspace{0.5cm}}
	\begingroup
	\fontsize{18pt}{12pt}\selectfont
	\nohyphens{\textbf{\@title}}
	\endgroup
	
	% Subtitle
	{\LARGE \SubTitle}
	\vfill

	
	\printandscreen{\vspace{3cm}}{\vspace{0.5cm}}
	\begingroup
	\fontfamily{verdana}\fontsize{14pt}{12pt}\selectfont
	\textbf{\@author} % MakeUppercase\ ? 
	\endgroup
	
	\printandscreen{\vspace{5cm}}{\vspace{0.5cm}}
	\begingroup
	\fontfamily{verdana}\fontsize{14pt}{12pt}\selectfont
	SUPERVISORS
	\endgroup
	
	\begingroup
	\fontfamily{verdana}\fontsize{11pt}{12pt}\selectfont
	\textbf{\SuperVisor}
	\endgroup
	
	\printandscreen{\vspace{4cm}}{\vspace{0.5cm}}
	{
		Master's Thesis \\
		\textbf{University of Agder, \Year} \\
		\Faculty \\
		\Department
	}
	\printandscreen{\vspace{2cm}}{\vspace{0.75cm}}
	
	\end{center}
	
	\restoregeometry

	%\includegraphics[width=0.4\textwidth]{NTNUlogo}

	\newpage

	\thispagestyle{empty}
	
	{~}
	\vfill
	{
	\scriptsize
	\textbf{UiA}

	University of Agder

	Master's thesis\\
	%for the degree of \DegreeType

	\Faculty\ \\
	\Department

	\copyright\ \Year\ \@author. \CopyrightNotice\\
	%ISBN \ISBNPrinted\ (printed version)\\
	%ISBN \ISBNElectronic\ (electronic version)\\
	%ISSN TODO

	%Master's theses at UiA, \SerialNumber

	%Printed by University of Agder
	}
	\end{titlepage}
}

% Back cover
\newcommand*\cleartoleftpage{%
	\clearpage
	\ifodd\value{page}\hbox{}\vspace*{\fill}\thispagestyle{empty}\newpage\fi
}

\newcommand{\makebackcover}{
	\thispagestyle{empty}
	\cleartoleftpage
	\BgThispage
	\newgeometry{top=0in,bottom=0in,right=5cm,left=0cm}
	{~}
	\vfill
	{
		\scriptsize
		\textbf{UiA} University of Agder\\
		Master's thesis\\
		\Faculty\ \\
		\Department
		
		\copyright\ \Year\ \@author. \CopyrightNotice\\
	}
	\restoregeometry

}

\AtBeginDocument{
	\pagestyle{fancy}
	\renewcommand{\contentsname}{Table of Contents}
	\renewcommand{\headrulewidth}{0.4pt}
	\renewcommand{\sectionmark}[1]{\markright{\textbf{\thesection.\ #1}}}
	\renewcommand{\chaptermark}[1]{\markboth{\textbf{#1}}{}}
	\rhead{\nouppercase{\leftmark}}
	\lhead{\nouppercase{\rightmark}}
	
	
	%\printandscreen{	
		%\fancyhead{}
		%\fancyhead[LO, RE]{\leftmark}
		% \fancyhead[LE,RO]{\textbf{\thepage}}
	%}{	
		%\fancyhead{}
		%\fancyhead[LO, RE]{\leftmark}
		% \fancyhead[R]{\textbf{\thepage}}
	%}
	% \fancyfoot[C]{}
	\fancyfoot[CE,CO]{\thepage}
}

\makeglossaries



