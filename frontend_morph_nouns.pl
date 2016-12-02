use lib "/afs/cs/project/ul-4/Courses/Morphology/Nouns";
use strict;
use warnings;

require "lib_find_plural.pl";
require "lib_morph_nouns.pl";
my ($ans, $word, $lsyll, $numsyll, $plural, $mf);
open(FOUT, ">$ARGV[0]");
while ($word = <STDIN>){
    if ($word =~ /^\#.*$/){
	next;
    }
    chomp($word);
    if ($word =~ /exit/i){
	last;
    }
    $lsyll= get_lsyll($word);
    print "frontend: $lsyll\n";
    if (get_lsyll($word) eq "d'u"){
	print "Is it a masculine name or is it a masculine noun? <default=yes>\n";
	$ans = <STDIN>;
	if ($ans !~ /^n/i){
	    $mf = find_fdform($word);
	}
    }
    elsif ($word =~ /[ae]{1}mu$/){
	print "Is it a noun of neutral gender <default=yes>\n";
	$ans = <STDIN>;
	if ($ans !~ /^n/i){
	    $mf = find_sdform($word);
	}
    }
    else {
	$mf = find_tdform_reg($word);
	print "Does @{ $mf->{\"datSgNeut\"} } mean \"to $word\"?";	
	$ans = <STDIN>;
	if ($ans =~ /^n/i){
	    $mf = {};
	}
    }
    print_noun_forms ("FOUT", $mf);
}
#close(FIN);
close(FOUT);



