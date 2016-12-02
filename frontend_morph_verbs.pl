use lib "/afs/cs/project/ul-4/Courses/Morphology/Nouns";
use strict;
use warnings;
use Getopt::Std;

require "lib_find_plural.pl";
require "lib_morph_verbs.pl";
require "lib_print.pm";

my ($ans, $word, $lsyll, $numsyll, $plural, $mf, $class);
my (%Options, %func_names);
%func_names = (
	       1.1 => \&find_fcform_nu,
	       1.2 => \&find_fcform_no_nu,
	       2 => \&find_scform,
	       3 => \&find_tcform,
	       );
if (!getopts("io:",\%Options)){
    print_display_options();
    exit;
}
my $outfile = ">/afs/cs/project/ul/www/12345/".$Options{"o"}.".txt";
open(FOUTtxt, $outfile)
    or die "Couldn't open $outfile for writing: $!\n";
print "Enter a verb (\"exit\" to exit): ";
while ($word = <STDIN>){
    chomp ($word);
    if ($word =~ /exit/i){last;}
    if ($word !~ /t\'a$/){
	print "Only infinitive t\'a forms are accepted.\nEnter next verb (\"exit\" to exit): ";
	next;
    }
    my $outfile = ">/afs/cs/project/ul/www/12345/".$Options{"o"}.".html";
    open(FOUT, $outfile) or die "Couldn't open $outfile for writing: $!\n";
    my $htmltxt = print_html_headers();
    print FOUT $htmltxt;
    $word =~ tr/[A-Z]/[a-z]/;
    print $word;
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
    print2file_verb_forms ("FOUTtxt", $word,  $mf);
    $htmltxt = print2html_verb_forms ($word,  $mf);
    print FOUT $htmltxt;
    $htmltxt = print_html_footer ();
    print FOUT $htmltxt;
    close(FOUT);
    print "Enter next verb (\"exit\" to exit):";
}
close(FOUTtxt);










