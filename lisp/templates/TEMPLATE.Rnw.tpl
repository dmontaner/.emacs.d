%% (>>>FILE<<<)
%% (>>>ISO_DATE<<<) david.montaner@gmail.com
%% (>>>COMMENT<<<)

\documentclass[12pt, a4paper]{report} %sets the document class; also set the general font size for the document 

\usepackage{amsmath} %defines many new mathematical symbols
\usepackage[pdftex]{graphicx} %allows you to include images in your document; este paquete con la opcion pdftex hace falta para los graficos

\setlength{\topmargin}{-1in} %Margin at top of page above all printing; empieza a contar desde el 1in, por eso pone el -1in
\setlength{\evensidemargin}{-1.5cm} %cuenta desde el 2.5 cm = 1 in; %Left margin on even numbered pages. Add 1 inch (as with \topmargin).
\setlength{\oddsidemargin}{-1.5cm}  %cuenta desde el 2.5 cm = 1 in; %Left margin on odd numbered pages. Add 1 inch (as with \topmargin).
\setlength{\textwidth}{19cm}  %width of main text box; se cuenta a partir del margen que se ha dejado a la izquierda?
\setlength{\textheight}{28cm} %height of main text box; se cuenta a partir del margen que se ha dejado arriba?

\SweaveOpts{echo=FALSE, prefix.string=plot} %echo=FALSE no imprime el codigo; prefix.string=plot los plots empiezan por plots- se puede usar la / de directorio

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}
Primera linea sin la arroba

<<chunkConNota>>= 
## \Sexpr{LoQueSea} 
## sirve para insertar LoQueSea entre las lineas de texto de LaTeX code.

<<chunkConImagen, fig=TRUE>>= 
## fig=TRUE hay que ponerlo cuando vamos a hacer plots, pero si no hay que hacerlo FALSE")
## se genera solo un grafico y se imprime la sintaxis para insertarlo en el latex
## no se pueden generar varios graficos a la vez
## Sweave creates plots and \includegraphics{} statement is inserted into the LaTeX code.

<<eval=TRUE>>= 
## Whether the R chunk is run.

<<echo=TRUE>>= 
## Wether the R chuink is shown in the LTEX file.

<<results = (verbatim, tex, hide)>>= 
## Type of output used to show the printed results produced by the R code.
## hide will show no output at all.
## HAY QUE QUITAR EL PARENTESIS

@
mas lineas de \LaTeX\ que continuan

\end{document}
