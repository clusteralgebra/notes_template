\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{void}[2024/09/15 My LaTeX Template]

\LoadClass{book}
%\RequirePackage{palatino} % default font
\pagestyle{plain}

\setlength{\paperheight}{11in}
\setlength{\paperwidth}{8.5in}
\RequirePackage{geometry}
\RequirePackage[newparttoc]{titlesec}
\RequirePackage{titletoc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Customize the format of \part titles
%   - Redefining \part is needed in order to control how it appears
%     in the table of contents. See the documentation for titlesec.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\part}[display]
  {\centering\Huge\bfseries} % Center the title and increase font size
  {\partname\nobreakspace\thepart} % Format for part number
  {10mm} % Space between number and title
  {\Huge\bfseries} % Format for the title

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Define the margins of the document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{
    left=40mm,
    right=40mm,
    bottom = 30mm,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Set the default size of the font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\normalsize{\fontsize{12}{15}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Format the Title Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
    \begingroup
    \centering
    \vspace*{10em}
    \fontseries{b}
    \fontsize{20}{25}
    \selectfont
    \@title
    \par
    \vskip10pt
    \endgroup
    \begingroup 
    \centering
    \vspace{20em}
    \fontsize{12}{14} % Adjust the font size if needed
    \selectfont
    \@date \\  
    \vspace{2em}
    by \@author
    \par % Ensures the end of the paragraph
    \vskip10pt % Optional: Add vertical space after the author if needed
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Format how chapters appear in the main body
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries\centering} % Format: normal font, huge size, bold, centered
  {\normalfont\chaptertitlename\ \thechapter} % "Chapter X"
  {20pt} % Space between number and title
  {\huge} % Format for the title itself

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Format how sections appear in the main body
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\section} % Redefine the \section command
  {\normalfont\Large\bfseries\centering} % Format: normal font, large size, bold, centered
  {\thesection}{1em} % Section number, with spacing of 1em between number and title
  {} % Space before title text
  %[\vspace{10pt}] % Space after the title
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Set how parts appear in the main body
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titlecontents{part}
  [0em]                          % Left margin (adjust as needed)
  {\vspace{2em}\bfseries}                    % Format for part title (bold)
  {Part \thecontentslabel. \quad }      % Format for part number (label)
  {}                            % No additional format for the number
  {\normalfont\titlerule*[0.5pc]{}\contentspage} % Dot leader and page number

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Set the table of contents depth. This will set what types of 
%   partitions (for example chapters, sections, subsections, etc)
%   appear in the table of contents. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{1} % table of contents only displays chapters + sections

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Set how chapters appear in the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titlecontents{chapter}
  [0em]                          % Left margin
  {\addvspace{1em}}                    % Format for chapter title (bold)
  {Chapter \thecontentslabel.\quad }  % Format for chapter number (label)
  {}                            % No format for the number itself
  {\titlerule*[0.5pc]{.}\contentspage} % Format for the dot leader and page number

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Set how parts appear in the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\my@parttoc}[2]{%
  \addcontentsline{toc}{part}{\bfseries Part \thecontentslabel: #2}%
}