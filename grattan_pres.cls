\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grattan_pres}[2016//03/24 Presentations of the Grattan Institute, Melbourne]

\LoadClass[9pt,compress,t]{beamer}

\RequirePackage{mathspec}
\setsansfont[
BoldFont=arialbd.ttf,
ItalicFont=ariali.ttf,
BoldItalicFont=arialbi.ttf
]{arial.ttf}
\setromanfont[
BoldFont=arialbd.ttf,
ItalicFont=ariali.ttf,
BoldItalicFont=arialbi.ttf
]{arial.ttf}
\setmathsfont(Digits,Latin,Greek)[
Numbers={Lining,Proportional},
BoldFont=arialbd.ttf,
ItalicFont=ariali.ttf,
BoldItalicFont=arialbi.ttf]{arial.ttf}

% Right-alignment of title page
\setbeamertemplate{title page}[default][right]
\setbeamercolor{title}{fg=black}
\setbeamerfont{title}{series=\bfseries,size=\huge}
\setbeamerfont{author}{size=\Large}
\setbeamerfont{date}{size=\Large}

% Set up Grattan-like frametitle
\setbeamercolor{frametitle}{fg=black, bg=white}
\setbeamertemplate{frametitle}{%
\begin{beamercolorbox}[wd=0.75\textwidth, ht=1.4cm]{frametitle}
\usebeamerfont{frametitle}\bfseries\large\insertframetitle \\ \vspace{-8pt} \color{Orange}{\line(1,0){307}} \\ 
\end{beamercolorbox}   \normalfont\normalsize\color{black}{\insertframesubtitle}  \vspace{-3pt}
}

% Font sizes for items and sub-items
\setbeamertemplate{itemize/enumerate body begin}{\normalsize}
\setbeamertemplate{itemize/enumerate subbody begin}{\small}
\setbeamertemplate{itemize/enumerate subsubbody begin}{\small}

% include Grattan logo on each slide
\logo{\includegraphics[height=1cm]{logos/GrattanSVGLogo.pdf}\vspace{220pt}\hspace{21pt}}

% Helvetica font (like Arial)
%\RequirePackage{helvet}

% Slide numbers, 
\setbeamertemplate{footline}[frame number]
\setbeamertemplate{itemize item}[circle]
\setbeamertemplate{itemize subitem}{\hbox{\donotcoloroutermaths$-$}}
\setbeamertemplate{itemize subsubitem}{\hbox{\donotcoloroutermaths$*$}}
\setbeamerfont{frametitle}{size=\Large} 
\setbeamertemplate{titlepage}[right]
\setbeamertemplate{navigationsymbols}{}

% Line spacing
\RequirePackage{setspace}
\let\oldframetitle\frametitle% Store \frametitle in \oldframetitle
\renewcommand{\frametitle}[1]{%
  \oldframetitle{#1}\setstretch{1.1}}

% Assign a Grattan color to various components
\definecolor{Orange}{HTML}{F68B33}
\definecolor{OrangeBackground}{RGB}{254,240,222}  % for boxes
\definecolor{Color1}{RGB}{255,224,127}
\definecolor{Color2}{RGB}{255,195,90}
\definecolor{Color3}{RGB}{246,139,51}
\definecolor{Color4}{RGB}{212,88,42}
\definecolor{Color5}{RGB}{160,34,38}
\definecolor{Color6}{RGB}{98,18,20}
\definecolor{theGrey}{HTML}{6A737B}

\setbeamercolor{alerted text}{fg=Orange}
\setbeamercolor{background canvas}{bg=white}
\setbeamercolor{block body alerted}{bg=white}
\setbeamercolor{block body}{bg=white}
\setbeamercolor{block body example}{bg=white}
\setbeamercolor{item}{fg=Orange}
\setbeamercolor{item projected}{fg=Orange}
\setbeamercolor{normal text}{fg=black,bg=white}
\setbeamercolor{palette sidebar primary}{fg=red}
\setbeamercolor{palette sidebar quaternary}{fg=Color4}
\setbeamercolor{palette sidebar secondary}{fg=Orange}
\setbeamercolor{palette sidebar tertiary}{fg=Color2}
\setbeamercolor{section in sidebar}{fg=Orange}
\setbeamercolor{section in sidebar shaded}{fg=theGrey}
\setbeamercolor{separation line}{bg=Color4,fg=Orange}
\setbeamercolor{structure}{bg=white, fg=black}
\setbeamercolor{subsection in sidebar}{fg=Color2}
\setbeamercolor{subsection in sidebar shaded}{fg=grey}

% command so that charts can be copied and pasted straight from a report
\makeatletter
\g@addto@macro\@floatboxreset\centering
\makeatother

\newcommand{\captionwithunits}[2]{%
\frametitle{#1}
\framesubtitle{#2}
}

% set default height for charts
\setkeys{Gin}{height=0.7\textheight}

% New user friendly (less typing) \Caption?
\newcommand{\Caption}[3]{\captionwithunits{#1}{#2}\label{#3}}

\newcommand{\source}[1]{\flushleft\tiny\textit{Source:~#1}}
\newcommand{\notes}[1]{\tiny\textit{Notes:~#1}}

\RequirePackage[british]{babel}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=authoryear-ibid,ibidpage,loccittracker=context, autocite=footnote]{biblatex}
\renewcommand*{\bibfont}{\raggedright}
\DeclareLanguageMapping{british}{british-apa}

\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}

\renewbibmacro*{cite}{\printtext[citehyperref]{%
  \global\boolfalse{cbx:loccit}%
  \iffieldundef{shorthand}
    {\ifthenelse{\ifciteibid\AND\NOT\iffirstonpage}
       {\usebibmacro{cite:ibid}}
       {\ifthenelse{\ifnameundef{labelname}\OR\iffieldundef{labelyear}}
          {\usebibmacro{cite:label}%
           \setunit{\addspace}}
          {\printnames{labelname}%
           \setunit{\nameyeardelim}}%
        \usebibmacro{cite:paren:labelyear+extrayear}}}
    {\usebibmacro{cite:shorthand}}}}

\renewbibmacro*{cite:paren:labelyear+extrayear}{%
  \iffieldundef{labelyear}
    {}
    {\printtext[parens]{%
       \printfield{labelyear}%
       \printfield{extrayear}}}}
\renewbibmacro*{textcite:postnote}{%
  \ifbool{cbx:parens}%
    {\bibcloseparen\global\boolfalse{cbx:parens}}%
    {}%
  \iffieldundef{postnote}%
    {}%
    {\savefield{namehash}{\cbx@lastyear}%
     \setunit{\postnotedelim}%
     \printfield{postnote}}%
  \ifthenelse{\value{multicitecount}=\value{multicitetotal}}%
    {}%
    {\textcitedelim}}% Not \multicitedelim ???

%% Bibliography formatting
% separating entries
\setlength\bibitemsep{1.5\itemsep}
% format bibliography
\renewcommand*{\bibfont}{\small}
\DeclareFieldFormat{url}{\url{#1}}

%% Citation tweaking
\DeclareFieldFormat{titlecase}{#1}
\setlength\bibhang{.25in}
\renewcommand*{\bibnamedash}{%
  \ifdimless{\leftmargin}{0.75em}
    {\mbox{\textemdash\space}}
    {\makebox[\leftmargin][l]{%
       \ifdimless{\leftmargin}{1.25em}
         {\textendash}
         {\rule[3pt]{0.8\bibhang}{.2pt}}}}}
         
% Hyperlinks entire citation label for most citation commands 
% http://tex.stackexchange.com/questions/15951/hyperlink-name-with-biblatex-authoryear-biblatex-1-4b
\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}

\DeclareFieldFormat{textcitehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{%
    #1%
    \ifbool{cbx:parens}
      {\bibcloseparen\global\boolfalse{cbx:parens}}
      {}}}

\savebibmacro{cite}
\savebibmacro{textcite}

\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}

\renewbibmacro*{textcite}{%
  \ifboolexpr{
    ( not test {\iffieldundef{prenote}} and
      test {\ifnumequal{\value{citecount}}{1}} )
    or
    ( not test {\iffieldundef{postnote}} and
      test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )
  }
    {\DeclareFieldAlias{textcitehyperref}{noformat}}
    {}%
  \printtext[textcitehyperref]{%
    \restorebibmacro{textcite}%
    \usebibmacro{textcite}}}

% The following lines give the correct footcite Author (Year) but make the ibid erroneous
% Author (ibid) % use ifciteibid
\DeclareCiteCommand{\footcite}[\mkbibfootnote]
  {\boolfalse{cbx:parens}}
  {\usebibmacro{citeindex}%
  \ifciteibid{Ibid.}{%  % for ibidem
   \iffirstcitekey
     {\setcounter{textcitetotal}{1}}
     {\stepcounter{textcitetotal}%
      \textcitedelim}%
   \usebibmacro{textcite}}%
   }
  {\ifbool{cbx:parens}
     {\bibcloseparen\global\boolfalse{cbx:parens}}
     {}}
  {\usebibmacro{textcite:postnote}}
\newcommand{\gcite}[1]{{\citeauthor{#1} (\citedate{#1})}}


% Change format of `blocks' to emphasize text:
\setbeamercolor{block title}{bg=Orange,fg=white}
\setbeamerfont{block title}{series=\bfseries}
\setbeamercolor{block body}{bg=OrangeBackground,fg=black}
\setbeamertemplate{blocks}[rounded][shadow=true]