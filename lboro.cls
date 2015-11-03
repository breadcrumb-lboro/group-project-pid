%
% lboro v1.0
% Developed by Gary Bennett <g.bennett-13@student.lboro.ac.uk>
%
% Originally created for Computer Science 3rd year Thesis at
% Loughboroough University.
%
%---------------------------- Identification -----------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lboro}[2014/12/24 v1.0 lboro thesis class]
%-------------------------------------------------------------------------------

\newif\if@logo
\@logofalse

\newif\if@heading
\@headingfalse

\newif\if@apa
\@apafalse

\DeclareOption{logo}{\@logotrue}
\DeclareOption{heading}{\@headingtrue}
\DeclareOption{apa}{\@apatrue}

\ProcessOptions\relax

\LoadClass[a4paper,twoside]{article}

%\if@apa
%  \bibliographystyle{apalike}
%\else
%  \bibliographystyle{plain}
%\fi

%---------------------------- Packages -----------------------------------------
\RequirePackage[margin=3.5cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{mathptmx}
\RequirePackage[scaled=0.92]{helvet}
\RequirePackage{courier}
\RequirePackage[mathscr]{euscript}
\RequirePackage[titletoc,title]{appendix}
\RequirePackage[english]{babel}
\RequirePackage[{protrusion=true,expansion=true}]{microtype}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage[dvipsnames,svgnames,usenames]{xcolor}
\RequirePackage{tikz}
\RequirePackage{pdflscape}
\RequirePackage{booktabs}
\RequirePackage[bottom]{footmisc}
\RequirePackage{pgfgantt}
\RequirePackage{framed}
%-------------------------------------------------------------------------------

\usetikzlibrary{arrows}

%--------------------------- Declarations --------------------------------------
%\def\degree#1{\gdef\@degree{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
%\def\submitdate#1{\gdef\@submitdate{#1}}
%-------------------------------------------------------------------------------

\gdef\@subtitle{}

\AtBeginDocument{%
  \let\@uthor\@author%
  \let\@itle\@title%
  \let\@ate\@date%
}

%--------------------------- Font && Linespacing -------------------------------
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}

\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xpt\@xiipt%
  \abovedisplayskip 10\p@%
  \abovedisplayshortskip \z@%
  \belowdisplayshortskip 6\p@%
  \belowdisplayskip \abovedisplayskip%
  \let\@listi\@listI%
}%

\renewcommand\small{%
  \@setfontsize\small{8.5}{10}%
  \abovedisplayskip 8.5\p@%
  \abovedisplayshortskip \z@%
  \belowdisplayshortskip 4\p@%
  \def\@listi{\leftmargin\leftmargini%
              \parsep \z@ \@plus\p@ \@minus\p@%
              \topsep 6\p@ \@plus2\p@ \@minus4\p@%
              \itemsep\z@}%
  \belowdisplayskip \abovedisplayskip%
}%

\let\footnotesize=\small
\renewcommand\Large{\@setfontsize\large{14}{16}}
\newcommand\LArge{\@setfontsize\Large{16}{18}}
\renewcommand\LARGE{\@setfontsize\LARGE{18}{20}}

\newcommand{\normallinespacing}{\renewcommand{\baselinestretch}{1.5}\normalsize}
\newcommand{\mediumlinespacing}{\renewcommand{\baselinestretch}{1.2}\normalsize}
\newcommand{\narrowlinespacing}{\renewcommand{\baselinestretch}{1.1}\normalsize}
%-------------------------------------------------------------------------------


%---------------------------- Section Style ------------------------------------
\newcommand{\partnumsize}{\LArge}
\newcommand{\partnumstyle}{\bfseries\boldmath}
\newcommand{\partsize}{\LARGE}
\newcommand{\partstyle}{\bfseries\boldmath}
\newcommand{\chapnumsize}{\Large}
\newcommand{\chapnumstyle}{\bfseries\boldmath}
\newcommand{\chapsize}{\LArge}
\newcommand{\chapstyle}{\bfseries\boldmath}
\newcommand{\chapauthsize}{\normalsize}
\newcommand{\chapauthstyle}{\bfseries\boldmath}
\newcommand{\mottosize}{\small}
\newcommand{\mottostyle}{\itshape\unboldmath\raggedright}
\newcommand{\secsize}{\large}
\newcommand{\secstyle}{\bfseries\boldmath}
\newcommand{\subsecsize}{\large}
\newcommand{\subsecstyle}{\bfseries\itshape\boldmath}
\newcommand{\subsubsecstyle}{\bfseries\boldmath}

