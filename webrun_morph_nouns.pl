#!/bin/perl 
#
# Use GET for form in cgi;
# cgi form should send two variables named "word" and "class".
# word is any single word
# class is any number returned by radio button (only certain numbers are allowed).
# Not required to validate contents of word.
# 
# HTML output is stored in $html_code variable, and it may be displayed in output.
#
# REQUIREMENT to change: When you show the following output, I want the form to 
# be shown on top without having to use back button.
# Just like in Universal Dictionary, show the form on top and below that you show the output

use lib "/apache2/cgi-bin/morph/";
use strict;
use warnings;
#use Getopt::Std;

require "lib_find_plural.pl";
require "lib_morph_nouns.pl";

print "content-type:text/html \n\n";

print <<EOF;
print print_html_headers();

if ($ENV{'REQUEST_METHOD'} eq 'GET'){
    @pairs = split(/&/, $ENV{'QUERY_STRING'}); 
    foreach $pair (@pairs){
	$name, $value = split(/=/,$pair);
	$arg{$name} = $value;
	print "$name $arg{$name}\n"; 
    }
}

my ($ans, $word, $lsyll, $numsyll, $plural, $mf, $class);
my (%arg, %func_names);

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
	       );
$word = $opt{'word'};
$class = $opt{'class'};
$word =~ s/\s+//g;
$class =~ s/\s+//g;
$mf = &{$func_names{$class}}($word);
$html_code = print2html_noun_forms($mf);

