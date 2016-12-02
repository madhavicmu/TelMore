require "lib_find_plural.pl";

sub find_fdform{
    my $word = shift;
    my  $ls, %mf;
    @letters = split(//, $word);
    $f=0;
    $ls = $word;
    $ls =~ s/(.*)d\'u/$1/;
    $mf{"nomSgMasc"} = [$word,$ls."n'd'u"];
    $mf{"genSgMasc"} = [$ls."ni",$ls."d'i", $ls."niyokka",$ls."d'iyokka"];
    $mf{"datSgMasc"} = [$ls."niki",$ls."d'iki"];
    $mf{"accSgMasc"} = [$ls."ni",$ls."d'ini",$ls."nd-nd-i"];
    $mf{"vocSgMasc"} = [$ls."d'aa"];
    $mf{"insSgMasc"} = [ $ls."nicheita", $ls."nitoo" ];
    $mf{"locSgMasc"} = [$ls."niloo", $ls."niyan'du"];
    
    $plural = get_descriptive_plural($word);
    $mf{"nomPlaMasc"} = [$plural];
    $ls = $word;
    $ls =~ s/d\'u$//;
    if ($word =~ /vaad\'u$/){
	$mf{"nomPlMasc"} = [$ls."l'l'u"];
	$mf{"genPlMasc"} = [$ls."l'l'a",$ls."l'l'ayokka"];
	$mf{"datPlMasc"} = [$ls."l'l'aku"];
	$mf{"accPlMasc"} = [$ls."l'l'anu"];
	$mf{"vocPlMasc"} = [$ls."l'l'alaaraa"];
	$mf{"insPlMasc"} = [$ls."l'l'acheita",$ls."l'al'too"];
	$mf{"locPlMasc"} = [$ls."l'l'aloo",$ls."l'l'ayandu"];
    }
    else {
	$mf{"nomPlMasc"} = [$ls."lu", $ls."n'd'lu", $ls."l", $ls."l'l'u"];
	$mf{"genPlMasc"} = [$ls."n'd'la",$ls."l'l'a",$ls."layokka"];
	$mf{"datPlMasc"} = [$ls."laki", $ls."n'd'laku",$ls."l'l'aku"];
	$mf{"accPlMasc"} = [$ls."la", $ls."lanu",$ls."n'd'lanu"];
	$mf{"vocPlMasc"} = [$ls."llaraa"];
	$mf{"insPlMasc"} = [$ls."lacheita",$ls."latoo"];
	$mf{"locPlMasc"} = [$ls."laloo",$ls."layandu"];
    }
    return (\%mf);
}



sub find_sdform{
    my $word = shift;
    my $ls, %mf;
    @letters = split(//, $word);
    $f=0;
    $ls = $word;
    $ls =~ s/(.*)[ae]{1}mu/$1a/;
    $mf{"nomSgNeut"} = [$word,$ls."n'bu",$ls."mmu"];
    $mf{"genSgNeut"} = [$ls."pu",$ls."muyokka"];
    $mf{"datSgNeut"} = [$ls."munaku",$ls."mmunaku",$ls."n'bunaku",$ls."muku"];
    $mf{"accSgNeut"} = [$ls."munu",$ls."anni"];
    $mf{"vocSgNeut"} = [$ls."maa","oo ".$ls."n'"];
    $mf{"insSgNeut"} = [$ls."mucheita",$ls."mutoo"];
    $mf{"locSgNeut"} = [$ls."muloo",$ls."muandu",$ls."muna"];
    $plural = get_descriptive_plural($word);
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$ls."mulu",$ls."n'bulu",$ls."mmulu"];
    $mf{"genPlNeut"} = [$ls."mula",$ls."n'bula",$ls."mmula"];
    $mf{"datPlNeut"} = [$ls."mulaku",$ls."n'bulaku",$ls."mmulaku"];
    $mf{"accPlNeut"} = [$ls."mulanu",$ls."n'bulanu",$ls."mmulanu"];
    $mf{"vocPlNeut"} = [$ls."mularaa"];
    $mf{"insPlNeut"} = [$ls."mulacheita",$ls."mulatoo"];
    $mf{"locPlNeut"} = [$ls."mulaloo",$ls."mulayandu"];
    return (\%mf);
}

sub find_tdform_reg{
    my $word = shift;
    my $ls, %mf;
    chomp($word);
    $ls = $word;
    if ($ls =~ /.*([ai]{2})$/){ # sanskrit feminies ending in aa or ii 
	if ($ls =~ /[aeiou]+[^aeiou]+.*/){ # not monosyllabic like strii
	    $ls = substr($ls, 0, length($ls)-1);
	}
    }
    $mf{"nomSgMasc"} = [$word];
    $mf{"genSgNeut"} = [$ls."",$ls."yokka"];
    $mf{"datSgNeut"} = [$ls."ki"];
    $mf{"accSgNeut"} = [$ls."ni"];
    $tmp = $ls.substr($ls,length($ls)-1,1);
    $tmp =~ s/ee$/ei/;
    $mf{"vocSgNeut"} = ["oo $tmp"];
    $mf{"insSgNeut"} = [$ls."cheita",$ls."too"];
    $mf{"locSgNeut"} = [$ls."loo",$ls."yaandu"];
    $ls = $word;
    if ($ls =~ /(.*[^aeiou])i([^aeiou]+)i$/){
	$ls = $1."u".$2."ula";
    }
    elsif ($ls =~ /(.*[^aeiou])i$/){
	$ls = $1."ula";
    }
    else {
	$ls = $ls."la";
    }
    $plural = get_descriptive_plural($word);
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [substr($ls,0,length($ls)-1)."u"];
    $mf{"genPlNeut"} = [$ls."",$ls."yokka"];
    $mf{"datPlNeut"} = [$ls."ku"];
    $mf{"accPlNeut"} = [$ls."nu"];
    $mf{"vocPlNeut"} = [$ls."araa"];
    $mf{"insPlNeut"} = [$ls."cheita",$ls."too"];
    $mf{"locPlNeut"} = [$ls."loo"];
    return (\%mf);
}

sub find_tdform_irr1{
    my $word = shift;
    my $ls, %mf;
    $ls = $word;
    $mf{"nomSgMasc"} = [$word];
    $mf{"genSgNeut"} = [$ls."",$ls."yokka"];
    $mf{"datSgNeut"} = [$ls."ki"];
    $mf{"accSgNeut"} = [$ls."ni"];
    $tmp = $ls.substr($ls,length($ls)-1,1);
    $tmp =~ s/ee$/ei/;
    $mf{"vocSgNeut"} = ["oo $tmp"];
    $mf{"insSgNeut"} = [$ls."cheita",$ls."too"];
    $mf{"locSgNeut"} = [$ls."loo",$ls."yaandu"];

    $plural = get_descriptive_plural($word);
    $ls = $plural;
    $ls =~ s/u$//g;
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}
    
sub find_tdform_irr2{
    my $word = shift;
    my $plural = get_descriptive_plural($word);
    my $ls, %mf;
    $ls = $word;
    $ls =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1t\'/;
    $mf{"nomSgNeut"} = [$word];
    $mf{"genSgNeut"} = [$ls."iyokka"];
    $mf{"datSgNeut"} = [$ls."iki"];
    $mf{"accSgNeut"} = [$ls."ini"];
    $mf{"vocSgNeut"} = ["oo $word"];
    $mf{"insSgNeut"} = [$ls."icheita",$ls."itoo"];
    $mf{"locSgNeut"} = [$ls."a"];

    $ls = $word;
    $word =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1l\'l\'u/;
    $ls =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1l\'l\'/;
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$word];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}

