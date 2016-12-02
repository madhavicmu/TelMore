sub get_lv {
    my ($word) = shift;
    $word =~ s/\s+//g;
    if ($word =~ /.*[^aeiou]([aeiou]+n\')$/) {$lv = $1;}
    elsif  ($word =~ /.*[^aeiou]([aeiou]+)$/) {$lv = $1;}
    return ($lv);
}

sub get_lsyll {
    my $word = shift;
    ($pfx, $lsyll) = split_at_lastsyll($word);
    return ($lsyll);
}

sub get_numsyll {
    my ($word) = shift;
    @tmp = split (/[aeioux]+/, $word);
    return ($#tmp+1);
}

sub split_at_lastsyll {
    my $word = shift;
    my $ls;
    $am = "";
    if ($word =~ /.*n\'$/) {
	$am = "n'";
    }
    $word =~ s/n\'$//;
    $word =~ s/([^aeioux-]+[aeiou]+)$/ZZ$1/;
    ($pfx, $ls) = split(/ZZ/, $word);
    return ($pfx, $ls.$am);
}




sub get_descriptive_class {
    my ($word) = shift;
    my $pfx, $lsyll;
    ($pfx, $lsyll) = split_at_lastsyll ($word);
    #class 1
    if ($lsyll eq "llu" || $lsyll eq "nnu"){	return (1);    }
    #class 2
    $numsyll = get_numsyll($word);
    if (($numsyll>2) && ($lsyll eq "lu" || $lsyll eq "li" || $lsyll eq "ru")) {
	return (2);
    }
    #class 3
    if ($word eq "goyyi" || $word eq "cheyyi" || $word eq "cheiyi" ||$word eq "nuyyi"){ 
	return (3);
    }
    # class 4
    if ($word eq "cheinu" || $word eq "peinu" || $word eq "veiyi" || $word eq "veyyi"){ 
	return (4);
    }
    #class 5
    if ($word eq "vari" || $word eq "eddu") {
	return (5);
    }
    #class 6
    if ($word eq "pel'l'i" || $word eq "pen'd'li" || $word eq "raayi" || $word eq "raatri"){
	return (6);
    }
    else {return (0);}
}


sub get_descriptive_plural {
    my $word = shift;
    $class = get_descriptive_class($word);
#    print "\n----------------------------------\n";
#    print "$word $class\n";
    #rule 3
    if ($class == 0){
	$plural = $word."l'u";
#	print "\t3\t$plural\n";
    }
    #rule 4
    if ($class == 1){
	$plural = substr($word, 0, length($word)-3)."n'd'ul'u";
#	print "\t4\t$plural\n";
    }
    #rule 5
    if ($class == 3){
	$plural = $word;
	$plural =~ s/y{1,2}i$//;
	$plural .= "y";
	if (length(get_lv($plural))==1){
	    $plural = $plural.substr($plural, length($plural)-1, 1);
	    $plural =~ s/ee/ei/;
	}
	$plural .= "l'u";
#	print "\t5\t$plural\n";
    }
    #rule 6
    if ($class == 2){
	($pfx, $lsyll) = split_at_lastsyll($word);
	$plural = $pfx."n'd'l'u";
#	print "\t6\t$plural\n";
    }
    #rule 7
    if ($class == 4){
	($pfx, $lsyll) = split_at_lastsyll($word);
	$lv = get_lv ($pfx);
	if (length($lv)==1){ 
	    $pfx = $pfx.$lv;
	    $pfx =~ s/ee/ei/g;
	}
	$plural = $pfx."l'u";
#	print "\t7\t$plural\n";
    }
    #rule 8
    if ($class == 5){
	if ($word eq "vari") {$plural = "vad'd'ul'u";}
	elsif ($word eq "eddu") {$plural = "ed'd'ul'u";}
#	print "\t8\t$plural\n";
    }
    #rule 9
    if ($class == 6){
	$plural = $word."l'l'u";
#	print "\t9\t$plural\n";
    }
    #rule 10
    $plural =~ s/(([td]{1}\')\1?)[iu]{1}(l\'u)$/$2$3/; #1
    $plural =~ s/(n\'[td]{1}\')[iu]{1}(l\'u)$/$1$2/; #1
    $tmp=$plural;
    $tmp=~ s/n\'/A/g;
    $tmp=~ s/rx/E/g;
    $tmp=~ s/rx-/EE/g;
    $tmp =~ s/\'//g;
    if ($tmp =~ /([^aeiou]?[aeiou]{2}[lr])[iu]{1}(lu)$/i){ #2 NO l'u since its tmp
	$plural =~ s/[iu]{1}l\'u$/l\'u/;
    }
    elsif ($tmp =~ /([^aeiou][aeiou]{1,2}[^aeiou][aeiou][lr])[iu]{1}(lu)$/i){ #2 NO l'u since its tmp
	$plural =~ s/[iu]{1}l\'u$/l\'u/;
    }
#    print "\t10\t$plural\n";
    #rule 11
    $tmp=$plural;
#    $tmp=~ s/n\'/A/g;
    $tmp=~ s/rx/E/g;
    $tmp=~ s/rx-/EE/g;
    $tmp =~ s/\'//g;
#    print "WORD = $plural\t\tTMP=$tmp\n";
    if ($tmp =~ /(.*[aeiou])[lrd]{1}lu$/i){ #its tmp so no l'u
	$plural =~ s/[lr]l\'u$/l\'l\'u/; #a
	$plural =~ s/d\'l\'u$/l\'l\'u/; #b
    }
#    print "\t11\t$plural\n";
    #rule 12
    $plural =~ s/(.*)([^aeiou]{1}\'*)\2l\'u$/$1$2l\'u/;
#    print "\t12\t$plural\n";
    #rule 13
    $plural =~ s/[a]+n\'l\'u$/aal\'u/; #a
    $plural =~ s/e[i]?n\'l\'u$/eil\'u/; #b
#    print "\t13\t$plural\n";
    #rule 14
    $plural =~ s/([aeiou]+[^aeiou]+)i([^aeiou]+)/$1u$2/g;
    $plural =~ s/([aeiou]+[^aeiou]+)i([^aeiou]+)/$1u$2/g;
    #rule 15
    $plural =~ s/n\'d\'l\'/l\'l\'/g;
    #rule 16
 #   print "\t16b\t$plural\n";
    $plural =~ s/([aeiou]{1,2}[^aeioul]?\'?)l\'([aeiou]+)/$1l$2/g;
#    print "\t16a\t$plural\n";
    #rule 17
    $plural =~ s/y{1,2}([^aeiou])/$1/g;
    
    return ($plural);
}

sub get_plural {
    my ($word, $class) = (shift, shift);
    ($pfx, $lsyll) = split_at_lastsyll ($word);

    #class 1
    if ($lsyll eq "llu" || $lsyll eq "nnu"){
	$pfx = substr($word, 0, length($word)-3);
	return ($pfx."n'd'lu", $pfx."l'l'u");
    }
    
    #class 2
    $numsyll = get_numsyll($word);
    if (($numsyll>2) && ($lsyll eq "lu" || $lsyll eq "li" || $lsyll eq "ru")) {
	$pfx = substr($word, 0, length($word)-2);
	return ($pfx."n'd'lu", $pfx."l'l'u");
    }
    
    # class 3
    if ($word eq "goyyi" ){return ("gootulu");}
    elsif ($word eq "cheyyi" || $word eq "cheiyi"){ return ("cheitulu");}
    elsif ($word eq "nuyyi"){ return ("nuutulu");};

    # class 4
    if ($word eq "cheinu") {return ("cheilu");}
    elsif ($word eq "peinu") {return ("peilu");}
    elsif ($word eq "veiyi" || $word eq "veyyi"){ return ("veilu");}
    
    #class 5
    if ($word eq "vari") {return ("vad'lu");}
    elsif ($word eq "eddu") {return ("eddulu", "ed'd'lu");}

    #class 6
    if ($word eq "pel'l'i" || $word eq "pen'd'li") {return ("pel'l'il'l'u");}
    elsif ($word eq "raayi") {return ("raal'l'u");}
    elsif ($word eq "raatri"){return ("raatril'l'u");}
    
    else {return ("NOT FOUND");}
    
}




return (1);



