#!/bin/csh -f

perl autorun_morph_nouns.pl -i test/noun.1d.test  \
    -o test/noun.1d.testout  \
    -c 1 -h 0

perl autorun_morph_nouns.pl -i test/noun.2d.test  \
    -o test/noun.2d.testout  \
    -c 2 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-reg.test  \
    -o test/noun.3d-reg.testout  \
    -c 3 -h 0
			
perl autorun_morph_nouns.pl -i test/noun.3d-irr1.test  \
     -o test/noun.3d-irr1.testout  \
    -c 3.1 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-irr2.test  \
     -o test/noun.3d-irr2.testout  \
    -c 3.2 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-irr3.test  \
     -o test/noun.3d-irr3.testout  \
    -c 3.3 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-irr4.test  \
     -o test/noun.3d-irr4.testout  \
    -c 3.4 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-irr5.test  \
     -o test/noun.3d-irr5.testout  \
    -c 3.5 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-irr6.test  \
     -o test/noun.3d-irr6.testout  \
    -c 3.6 -h 0

perl autorun_morph_nouns.pl -i test/noun.3d-irr8.test  \
     -o test/noun.3d-irr8.testout  \
    -c 3.8 -h 0