sub find_tdform_irr3{
    my $word = shift;
    my $plural = get_descriptive_plural($word);
    my $ls, %mf;
    $ls = $word;
    $ls =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+$/$1n\'t\'/;
    $mf{"nomSgNeut"} = [$word];
    $mf{"genSgNeut"} = [$ls."iyokka"];
    $mf{"datSgNeut"} = [$ls."iki"];
    $mf{"accSgNeut"} = [$ls."ini"];
    $tmp = substr($word,length($word)-1,1);
    $mf{"vocSgNeut"} = ["oo $word$tmp"];
    $mf{"insSgNeut"} = [$ls."icheita",$ls."itoo"];
    $mf{"locSgNeut"} = [$ls."a"];
    
    $ls = $word;
    $word =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+$/$1l\'l\'u/;
    $ls =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1l\'l\'/;
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$word];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}

sub find_tdform_irr4{
    my $word = shift;
    my $ls, %mf;
    my $plural = get_descriptive_plural($word);
    $ls = $word;
    if ($ls =~ /.*[aeiou]+n\'[^aeiou]+[aeiou]+$/){
	$ls =~ s/(.*[aeiou]+n\')[^aeiou]+[aeiou]+/$1t\'/;
    }
    else {
	$ls =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1t\'/;
    }
    $mf{"nomSgNeut"} = [$word];
    $mf{"genSgNeut"} = [$ls."iyokka"];
    $mf{"datSgNeut"} = [$ls."iki"];
    $mf{"accSgNeut"} = [$ls."ini"];
    $tmp = substr($word,length($word)-1,1);
    $mf{"vocSgNeut"} = ["oo $word$tmp"];
    $mf{"insSgNeut"} = [$ls."icheita",$ls."itoo"];
    $mf{"locSgNeut"} = [$ls."a"];
    
    $ls = $word;
    if ($word =~ /.*[aeiou]+n\'[^aeiou]+[aeiou]+$/){
	$word =~ s/(.*[aeiou]+n\')[^aeiou]+[aeiou]+/$1d\'lu/;
	$ls =~ s/(.*[aeiou]+n\')[^aeiou]+[aeiou]+/$1d\'l\'/;
    }
    else {
	$word =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1l\'l\'u/;
	$ls =~ s/(.*[aeiou]+)[^aeiou]+[aeiou]+/$1l\'l\'/;
    }
    $mf{"nomPlaNeut"} =[$plural];
    $mf{"nomPlNeut"} = [$word];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}

sub find_tdform_irr5{
    my $word = shift;
    my $ls, %mf;
    my $plural = get_descriptive_plural($word);
    $tmp = $word;
    $tmp =~ s/(.*[^aeiou]+)([aeiou]+)y{1,2}i/$1ZZ$2ZZ/;
    ($one, $two, $three) = split(/ZZ/,$tmp);
    if (length($two) == 1){
	$two = $two.$two;
	$two  =~ s/ee/ei/;
    }
    $ls = $one.$two.$three."t";
    $mf{"nomSgNeut"} = [$word];
    $mf{"genSgNeut"} = [$ls."iyokka"];
    $mf{"datSgNeut"} = [$ls."iki"];
    $mf{"accSgNeut"} = [$ls."ini"];
    $tmp = substr($word,length($word)-1,1);
    $mf{"vocSgNeut"} = ["oo $word$tmp"];
    $mf{"insSgNeut"} = [$ls."icheita",$ls."itoo"];
    $mf{"locSgNeut"} = [$ls."a"];
    
    $word = $one.$two."tulu";
    $ls = $one.$two."tul";
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$word];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}

sub find_tdform_irr6{
    my $word = shift;
    my $ls, %mf;
    my $plural = get_descriptive_plural($word);
    $ls = $word;
    $ls =~ s/u$/i/;
    $mf{"nomSgNeut"} = [$word];
    $mf{"genSgNeut"} = [$ls."yokka"];
    $mf{"datSgNeut"} = [$ls."ki"];
    $mf{"accSgNeut"} = [$ls."ni"];
    $tmp = substr($word,length($word)-1,1);
    $mf{"vocSgNeut"} = ["oo $word$tmp"];
    $mf{"insSgNeut"} = [$ls."cheita",$ls."too"];
    $mf{"locSgNeut"} = [$ls."loo"];
    
    $word = $plural;
    $ls = $plural;
    $ls =~ s/u$//;
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$word];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}

sub find_tdform_frgn{
    my %mf;
    print ("Noun class 3.7 not supported\n");
    return (\%mf);
}

sub find_tdform_irr8{
    my $word = shift;
    my $ls, %mf;
    my $plural = get_descriptive_plural($word);
    $ls = $word;
    $ls =~ s/lu$/li/;
    $mf{"nomSgNeut"} = [$word];
    $mf{"genSgNeut"} = [$ls."yokka"];
    $mf{"datSgNeut"} = [$ls."ki"];
    $mf{"accSgNeut"} = [$ls."ni"];
    $tmp = substr($word,length($word)-1,1);
    $mf{"vocSgNeut"} = ["oo $word$tmp"];
    $mf{"insSgNeut"} = [$ls."cheita",$ls."too"];
    $mf{"locSgNeut"} = [$ls."loo"];
    
    $word = $plural;
    $ls = $plural;
    $ls =~ s/u$//;
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$word];
    $mf{"genPlNeut"} = [$ls."a",$ls."ayokka"];
    $mf{"datPlNeut"} = [$ls."aku"];
    $mf{"accPlNeut"} = [$ls."anu"];
    $mf{"vocPlNeut"} = [$ls."alaaraa"];
    $mf{"insPlNeut"} = [$ls."acheita",$ls."atoo"];
    $mf{"locPlNeut"} = [$ls."aloo"];
    return (\%mf);
}

