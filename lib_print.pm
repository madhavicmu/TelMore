%desc_noun_forms = (
    "nomSgNeut" => "Nominative, Singular, Neutral",
    "genSgNeut" => "Genitive, Singular, Neutral",
    "datSgNeut" => "Dative, Singular, Neutral",
    "accSgNeut" => "Accusative, Singular, Neutral",
    "vocSgNeut" => "Vocative, Singular, Neutral",
    "insSgNeut" => "Instrumental, Singular, Neutral",
    "locSgNeut" => "Locative, Singular, Neutral",
    "nomSgMasc" => "Nominative, Singular, Masculine",
    "genSgMasc" => "Genitive, Singular, Masculine",
    "datSgMasc" => "Dative, Singular, Masculine",
    "accSgMasc" => "Accusative, Singular, Masculine",
    "vocSgMasc" => "Vocative, Singular, Masculine",
    "insSgMasc" => "Instrumental, Singular, Masculine",
    "locSgMasc" => "Locative, Singular, Masculine",
    "nomSgFemn" => "Nominative, Singular, Feminine",
    "genSgFemn" => "Genitive, Singular, Feminine",
    "datSgFemn" => "Dative, Singular, Feminine",
    "accSgFemn" => "Accusative, Singular, Feminine",
    "vocSgFemn" => "Vocative, Singular, Feminine",
    "insSgFemn" => "Instrumental, Singular, Feminine",
    "locSgFemn" => "Locative, Singular, Feminine",
    "nomPlNeut" => "Nominative, Plural, Neutral",
    "genPlNeut" => "Genitive, Plural, Neutral",
    "datPlNeut" => "Dative, Plural, Neutral",
    "accPlNeut" => "Accusative, Plural, Neutral",
    "vocPlNeut" => "Vocative, Plural, Neutral",
    "insPlNeut" => "Instrumental, Plural, Neutral",
    "locPlNeut" => "Locative, Plural, Neutral",
    "nomPlMasc" => "Nominative, Plural, Masculine",
    "genPlMasc" => "Genitive, Plural, Masculine",
    "datPlMasc" => "Dative, Plural, Masculine",
    "accPlMasc" => "Accusative, Plural, Masculine",
    "vocPlMasc" => "Vocative, Plural, Masculine",
    "insPlMasc" => "Instrumental, Plural, Masculine",
    "locPlMasc" => "Locative, Plural, Masculine",
    "nomPlFemn" => "Nominative, Plural, Feminine",
    "genPlFemn" => "Genitive, Plural, Feminine",
    "datPlFemn" => "Dative, Plural, Feminine",
    "accPlFemn" => "Accusative, Plural, Feminine",
    "vocPlFemn" => "Vocative, Plural, Feminine",
    "insPlFemn" => "Instrumental, Plural, Feminine",
    "locPlFemn" => "Locative, Plural, Feminine",
    "nomPlaNeut" => "Nominative, Plural, Neutral (aut)",
    "nomPlaMasc" => "Nominative, Plural, Masculine (aut)",
    "nomPlaFemn" => "Nominative, Plural, Feminine (aut)"
);
%equiv_noun_forms = (
    "nomSgNeut" => "XXX as subject",
    "genSgNeut" => "of XXX",
    "datSgNeut" => "to XXX",
    "accSgNeut" => "XXX as object",
    "vocSgNeut" => "hey XXX",
    "insSgNeut" => "by XXX", 
    "locSgNeut" => "in XXX",
    "nomSgMasc" => "XXX as subject",
    "genSgMasc" => "of XXX",
    "datSgMasc" => "to XXX",
    "accSgMasc" => "XXX as object",
    "vocSgMasc" => "hey XXX",
    "insSgMasc" => "by XXX", 
    "locSgMasc" => "in XXX",
    "nomSgFemn" => "XXX as subject",
    "genSgFemn" => "of XXX",
    "datSgFemn" => "to XXX",
    "accSgFemn" => "XXX as object",
    "vocSgFemn" => "hey XXX",
    "insSgFemn" => "by XXX", 
    "locSgFemn" => "in XXX",
    "nomPlNeut" => "XXXs as subject",
    "genPlNeut" => "of XXXs",
    "datPlNeut" => "to XXXs",
    "accPlNeut" => "XXXs as object",
    "vocPlNeut" => "hey XXXs",
    "insPlNeut" => "by XXXs", 
    "locPlNeut" => "in XXXs",
    "nomPlMasc" => "XXXs as subject",
    "genPlMasc" => "of XXXs",
    "datPlMasc" => "to XXXs",
    "accPlMasc" => "XXXs as object",
    "vocPlMasc" => "hey XXXs",
    "insPlMasc" => "by XXXs", 
    "locPlMasc" => "in XXXs",
    "nomPlFemn" => "XXXs as subject",
    "genPlFemn" => "of XXXs",
    "datPlFemn" => "to XXXs",
    "accPlFemn" => "XXXs as object",
    "vocPlFemn" => "hey XXXs",
    "insPlFemn" => "by XXXs", 
    "locPlFemn" => "in XXXs",
    "nomPlaNeut" => "XXXs as subject",
    "nomPlaMasc" => "XXXs as subject",
    "nomPlaFemn" => "XXXs as subject"
);

