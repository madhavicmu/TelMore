use lib "/afs/cs/project/ul-4/Courses/Morphology/Nouns";
use strict;
use warnings;
use Getopt::Std;

require "lib_find_plural.pl";
require "lib_morph_verbs.pl";
require "lib_print.pm";

my ($ans, $word, $lsyll, $numsyll, $plural, $mf, $class, $htmlflag);
my (%Options, %func_names);
%func_names = (
	       1.1 => \&find_fcform_nu,
	       1.2 => \&find_fcform_no_nu,
	       2 => \&find_scform,
	       3 => \&find_tcform,
	       );
if (!getopts("i:o:f:h",\%Options)){
    #print_display_options();
    exit;
}
if ($Options{"h"}){
    print "\n\t$0 -i <inputfile> -o <outfile prefix> -f <1/0> -h\n";
    print "\t\t-f 1 means html format; 0 means comma seperated value format\n";
    print "\t\t-h gives this help. Only -h is optional. All others are required.\n\n\n";
    exit;
}

if ($Options{"f"} eq "1"){
    $htmlflag = 1;
}
else {
    $htmlflag = 0;
}
open(FIN, $Options{"i"});
if ($htmlflag) {open(FOUT, ">/afs/cs/project/ul/www/12345/nounsfinal/$Options{\"o\"}.html");}
else {open(FOUT, ">/afs/cs/project/ul/www/12345/nounsfinal/$Options{\"o\"}.csv");}
if ($htmlflag) {print FOUT print_html_headers ();}
while ($word = <FIN>){
    chomp ($word);
    if ($word !~ /t\'a/i){
	next;
    }
    $word =~ tr/[A-Z]/[a-z]/;
    if ($word =~ /.*[ys]{1,2}ut\'a$/){
	$class = 2;
    }
    elsif ($word =~ /.*chut\'a$/){
	$class = 3;
    }
    elsif ($word =~ /.*nut\'a$/){
	$class = 1.1;
    }
    elsif ($word =~ /.*n\'d\'ut\'a$/){
	$class = 1.1;
    }
    else {
	$class = 1.2;
    }
    $mf = &{$func_names{$class}}($word);
    if ($htmlflag) {
	print FOUT print2html_verb_forms($word,  $mf);
    }
    else {
	print FOUT print2file_verb_forms($word,  $mf);
    }
}
if ($htmlflag) {print FOUT print_html_footer();}
close(FOUT);
close(FIN);