sub find_tdform_frgn{
    my $word = shift;
    my $ls, %mf;
    chomp($word);
    $plural = get_descriptive_plural($word);
    $ls = $word;
    $mf{"nomSgMasc"} = [$word];
    $mf{"genSgNeut"} = [$ls."",$ls."yokka"];
    $mf{"datSgNeut"} = [$ls."ki"];
    $mf{"accSgNeut"} = [$ls."ni"];
    $mf{"vocSgNeut"} = ["oo $word"];
    $mf{"insSgNeut"} = [$ls."cheita",$ls."too"];
    $mf{"locSgNeut"} = [$ls."loo",$ls."yaandu"];

    $ls = $word;
    $mf{"nomPlaNeut"} = [$plural];
    $mf{"nomPlNeut"} = [$ls."lu"];
    $mf{"genPlNeut"} = [$ls."layokka"];
    $mf{"datPlNeut"} = [$ls."laku"];
    $mf{"accPlNeut"} = [$ls."lanu"];
    $mf{"vocPlNeut"} = [$ls."laaraa"];
    $mf{"insPlNeut"} = [$ls."lacheita",$ls."latoo"];
    $mf{"locPlNeut"} = [$ls."laloo"];
    return (\%mf);
}

%desc_noun_forms = {
    "nomSgNeut" => "Nominative, Singular, Neutral gender",
    "genSgNeut" => "Genitive, Singular, Neutral gender",
    "datSgNeut" => "Dative, Singular, Neutral gender",
    "accSgNeut" => "Accusative, Singular, Neutral gender",
    "vocSgNeut" => "Vocative, Singular, Neutral gender",
    "insSgNeut" => "Instrumental, Singular, Neutral gender",
    "locaSgNeut" => "Locative, Singular, Neutral gender",
    "nomSgMasc" => "Nominative, Singular, Masculine gender",
    "genSgMasc" => "Genitive, Singular, Masculine gender",
    "datSgMasc" => "Dative, Singular, Masculine gender",
    "accSgMasc" => "Accusative, Singular, Masculine gender",
    "vocSgMasc" => "Vocative, Singular, Masculine gender",
    "insSgMasc" => "Instrumental, Singular, Masculine gender",
    "locaSgMasc" => "Locative, Singular, Masculine gender",
    "nomSgFemn" => "Nominative, Singular, Feminine gender",
    "genSgFemn" => "Genitive, Singular, Feminine gender",
    "datSgFemn" => "Dative, Singular, Feminine gender",
    "accSgFemn" => "Accusative, Singular, Feminine gender",
    "vocSgFemn" => "Vocative, Singular, Feminine gender",
    "insSgFemn" => "Instrumental, Singular, Feminine gender",
    "locaSgFemn" => "Locative, Singular, Feminine gender",
    "nomPlNeut" => "Nominative, Plural, Neutral gender",
    "genPlNeut" => "Genitive, Plural, Neutral gender",
    "datPlNeut" => "Dative, Plural, Neutral gender",
    "accPlNeut" => "Accusative, Plural, Neutral gender",
    "vocPlNeut" => "Vocative, Plural, Neutral gender",
    "insPlNeut" => "Instrumental, Plural, Neutral gender",
    "locaPlNeut" => "Locative, Plural, Neutral gender",
    "nomPlMasc" => "Nominative, Plural, Masculine gender",
    "genPlMasc" => "Genitive, Plural, Masculine gender",
    "datPlMasc" => "Dative, Plural, Masculine gender",
    "accPlMasc" => "Accusative, Plural, Masculine gender",
    "vocPlMasc" => "Vocative, Plural, Masculine gender",
    "insPlMasc" => "Instrumental, Plural, Masculine gender",
    "locaPlMasc" => "Locative, Plural, Masculine gender",
    "nomPlFemn" => "Nominative, Plural, Feminine gender",
    "genPlFemn" => "Genitive, Plural, Feminine gender",
    "datPlFemn" => "Dative, Plural, Feminine gender",
    "accPlFemn" => "Accusative, Plural, Feminine gender",
    "vocPlFemn" => "Vocative, Plural, Feminine gender",
    "insPlFemn" => "Instrumental, Plural, Feminine gender",
    "locaPlFemn" => "Locative, Plural, Feminine gender"
};
sub print_noun_forms {
    my ($myFOUT, $mf) = (shift, shift);
    my @matches;
    for $key (sort keys %$mf) {
	print $myFOUT "$key:\t@{ $mf->{$key} }\n";
    }
    return;
}