sub print_noun_forms {
    my ($myFOUT, $mf) = (shift, shift);
    my @matches;
    for $key (sort keys %$mf) {
	print $myFOUT "$key:\t@{ $mf->{$key} }\n";
    }
    return;
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
    my $toeval = 1;
    my $txt = "<tr align=center><td colspan = 4><b>$word</b></td></tr>\n";
    for $key (sort keys %$mf) {
	$desc = $desc_noun_forms{$key};
	$txt .= "<tr><td>";
	foreach $descfield (split(/,/,$desc)){
	    $txt .= "$descfield</td><td>";
	}
	foreach $wordform (@{ $mf->{$key} }){
	    $txt .= "$wordform,&nbsp; &nbsp;";
	}
         if ($toeval == 0){
		$eng = $equiv_noun_forms{$key};
		$eng =~ s!XXX!<font color=\"maroon\">$word</font>!g;
		$txt .= "</td><td>$eng</td></tr>\n";
	}
	else {
		$txt .= "</td></tr>\n";
	}
    }
    $txt .= "\n";
    return ($txt);
}

sub get_verb_desc {
    my $key = shift;
    $key =~ s/([A-Z123]{1})/-$1/g;
    my @tmp = split (/-/, $key);
    my $desc ="";
    foreach $tmpf (@tmp){
	if    ($tmpf eq '1st') {$desc .= "1st person,";}
	elsif ($tmpf eq '2nd') {$desc .= "2nd person,";}
	elsif ($tmpf eq '3rd') {$desc .= "3rd person,";}
	elsif ($tmpf eq 'Epres') {$desc .= "Present,";}
	elsif ($tmpf eq 'Fpast') {$desc .= "Past,";}
	elsif ($tmpf eq 'Gfutr') {$desc .= "Future,";}
	elsif ($tmpf eq 'Haaff') {$desc .= "Aorist affirmative,";}
	elsif ($tmpf eq 'Ianeg') {$desc .= "Aorist negative,";}
	elsif ($tmpf eq 'Jimpr') {$desc .= "Imperative,";}
	elsif ($tmpf eq 'Kprhb') {$desc .= "Prohibitive,";}
	elsif ($tmpf eq 'Masc') {$desc .= "Masculine,";}
	elsif ($tmpf eq 'Femn') {$desc .= "Feminine,";}
	elsif ($tmpf eq 'Neut') {$desc .= "Neutral,";}
	elsif ($tmpf eq 'Sg') {$desc .= "Singular,";}
	elsif ($tmpf eq 'Pl') {$desc .= "Plural,";}
    }
    return ($desc);
}

