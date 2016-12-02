use lib "/afs/cs/project/ul-4/Courses/Morphology/Nouns";
use strict;
use warnings;

require "lib_find_plural.pl";
require "lib_morph_nouns.pl";

open(FIN, $ARGV[0]);
open(FOUT, ">$ARGV[1]");
my ($word, $numsyll, $plural);
while ($word = <FIN>){
    chomp($word);
    $numsyll=get_numsyll($word);
    $plural = get_descriptive_plural($word);
    my $lsyll = get_lsyll($word);
    print (FOUT "$lsyll\t$word\t$plural\n");
}
close(FIN);
close(FOUT);