\def\url#1{#1}

\renewcommand\section%
{%
  \@startsection{section}{1}{\z@}%
  {-30\p@}%
  {16\p@}%
  {\normalfont\secsize\secstyle\rightskip=\z@%
    \@plus 8em\pretolerance=10000}%
}%

\renewcommand\subsection%
{%
  \@startsection{subsection}{2}{\z@}%
  {-30\p@}%
  {16\p@}%
  {\normalfont\subsecsize\subsecstyle\rightskip=\z@%
    \@plus 8em\pretolerance=10000}%
}%

\renewcommand\subsubsection%
{%
  \@startsection{subsubsection}{3}{\z@}%
  {-24\p@}%
  {12\p@}%
  {\normalfont\normalsize\subsubsecstyle\rightskip=\z@%
    \@plus 8em\pretolerance=10000}%
}%
%-------------------------------------------------------------------------------


%--------------------------- Environments && Definitions -----------------------
\def\maketitle%
  {%
    {%
      \thispagestyle{empty}%
      \addtocounter{page}\m@ne%
      {%
        \noindent%
        \LARGE%
        %\vspace*{2em}%
        \lineskip .5em%
        \@author%
        \par%
      }%
      \vskip 2cm%
      {%
        \noindent\Huge\bfseries\@title \par%
      }
      \vskip 1cm%
      \if!\@subtitle!\else
        {%
          \noindent%
          \LARGE%
          \ignorespaces%
          \@subtitle%
          \par%
        }%
        \vskip 1cm%
      \fi
      \if!\@date!\else
        {%
          \noindent%
          \@date%
          \par%
          \vskip 1.5em%
        }%
      \fi
      \vfill%
      {%
        \noindent%
        \if@logo
          \includegraphics[width=5cm]{inc/lboro_logo.pdf}
        \else
          \Large%
          \bfseries%
          Loughborough University%
          \par%
        \fi
      }%
      \clearpage%
    }%
  }

\def\frontmatter%
  {%
    \normalsize
    \pagestyle{fancyplain}
    \fancyhf{}
    \pagenumbering{roman}
    \fancyfoot[C]{\thepage}
    \pagestyle{plain}
  }%

\def\mainmatter%
  {%
    \normalsize
    \pagenumbering{arabic}
    \fancyhf{}
    \if@heading
      \fancyhead[RO,RE]{\small\@uthor}
      \fancyhead[LO,LE]{\small\nouppercase{\leftmark}}
    \fi
    \fancyfoot[R]{\thepage}
  }%

\def\backmatter%
  {%
    \normalsize
    \fancyhf{}
    \fancyfoot[R]{\thepage}
  }%

\let\appendix=\bppendix

\newenvironment{dedication}%
  {%
    \clearpage
    \thispagestyle{empty}
    \vspace*{\stretch{1}}
    \itshape
    \centering
  }%
  {%
    \par
    \vspace{\stretch{3}}
    \clearpage
  }%

\newenvironment{acknowledgement}%
  {%
    \addtocounter{page}\m@ne
    \clearpage
    \section*{Acknowledgements}
    \addcontentsline{toc}{section}{Acknowledgements}
  }%
  {%
    \par
    \clearpage
  }%

\renewenvironment{abstract}%
  {%
    \clearpage
    \section*{Abstract}
    \addcontentsline{toc}{section}{Abstract}
  }%
  {%
    \par
    \clearpage
  }%

\definecolor{shadecolor}{gray}{.90}%
\newenvironment{graybox}%
  {%
    \fboxsep=12pt\relax%
    \begin{shaded}%
    \list{}{\leftmargin=12pt\rightmargin=2\leftmargin\leftmargin=\z@\topsep=\z@\relax}%
    \expandafter\item\parindent%
    \listparindent%
  }%
  {%
    \endlist\end{shaded}%
  }%

