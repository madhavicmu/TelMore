#!/usr/bin/perl

use lib "/apache/cgi-bin/morph/";
require "lib_find_plural.pl";
require "lib_morph_nouns.pl";
require "lib_print.pm";

print "Content-type: text/html\n\n" ;

my ($word, $class);
my (%arg, %func_names);

my ($ans, $word, $lsyll, $numsyll, $plural, $mf, $class);
if ($ENV{'REQUEST_METHOD'} eq 'GET'){
    @pairs = split(/&/, $ENV{'QUERY_STRING'});
    foreach $pair (@pairs){
        ($name, $value) = split(/=/,$pair);
        $arg{$name} = $value;
    }
}
$word = $arg{'word'};
$word =~ s/\s+//g;
$word =~ s/\%27/\'/g;


%func_names = (
	       1.1 => \&find_fcform_nu,
	       1.2 => \&find_fcform_no_nu,
	       2 => \&find_scform,
	       3 => \&find_tcform,
	       );

my $html = print_html_headers();
print $html;
if ($word !~ /t\'a$/){
    print "Only infinitive t\'a forms are accepted.\nEnter next verb (\"exit\" to exit): ";
    exit;
}
print print_html_headers(); # changed this line ###
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
print "$word: $class\n"; ### remove this line
$mf = &{$func_names{$class}}($word);
print print2html_verb_forms ($word,  $mf); ### 
print print_html_footer (); ### 










