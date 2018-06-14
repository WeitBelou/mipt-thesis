\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mipt-thesis-bs}[2014/06/18 Class for the BS thesis in the MIPT]

%%%%%% Class options %%%%%
\DeclareOption*{
    \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Useful packages %%%%%
% Math packages, should be loaded before fontenc and babel for Cyrillic
\RequirePackage{amsmath,amsthm,amssymb}
\RequirePackage{mathtext}

% Refs
\RequirePackage[unicode]{hyperref}

% Fonts and lang
\RequirePackage[T1,TS1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,russian]{babel}

% Formatting
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{nopageno}
\RequirePackage{tocloft}
\RequirePackage{csquotes}

% Tables
\RequirePackage{tabularx,multirow}

% Nice unit formatting
\RequirePackage[binary-units]{siunitx}

% Additional integral symbols
\RequirePackage{esint}

% Graphics
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\DeclareCaptionSubType[arabic]{figure}
\renewcommand\thesubfigure{\asbuk{subfigure}}

% Set continuous numbering
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}

% Source code
\RequirePackage[outputdir=out]{minted}
\RequirePackage{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Set up correct formatting %%%%%
\geometry{left=3cm}
\geometry{right=2cm}
\geometry{top=2cm}
\geometry{bottom=2cm}
\onehalfspace
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Some dark TeX magic %%%%%
\addto\captionsrussian{\renewcommand{\contentsname}{Содержание}}
\addto\captionsrussian{\renewcommand{\listfigurename}{Список иллюстраций}}
\addto\captionsrussian{\renewcommand{\listtablename}{Список таблиц}}
\addto\captionsrussian{\renewcommand{\bibname}{Литература}}
\addto\captionsrussian{\renewcommand{\indexname}{Index}}
\addto\captionsrussian{\renewcommand{\figurename}{Рис.{}}}
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}
\addto\captionsrussian{\renewcommand{\partname}{Часть}}
\addto\captionsrussian{\renewcommand{\chaptername}{Глава}}
\addto\captionsrussian{\renewcommand{\appendixname}{Приложение}}

%%%%%%%% Headings
\fancypagestyle{miptthesis}{%
    \fancyhf{}
    \pagenumbering{arabic}
    \fancyhead[RO, LE]{\thepage}
    \fancyhead[CO]{\leftmark}
    \fancyhead[CE]{\rightmark}
}
\pagestyle{miptthesis}
\renewcommand{\chaptermark}[1]{\markboth{\hfill\normalfont #1\hfill}{}}
\renewcommand{\sectionmark}[1]{\markright{\hfill\large\itshape \S\thesection\quad #1\hfill}}
\let\partmark=\chaptermark

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Right TOC numbering %%%%%
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Easier references %%%%%
\newcommand{\formref}[1]{(\ref{#1})}
\newcommand{\picref}[1]{рис.~\ref{#1}}
\newcommand{\tabref}[1]{таб.~\ref{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Titlepage and contents %%%%%
% Set some "variables"
\renewcommand{\author}[1]{\def\mtauthortext{#1}}
\renewcommand{\title}[1]{\def\mttitletext{#1}}
\newcommand{\groupnum}[1]{\def\mtgroupnumtext{#1}}
\newcommand{\supervisor}[1]{\def\mtsupervisortext{#1}}
\newcommand{\department}[1]{\def\mtdepartmenttext{#1}}
\newcommand{\chair}[1]{\def\mtchairtext{#1}}

\newcommand{\addemptypage}{%
    \clearpage \mbox{} \clearpage
}

\renewcommand{\titlepage}{%
    \pagestyle{empty}
    \begin{center}
        {\textbf{Министерство образования и науки Российской Федерации}  \\
        Московский физико-технический институт (государственный
        университет) \\ }
        \vspace{1cm}

        \mtdepartmenttext{} \\
        \mtchairtext{} \\

        \vspace{3em}

        Выпускная квалификационная работа бакалавра по направлению 010900
        <<Прикладные математика и физика>>
    \end{center}

    \begin{center}
        \vspace{\fill}
        \singlespacing

        \LARGE \mttitletext{}

        \vspace{\fill}
    \end{center}


    \begin{flushright}
        Студент \mtgroupnumtext{} группы \\
        \mtauthortext{} \\
        \vspace{2em}
        Научный руководитель \\
        \mtsupervisortext{} \\
    \end{flushright}

    \vspace{7em}

    \begin{center}
        Долгопрудный \\
        \the\year{}
    \end{center}

}

\newcommand{\titlecontents}{
    \titlepage \addemptypage
    \tableofcontents \addemptypage
    \pagestyle{miptthesis}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