% figures and tables are processed in small print
\def \@floatboxreset {%
        \reset@font
        \small
        \@setnobreak
        \@setminipage
}
\def\fps@figure{htbp}
\def\fps@table{htbp}
%
% Frame for paste-in figures or tables
\def\mpicplace#1#2{%  #1 =width   #2 =height
\vbox{\hbox to #1{\vrule\@width \fboxrule \@height #2\hfill}}}


% redefininition of the captions for "figure" and "table" environments
%
\@ifundefined{floatlegendstyle}{\def\floatlegendstyle{\bfseries}}{}
\def\floatcounterend{\enspace}
\def\capstrut{\vrule\@width\z@\@height\topskip}
\@ifundefined{captionstyle}{\def\captionstyle{\normalfont\small}}{}
\@ifundefined{instindent}{\newdimen\instindent}{}

\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore\if@minipage\@setminipage\fi
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\def\twocaptionwidth#1#2{\def\first@capwidth{#1}\def\second@capwidth{#2}}
% Default: .46\textwidth
\twocaptionwidth{.46\textwidth}{.46\textwidth}

\def\leftcaption{\refstepcounter\@captype\@dblarg%
            {\@leftcaption\@captype}}

\def\rightcaption{\refstepcounter\@captype\@dblarg%
            {\@rightcaption\@captype}}

\long\def\@leftcaption#1[#2]#3{\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \vskip\figcapgap
    \@maketwocaptions{\csname fnum@#1\endcsname}{\ignorespaces #3}%
    {\first@capwidth}\ignorespaces\hspace{.073\textwidth}\hfill%
  \endgroup}

\long\def\@rightcaption#1[#2]#3{\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \@maketwocaptions{\csname fnum@#1\endcsname}{\ignorespaces #3}%
    {\second@capwidth}\par
  \endgroup}

