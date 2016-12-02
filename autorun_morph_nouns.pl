use lib "/afs/cs/project/ul-4/Courses/Morphology/Nouns";
use strict;
use warnings;
use Getopt::Std;

require "lib_find_plural.pl";
require "lib_morph_nouns.pl";
require "lib_print.pm";

my ($ans, $word, $lsyll, $numsyll, $plural, $mf, $class, $htmlflag, $txt);
my (%Options, %func_names);
%func_names = (
	       1 => \&find_fdform,
	       2 => \&find_sdform,
	       3 => \&find_tdform_reg,
	       3.1 => \&find_tdform_irr1,
	       3.2 => \&find_tdform_irr2,
	       3.3 => \&find_tdform_irr3,
	       3.4 => \&find_tdform_irr4,
	       3.5 => \&find_tdform_irr5,
	       3.6 => \&find_tdform_irr6,
	       3.7 => \&find_tdform_irr7,
	       3.8 => \&find_tdform_irr8,
	       3.9 => \&find_tdform_frgn,
	       );
if (!getopts("i:o:c:f:h",\%Options)){
    print_display_options();
    exit;
}

if ($Options{"h"}){
    print "\n\t$0 -i <inputfile> -o <outfile prefix> -c <class:1/2/3/3.1/../3.9/> -f <1/0> -h\n";
    print "\t\t-f 1 means html format; 0 means comma seperated value format\n";
    print "\t\t-h gives this help. Only -h is optional. All others are required.\n\n";
    exit;
}

if ($Options{"f"} eq "1"){
    $htmlflag = 1;
}
else {
    $htmlflag = 0;
}
open(FIN, $Options{"i"}); 

if ($htmlflag) {open(FOUT, ">$Options{\"o\"}.html");}
else {open(FOUT, ">$Options{\"o\"}.csv");}

$class = $Options{"c"};
$mf = &{$func_names{$class}}("eimileidu");
my $prev_word;
if ($htmlflag) {
    print FOUT print_html_headers();
}
while ($word = <FIN>){
    chomp ($word);
    $mf = &{$func_names{$class}}($word);
    if ($htmlflag == 0) {
	print FOUT print2file_noun_forms($word, $mf);
    }
    else {
	print FOUT print2html_noun_forms ($word, $mf);
    }
}
if ($htmlflag) {print FOUT print_html_footer();}
close(FOUT);






