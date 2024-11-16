#!/usr/bin/env perl

$out_dir = 'output';
$aux_dir = 'output';

# uplatex コマンドを使用
$latex = 'uplatex -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error -output-directory=' . $out_dir . ' %O %S';
# pbibtex コマンドはそのままで問題ない
$bibtex = 'pbibtex %O -output-directory=' . $aux_dir . ' %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars --output-directory=' . $aux_dir . ' %O %S';
$makeindex = 'mendex %O -o %D %S';
# dvipdfmx コマンドはそのままで問題ない
$dvipdf = 'dvipdfmx %O -o %D %S';

$max_repeat = 5;
$pdf_mode = 3;

$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

$clean_ext = "aux bbl blg idx ilg ind lof log lot out toc synctex.gz fls fdb_latexmk brf nlo nls run.xml";
$clean_full_ext = "$clean_ext dvi ps";

push @generated_exts, "nav", "snm", "vrb", "xdv";