\long\def\@maketwocaptions#1#2#3{%
   \parbox[t]{#3}{{\floatlegendstyle #1\floatcounterend}#2}}

\def\fig@pos{l}
\newcommand{\leftfigure}[2][\fig@pos]{\makebox[.4635\textwidth][#1]{#2}}
\let\rightfigure\leftfigure

\newdimen\figgap\figgap=0.5cm  % hgap between figure and sidecaption
%
\long\def\@makesidecaption#1#2{\@tempdimb=3.6cm
   \setbox0=\vbox{\hsize=\@tempdimb
                  \captionstyle{\floatlegendstyle
                                         #1\floatcounterend}#2}%
   \ifdim\instindent<\z@
      \ifdim\ht0>-\instindent
         \advance\instindent by\ht0
         \typeout{^^JClass-Warning: Legend of \string\sidecaption\space for
                     \@captype\space\csname the\@captype\endcsname
                  ^^Jis \the\instindent\space taller than the corresponding float -
                  ^^Jyou'd better switch the environment. }%
         \instindent\z@
      \fi
   \else
      \ifdim\ht0<\instindent
         \advance\instindent by-\ht0
         \advance\instindent by-\dp0\relax
         \advance\instindent by\topskip
         \advance\instindent by-11\p@
      \else
         \advance\instindent by-\ht0
         \instindent=-\instindent
         \typeout{^^JClass-Warning: Legend of \string\sidecaption\space for
                     \@captype\space\csname the\@captype\endcsname
                  ^^Jis \the\instindent\space taller than the corresponding float -
                  ^^Jyou'd better switch the environment. }%
         \instindent\z@
      \fi
   \fi
   \parbox[b]{\@tempdimb}{\captionstyle{\floatlegendstyle
                                        #1\floatcounterend}#2%
                          \ifdim\instindent>\z@ \\
                               \vrule\@width\z@\@height\instindent
                                     \@depth\z@
                          \fi}}
\def\sidecaption{\@ifnextchar[\sidec@ption{\sidec@ption[b]}}
%
\newbox\bildb@x
%
\def\sidec@ption[#1]#2\caption{%
\setbox\bildb@x=\hbox{\ignorespaces#2\unskip}%
\if@twocolumn
 \ifdim\hsize<\textwidth\else
   \ifdim\wd\bildb@x<\columnwidth
      \typeout{Double column float fits into single column -
            ^^Jyou'd better switch the environment. }%
   \fi
 \fi
\fi
  \instindent=\ht\bildb@x
  \advance\instindent by\dp\bildb@x
\if t#1
\else
  \instindent=-\instindent
\fi
\@tempdimb=\hsize
\advance\@tempdimb by-\figgap
\advance\@tempdimb by-\wd\bildb@x
\ifdim\@tempdimb<3.6cm
   \ClassWarning{SVMult}{\string\sidecaption: No sufficient room for the legend;
             ^^Jusing normal \string\caption}%
   \unhbox\bildb@x
   \let\@capcommand=\@caption
\else
%  \ifdim\@tempdimb<4.5cm
%     \ClassWarning{SVMono}{\string\sidecaption: Room for the legend very narrow;
%              ^^Jusing \string\raggedright}%
      \toks@\expandafter{\captionstyle\sloppy
                         \rightskip=\z@\@plus6mm\relax}%
      \def\captionstyle{\the\toks@}%
%  \fi
   \let\@capcommand=\@sidecaption
%  \leavevmode
%  \unhbox\bildb@x
%  \hfill
\fi
\refstepcounter\@captype
\@dblarg{\@capcommand\@captype}}
\long\def\@sidecaption#1[#2]#3{\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \@makesidecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}%
    \hfill
    \unhbox\bildb@x
    \par
  \endgroup}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fig@type{figure}

\def\leftlegendglue{\relax}
\newdimen\figcapgap\figcapgap=5\p@   % vgap between figure and caption
\newdimen\tabcapgap\tabcapgap=3\p@ % vgap between caption and table

%\long\def\@makecaption#1#2{%
%  \captionstyle
%  \setbox\@tempboxa\hbox{{\floatlegendstyle #1\floatcounterend}\capstrut #2}
%  \hbox to\hsize{\leftlegendglue\unhbox\@tempboxa\hfil}
%}

\long\def\@makecaption#1#2{%
  \captionstyle
  \centering
  {{\floatlegendstyle #1\floatcounterend}\capstrut #2}
}

\newcounter{merk}

\def\endfigure{\resetsubfig\end@float}

\@namedef{endfigure*}{\resetsubfig\end@dblfloat}

\def\resetsubfig{\global\let\last@subfig=\undefined}

\def\r@setsubfig{\xdef\last@subfig{\number\value{figure}}%
\setcounter{figure}{\value{merk}}%
\setcounter{merk}{0}}

\def\subfigures{\refstepcounter{figure}%
   \@tempcnta=\value{merk}%
   \setcounter{merk}{\value{figure}}%
   \setcounter{figure}{\the\@tempcnta}%
   %\def\thefigure{\thesection.
   %\@arabic\c@merk\alph{figure}}%
   \def\thefigure{\@arabic\c@merk\alph{figure}}%
   \let\resetsubfig=\r@setsubfig}

\def\samenumber{\addtocounter{\@captype}{-1}%
\@ifundefined{last@subfig}{}{\setcounter{merk}{\last@subfig}}}

%-------------------------------------------------------------------------------


%---------------------------- Theorem Environments -----------------------------
\newtheoremstyle{derp}%
{}%
{}%
{}%
{}%
{\bfseries}%
{.}%
{ }%
{\thmname{#1}\thmnumber{ #2}\thmnote{ \normalfont(\itshape#3\normalfont)}}%

\newtheorem{theorem}{Theorem}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}

\newtheorem*{theorem*}{Theorem}
\newtheorem*{lemma*}{Lemma}
\newtheorem*{proposition*}{Proposition}
\newtheorem*{corollary*}{Corollary}

\theoremstyle{definition}
\newtheorem*{case*}{Case}
\newtheorem*{conjecture}{Conjecture}
\newtheorem*{exercise}{Exercise}
\newtheorem*{problem}{Problem}
\theoremstyle{derp}
\newtheorem*{property}{Property}
\theoremstyle{definition}
\newtheorem*{question}{Question}
\newtheorem*{solution}{Solution}

\theoremstyle{derp}
\newtheorem{case}{Case}
\newtheorem{rle}{Rule}
\newtheorem{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem*{definition*}{Definition}
\newtheorem*{example*}{Example}

\theoremstyle{remark}
\newtheorem{remark}{Remark}
\newtheorem{note}{Note}
\newtheorem*{remark*}{Remark}
\newtheorem*{note*}{Note}
%-------------------------------------------------------------------------------