sub print2file_noun_forms {
    my ($word, $mf) = (shift, shift);
    my $txt = "";
    for $key (sort keys %$mf) {
	$txt .= "$word, $desc_noun_forms{$key}, ";
	foreach $wordform (@{ $mf->{$key} }){
	    $txt .= "$wordform ";
	}
	$txt .= "\n";
    }
    $txt .= "\n";
    return ($txt);
}

sub print2file_keys {
    my ($myFOUT, $mf) = (shift, shift);
    my @matches;
    for $key (sort keys %$mf) {
	print $myFOUT "$key ; ";
    }
    print $myFOUT "\n";
    return;
}

sub print2html_noun_forms {
    my ($word, $mf) = (shift, shift);
    my @matches;
    my $txt = "<html><title>Telugu Nouns and Verbs Morphological Generator</title>\n";
    $txt .= "<body><p align=\"left\"><font face=\"arial\">\n";
    $txt .= "<table cellpadding=2 border=0 align=\"left\">\n";
    $txt .= "<tr align=center><td colspan = 2><b>$word</b></td></tr>\n";
    for $key (sort keys %$mf) {
	$txt .= "<tr><td>$desc_noun_forms{$key}</td><td>";
	foreach $wordform (@{ $mf->{$key} }){
	    $txt .= "$wordform,&nbsp; &nbsp;";
	}
	$txt .= "</td></tr>\n";
    }
    $txt .= "</table></body></html>\n";
    return ($txt);
}

return (1);