sub print2file_verb_forms {
    my ($word, $mf) = (shift, shift);
    my $txt = "";
    for $key (sort keys %$mf) {
	$desc = get_verb_desc ($key);
	foreach $descfield (split(/,/,$desc)){
	    $txt .= "$word, $descfield, ";
	}
	foreach $wordform (@{ $mf->{$key} }){
	    $txt .= "$wordform   ";
	}
	$txt .= "\n";
    }
    return ($txt);
}

sub print2file_eval_verb_forms {
    my ($myFOUT, $word, $mf) = (shift, shift, shift);
    my @matches;
    my @evalkeys = ("EpresSg1stMasc", 
		    "EpresSg2ndMasc", 
		    "EpresSg3rdMasc",
		    "EpresSg3rdFemn",
		    "EpresSg3rdNeut",
		    "EpresPl1stMasc",
		    "EpresPl2ndMasc",
		    "EpresPl3rdMasc",
		    "EpresPl3rdNeut",
		    "FpastSg1stMasc",
		    "FpastSg2ndMasc",
		    "FpastPl1stMasc",
		    "FpastPl2ndMasc",
		    "FpastSg3rdMasc",
		    "FpastSg3rdNeut",
		    "FpastPl3rdMasc",
		    "FpastPl3rdNeut",
		    "GfutrSg1stMasc",
		    "GfutrSg2ndMasc",
		    "GfutrSg3rdMasc",
		    "GfutrSg3rdNeut",
		    "GfutrPl1stMasc",
		    "GfutrPl2ndMasc",
		    "GfutrPl3rdMasc",
		    "GfutrPl3rdNeut",
		    "HaaffSg1stMasc",
		    "HaaffSg2ndMasc",
		    "HaaffSg3rdMasc",
		    "HaaffSg3rdNeut",
		    "HaaffPl1stMasc",
		    "HaaffPl2ndMasc",
		    "HaaffPl3rdMasc",
		    "HaaffPl3rdNeut",
		    "IanegSg1stMasc",
		    "IanegSg2ndMasc",
		    "IanegSg3rdMasc",
		    "IanegSg3rdNeut",
		    "IanegPl1stMasc",
		    "IanegPl2ndMasc",
		    "IanegPl3rdMasc",
		    "IanegPl3rdNeut",
		    "JimprSg2ndMasc",
		    "JimprPl1stMasc",
		    "JimprPl2ndMasc",
		    "KprhbSg2ndMasc",
		    "KprhbPl2ndMasc"
		    );


    my $txt = "";
#    for $key (sort keys %$mf) {
    foreach $key (@evalkeys){
	$desc = get_verb_desc ($key);
	foreach $descfield (split(/,/,$desc)){
	    $txt .= "$descfield,  ";
	}
	foreach $wordform (@{ $mf->{$key} }){
	    $txt .= "$wordform   ";
	}
	$txt .= "\n";
    }
    print $myFOUT $txt;
    return;
}

sub print2html_verb_forms {
    my ($word, $mf) = (shift, shift);
    my @matches;
    my $toeval = 0;
    my $txt = "";
    if ($toeval){
	$txt .= "<tr><td align=right colspan = 6><font color=#FF0044>";
	$txt .= "<b>For Evaluation</b>: Fill in the right most column below for evaluation.<br>\n";
	$txt .= "Only the rows in which one of the radio buttons is selected will be used for evaluation.<br>\n";
	$txt .= "Choose wrong if even one of the words is wrong in the row.<br> ";
	$txt .= "<b>Optional</b>: Enter correction or other correct forms in the text box. Seperate multiple words with a comma.\n"; 
	$txt .= "</font></td></tr>";
    }
    $txt .= "<tr align=center><td colspan = 6><b><font color=#006600>$word</font></b></td></tr>\n";
    for my $key (sort keys %$mf) {
	$desc = get_verb_desc ($key);
	$txt .= "<tr><td>"; 
	foreach $descfield (split(/,/,$desc)){
	    $txt .= "$descfield</td><td>";
	}
	$txt .= "<b>";
	$verbmorphs = "";
	foreach $wordform (@{ $mf->{$key} }){
	    $verbmorphs .= "$wordform,&nbsp; &nbsp;";
	}
	$txt .= "$verbmorphs</b></td>";
	if ($toeval) {
	    my $formtext = create_verbfeedback_form ($key, $word, $verbmorphs); # you create this function in template below
	    #$txt .= "<td>$formtext</td>"; # insert radio button here
	}
	$txt .= "</tr>\n";
    }
    return ($txt);
}

sub create_verbfeedback_form {
    my ($key, $word, $verbmorphs) = (shift, shift, shift);
#    my $txt = ""; # put print statements to create
                  # html form for 3 radio buttons
                  # by default all radio buttons to be unselected
    my $txt = "o &nbsp;correct; &nbsp; o &nbsp;wrong; &nbsp; o don't know; &nbsp; ";
    $txt .= "[&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]"; 
    return ($txt);
}

sub print_html_headers {
    my @matches;
    my $txt = "<html><title>Telugu Nouns and Verbs Morphological Generator</title>\n";
    $txt .= "<body><p align=\"left\"><font face=\"arial\">\n";
    $txt .= "<table border=1 align=\"left\" width=100%>\n";
    return ($txt);
}

sub print_html_footer {
    my @matches;
    my $txt = "</table></body></html>\n";
    return ($txt);
}


sub print2html_eval_verb_forms {
    my ($word, $mf) = (shift, shift);
    my @matches;
    my @evalkeys = ("EpresSg1stMasc", 
		    "EpresSg2ndMasc", 
		    "EpresSg3rdMasc",
		    "EpresSg3rdFemn",
		    "EpresSg3rdNeut",
		    "EpresPl1stMasc",
		    "EpresPl2ndMasc",
		    "EpresPl3rdMasc",
		    "EpresPl3rdNeut",
		    "FpastSg1stMasc",
		    "FpastSg2ndMasc",
		    "FpastPl1stMasc",
		    "FpastPl2ndMasc",
		    "FpastSg3rdMasc",
		    "FpastSg3rdNeut",
		    "FpastPl3rdMasc",
		    "FpastPl3rdNeut",
		    "GfutrSg1stMasc",
		    "GfutrSg2ndMasc",
		    "GfutrSg3rdMasc",
		    "GfutrSg3rdNeut",
		    "GfutrPl1stMasc",
		    "GfutrPl2ndMasc",
		    "GfutrPl3rdMasc",
		    "GfutrPl3rdNeut",
		    "HaaffSg1stMasc",
		    "HaaffSg2ndMasc",
		    "HaaffSg3rdMasc",
		    "HaaffSg3rdNeut",
		    "HaaffPl1stMasc",
		    "HaaffPl2ndMasc",
		    "HaaffPl3rdMasc",
		    "HaaffPl3rdNeut",
		    "IanegSg1stMasc",
		    "IanegSg2ndMasc",
		    "IanegSg3rdMasc",
		    "IanegSg3rdNeut",
		    "IanegPl1stMasc",
		    "IanegPl2ndMasc",
		    "IanegPl3rdMasc",
		    "IanegPl3rdNeut",
		    "JimprSg2ndMasc",
		    "JimprPl1stMasc",
		    "JimprPl2ndMasc",
		    "KprhbSg2ndMasc",
		    "KprhbPl2ndMasc"
		    );

    my $txt = "";
    $txt .= "<tr align=center><td colspan = 6><b><font color=#FF0000 size=+2>$word</font></b></td></tr>\n";
    foreach $key (@evalkeys){
	$desc = get_verb_desc ($key);
	$txt .= "<tr><td>"; 
	foreach $descfield (split(/,/,$desc)){
	    $txt .= "$descfield</td><td>";
	}
	$verbmorphs = "";
	foreach $wordform (@{ $mf->{$key} }){
	    $verbmorphs .= "$wordform,&nbsp; &nbsp;";
	}
	$txt .= "<b>$verbmorphs</b></td>";
	$txt .= "<tr>\n";
    }
    return ($txt);
}
return (1);



















