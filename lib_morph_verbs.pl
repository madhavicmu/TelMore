require "lib_find_plural.pl";

sub find_fcform_nu{ 
    my $word = shift;
    my  ($ls, %mf, $i);
    my (%verb_suffix_pres, %verb_suffix_past, %verb_suffix_futr, %verb_suffix_aaff);
    my (%verb_suffix_aneg, %verb_suffix_impr, %verb_suffix_prhb);
    $pres = $word;
    $pres =~ s/nut\'a$/n\'t\'/;
    $pres =~ s/n\'d\'ut\'a$/n\'t\'/; # un'd'ut'a type
    print "Epresent: $pres\n";
    $mf{"EpresSg1stMasc"} =  [$pres."unnaanu", $pres."aanu"];
    $mf{"EpresSg1stFemn"} =  [$pres."unnaanu", $pres."aanu"];
    $mf{"EpresSg1stNeut"} =  [$pres."unnaanu", $pres."aanu"];
    $mf{"EpresSg2ndMasc"} =  [$pres."unnaavu", $pres."aavu"];
    $mf{"EpresSg2ndFemn"} =  [$pres."unnaavu", $pres."aavu"];
    $mf{"EpresSg2ndNeut"} =  [$pres."unnaavu", $pres."aavu"];
    $mf{"EpresSg3rdMasc"} =  [$pres."unnaad'u", $pres."aad'u"];
    $mf{"EpresSg3rdFemn"} =  [$pres."unnadi", $pres."un'di"];
    $mf{"EpresSg3rdNeut"} =  [$pres."unnadi", $pres."un'di"];

    $mf{"EpresPl1stMasc"} =  [$pres."unnaamu", $pres."aamu"];
    $mf{"EpresPl1stFemn"} =  [$pres."unnaamu", $pres."aamu"];
    $mf{"EpresPl1stNeut"} =  [$pres."unnaamu", $pres."aamu"];
    $mf{"EpresPl2ndMasc"} =  [$pres."unnaaru", $pres."aaru"];
    $mf{"EpresPl2ndFemn"} =  [$pres."unnaaru", $pres."aaru"];
    $mf{"EpresPl2ndNeut"} =  [$pres."unnaaru", $pres."aaru"];
    $mf{"EpresPl3rdMasc"} =  [$pres."unnaaru", $pres."aaru"];
    $mf{"EpresPl3rdFemn"} =  [$pres."unnavi", $pres."avi"];
    $mf{"EpresPl3rdNeut"} =  [$pres."unnavi", $pres."avi"];
    
    $past = $word;
    $past =~ s/nut\'a$/n\'t\'/;
    $past =~ s/n\'d\'ut\'a$/n\'t\'/; # un'd'ut'a type
    $plural =~ s/([aeiou]+[^aeiou]+)u([^aeiou]+)/$1i$2/g;
    $plural =~ s/([aeiou]+[^aeiou]+)u$/$1i/g;
    $mf{"FpastSg1stMasc"} =  [$past."ini"];
    $mf{"FpastSg1stFemn"} =  [$past."ini"];
    $mf{"FpastSg1stNeut"} =  [$past."ini"];
    $mf{"FpastSg2ndMasc"} =  [$past."ivi"];
    $mf{"FpastSg2ndFemn"} =  [$past."ivi"];
    $mf{"FpastSg2ndNeut"} =  [$past."ivi"];

    $mf{"FpastPl1stMasc"} =  [$past."imi"];
    $mf{"FpastPl1stFemn"} =  [$past."imi"];
    $mf{"FpastPl1stNeut"} =  [$past."imi"];
    $mf{"FpastPl2ndMasc"} =  [$past."iri"];
    $mf{"FpastPl2ndFemn"} =  [$past."iri"];
    $mf{"FpastPl2ndNeut"} =  [$past."iri"];

    $past = $word;
    $past =~ s/nut\'a$/n/;
    $past =~ s/n\'d\'ut\'a$/n\'d\'/; # un'd'ut'a type
    $mf{"FpastSg3rdMasc"} =  [$past."enu", $past."inaad'u"];
    $mf{"FpastSg3rdFemn"} =  [$past."enu", $past."inadi", $past."in'di"];
    $mf{"FpastSg3rdNeut"} =  [$past."enu", $past."inadi", $past."in'di"];
    
    $mf{"FpastPl3rdMasc"} =  [$past."iri", $past."inaaru"];
    $mf{"FpastPl3rdFemn"} =  [$past."enu", $past."inavi"];
    $mf{"FpastPl3rdNeut"} =  [$past."enu", $past."inavi"];
    
    $futr = $word;
    $futr =~ s/nut\'a$/n/;
    $futr =~ s/n\'d\'ut\'a$/n\'d\'/; # un'd'ut'a type
    print "Future: $futr\n";
    $mf{"GfutrSg1stMasc"} =  [$futr."edanu"];
    $mf{"GfutrSg1stFemn"} =  [$futr."edanu"];
    $mf{"GfutrSg1stNeut"} =  [$futr."edanu"];
    $mf{"GfutrSg2ndMasc"} =  [$futr."edavu", $futr."eivu"];
    $mf{"GfutrSg2ndFemn"} =  [$futr."edavu", $futr."eivu"];
    $mf{"GfutrSg2ndNeut"} =  [$futr."edavu", $futr."eivu"];
    $mf{"GfutrSg3rdMasc"} =  [$futr."ed'ini", $futr."eini"];
    $mf{"GfutrSg3rdFemn"} =  [$futr."ed'ini", $futr."eini"];
    $mf{"GfutrSg3rdNeut"} =  [$futr."ed'ini", $futr."eini"];

    $mf{"GfutrPl1stMasc"} =  [$futr."edamu"];
    $mf{"GfutrPl1stFemn"} =  [$futr."edamu"];
    $mf{"GfutrPl1stNeut"} =  [$futr."edamu"];
    $mf{"GfutrPl2ndMasc"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl2ndFemn"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl2ndNeut"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl3rdMasc"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl3rdFemn"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl3rdNeut"} =  [$futr."ed'ini", $futr."eini"];

    $aaff = $word;
    $aaff =~ s/nut\'a/n/;
    $aaff =~ s/n\'d\'ut\'a$/n\'d\'/; # un'd'ut'a type
    $mf{"HaaffSg1stMasc"} =  [$aaff."udunu"];
    $mf{"HaaffSg1stFemn"} =  [$aaff."udunu"];
    $mf{"HaaffSg1stNeut"} =  [$aaff."udunu"];
    $mf{"HaaffSg2ndMasc"} =  [$aaff."uduvu"];
    $mf{"HaaffSg2ndFemn"} =  [$aaff."uduvu"];
    $mf{"HaaffSg2ndNeut"} =  [$aaff."uduvu"];
    $mf{"HaaffSg3rdMasc"} =  [$aaff."unu"];
    $mf{"HaaffSg3rdFemn"} =  [$aaff."unu"];
    $mf{"HaaffSg3rdNeut"} =  [$aaff."unu"];
    
    $mf{"HaaffPl1stMasc"} =  [$aaff."udumu"];
    $mf{"HaaffPl1stFemn"} =  [$aaff."udumu"];
    $mf{"HaaffPl1stNeut"} =  [$aaff."udumu"];
    $mf{"HaaffPl2ndMasc"} =  [$aaff."uduru"];
    $mf{"HaaffPl2ndFemn"} =  [$aaff."uduru"];
    $mf{"HaaffPl2ndNeut"} =  [$aaff."uduru"];
    $mf{"HaaffPl3rdMasc"} =  [$aaff."unu"];
    $mf{"HaaffPl3rdFemn"} =  [$aaff."unu"];
    $mf{"HaaffPl3rdNeut"} =  [$aaff."unu"];
    
    $aneg = $word;
    $aneg =~ s/nut\'a$/n/;
    $aneg =~ s/n\'d\'ut\'a$/n\'d\'/; # un'd'ut'a type
    $mf{"IanegSg1stMasc"} =  [$aneg."anu"];
    $mf{"IanegSg1stFemn"} =  [$aneg."anu"];
    $mf{"IanegSg1stNeut"} =  [$aneg."anu"];
    $mf{"IanegSg2ndMasc"} =  [$aneg."avu"];
    $mf{"IanegSg2ndFemn"} =  [$aneg."avu"];
    $mf{"IanegSg2ndNeut"} =  [$aneg."avu"];
    $mf{"IanegSg3rdMasc"} =  [$aneg."ad\'u"];
    $mf{"IanegSg3rdFemn"} =  [$aneg."adu"];
    $mf{"IanegSg3rdNeut"} =  [$aneg."adu"]; 

    $mf{"IanegPl1stMasc"} =  [$aneg."amu"];
    $mf{"IanegPl1stFemn"} =  [$aneg."amu"];
    $mf{"IanegPl1stNeut"} =  [$aneg."amu"];
    $mf{"IanegPl2ndMasc"} =  [$aneg."aru"];
    $mf{"IanegPl2ndFemn"} =  [$aneg."aru"];
    $mf{"IanegPl2ndNeut"} =  [$aneg."aru"];
    $mf{"IanegPl3rdMasc"} =  [$aneg."aru"];
    $mf{"IanegPl3rdFemn"} =  [$aneg."aru"];
    $mf{"IanegPl3rdNeut"} =  [$aneg."avu"]; 

    $impr = $word;
    $impr =~ s/nut\'a/n/;
    $impr =~ s/n\'d\'ut\'a$/n\'d\'/; # un'd'ut'a type
    $mf{"JimprSg2ndMasc"} =  [$impr."u", $impr."umu"];
    $mf{"JimprSg2ndFemn"} =  [$impr."u", $impr."umu"];
    $mf{"JimprSg2ndNeut"} =  [$impr."u", $impr."umu"];

    $mf{"JimprPl1stMasc"} =  [$impr."udamu", $impr."udaamu"];
    $mf{"JimprPl1stFemn"} =  [$impr."udamu", $impr."udaamu"];
    $mf{"JimprPl1stNeut"} =  [$impr."udamu", $impr."udaamu"];
    $mf{"JimprPl2ndMasc"} =  [$impr."uvan\'d\'i"];
    $mf{"JimprPl2ndFemn"} =  [$impr."uvan\'d\'i"];
    $mf{"JimprPl2ndNeut"} =  [$impr."uvan\'d\'i"];

    $prhb = $word;
    $prhb =~ s/nut\'a/n/;
    $prhb =~ s/n\'d\'ut\'a$/n\'d\'/; # un'd'ut'a type
    $mf{"KprhbSg2ndMasc"} =  [$prhb."aku"];
    $mf{"KprhbSg2ndFemn"} =  [$prhb."aku"];
    $mf{"KprhbSg2ndNeut"} =  [$prhb."aku"];
    $mf{"KprhbPl2ndMasc"} =  [$prhb."akan\'d\'i"];
    $mf{"KprhbPl2ndFemn"} =  [$prhb."akan\'d\'i"];
    $mf{"KprhbPl2ndNeut"} =  [$prhb."akan\'d\'i"];

    return (\%mf);
}

sub find_fcform_no_nu{ 
    my $word = shift;
    my  ($ls, %mf, $i);
    my (%verb_suffix_pres, %verb_suffix_past, %verb_suffix_futr, %verb_suffix_aaff);
    my (%verb_suffix_aneg, %verb_suffix_impr, %verb_suffix_prhb);
    $pres = $word;
    $pres =~ s/t\'a$/$1/;
    print "Epresent: $pres\n";
    $mf{"EpresSg1stMasc"} =  [$pres."tunnaanu", $pres."taanu"];
    $mf{"EpresSg1stFemn"} =  [$pres."tunnaanu", $pres."taanu"];
    $mf{"EpresSg1stNeut"} =  [$pres."tunnaanu", $pres."taanu"];
    $mf{"EpresSg2ndMasc"} =  [$pres."tunnaavu", $pres."taavu"];
    $mf{"EpresSg2ndFemn"} =  [$pres."tunnaavu", $pres."taavu"];
    $mf{"EpresSg2ndNeut"} =  [$pres."tunnaavu", $pres."taavu"];
    $mf{"EpresSg3rdMasc"} =  [$pres."tunnaad'u", $pres."taad'u"];
    $mf{"EpresSg3rdFemn"} =  [$pres."tunnadi", $pres."tun'di"];
    $mf{"EpresSg3rdNeut"} =  [$pres."tunnadi", $pres."tun'di"];
    
    $mf{"EpresPl1stMasc"} =  [$pres."tunnaamu", $pres."taamu"];
    $mf{"EpresPl1stFemn"} =  [$pres."tunnaamu", $pres."taamu"];
    $mf{"EpresPl1stNeut"} =  [$pres."tunnaamu", $pres."taamu"];
    $mf{"EpresPl2ndMasc"} =  [$pres."tunnaaru", $pres."taaru"];
    $mf{"EpresPl2ndFemn"} =  [$pres."tunnaaru", $pres."taaru"];
    $mf{"EpresPl2ndNeut"} =  [$pres."tunnaaru", $pres."taaru"];
    $mf{"EpresPl3rdMasc"} =  [$pres."tunnaaru", $pres."taaru"];
    $mf{"EpresPl3rdFemn"} =  [$pres."tunnaaru", $pres."taaru"];
    $mf{"EpresPl3rdNeut"} =  [$pres."tunnavi", $pres."tavi"];
    
    $past = $word;
    $past =~ s/ut\'a$/$1/;
    $past =~ s/(^[^aeiou]*[aeiou]+)([^aeiou]+)u([^aeiou]+)/$1$2i$3/g;
    $past =~ s/([^aeiou]+)u$/$1i/;
    $mf{"FpastSg1stMasc"} =  [$past."itini", $past."aanu"];
    $mf{"FpastSg1stFemn"} =  [$past."itini", $past."aanu"];
    $mf{"FpastSg1stNeut"} =  [$past."itini", $past."aanu"];
    $mf{"FpastSg2ndMasc"} =  [$past."itivi", $past."aavu"];
    $mf{"FpastSg2ndFemn"} =  [$past."itivi", $past."aavu"];
    $mf{"FpastSg2ndNeut"} =  [$past."itivi", $past."aavu"];
    $mf{"FpastSg3rdMasc"} =  [$past."enu", $past."aad'u"];
    $mf{"FpastSg3rdFemn"} =  [$past."enu", $past."in'di"];
    $mf{"FpastSg3rdNeut"} =  [$past."enu", $past."in'di"];
    
    $mf{"FpastPl1stMasc"} =  [$past."itimi", $past."aamu"];
    $mf{"FpastPl1stFemn"} =  [$past."itimi", $past."aamu"];
    $mf{"FpastPl1stNeut"} =  [$past."itimi", $past."aamu"];
    $mf{"FpastPl2ndMasc"} =  [$past."itiri", $past."aaru"];
    $mf{"FpastPl2ndFemn"} =  [$past."itiri", $past."aaru"];
    $mf{"FpastPl2ndNeut"} =  [$past."itiri", $past."aaru"];
    $mf{"FpastPl3rdMasc"} =  [$past."iri", $past."aaru"];
    $mf{"FpastPl3rdFemn"} =  [$past."iri", $past."aaru"];
    $mf{"FpastPl3rdNeut"} =  [$past."enu", $past."inavi"];
    
    $futr = $word;
    $futr =~ s/ut\'a$/$1/;
    $futr =~ s/(^[^aeiou]*[aeiou]+)([^aeiou]+)u([^aeiou]+)$/$1$2i$3/;
    print "Future: $futr\n";
    $mf{"GfutrSg1stMasc"} =  [$futr."edanu"];
    $mf{"GfutrSg1stFemn"} =  [$futr."edanu"];
    $mf{"GfutrSg1stNeut"} =  [$futr."edanu"];
    $mf{"GfutrSg2ndMasc"} =  [$futr."edavu"];
    $mf{"GfutrSg2ndFemn"} =  [$futr."edavu"];
    $mf{"GfutrSg2ndNeut"} =  [$futr."edavu"];
    $mf{"GfutrSg3rdMasc"} =  [$futr."ed'ini"];
    $mf{"GfutrSg3rdFemn"} =  [$futr."ed'ini"];
    $mf{"GfutrSg3rdNeut"} =  [$futr."ed'ini"];

    $mf{"GfutrPl1stMasc"} =  [$futr."edamu"];
    $mf{"GfutrPl1stFemn"} =  [$futr."edamu"];
    $mf{"GfutrPl1stNeut"} =  [$futr."edamu"];
    $mf{"GfutrPl2ndMasc"} =  [$futr."edaru"];
    $mf{"GfutrPl2ndFemn"} =  [$futr."edaru"];
    $mf{"GfutrPl2ndNeut"} =  [$futr."edaru"];
    $mf{"GfutrPl3rdMasc"} =  [$futr."edaru"];
    $mf{"GfutrPl3rdFemn"} =  [$futr."edaru"];
    $mf{"GfutrPl3rdNeut"} =  [$futr."ed'ini"];

    $aaff = $word;
    $aaff =~ s/ut\'a/$1/;
    $mf{"HaaffSg1stMasc"} =  [$aaff."udunu"];
    $mf{"HaaffSg1stFemn"} =  [$aaff."udunu"];
    $mf{"HaaffSg1stNeut"} =  [$aaff."udunu"];
    $mf{"HaaffSg2ndMasc"} =  [$aaff."uduvu"];
    $mf{"HaaffSg2ndFemn"} =  [$aaff."uduvu"];
    $mf{"HaaffSg2ndNeut"} =  [$aaff."uduvu"];
    $mf{"HaaffSg3rdMasc"} =  [$aaff."unu"];
    $mf{"HaaffSg3rdFemn"} =  [$aaff."unu"];
    $mf{"HaaffSg3rdNeut"} =  [$aaff."unu"];
    
    $mf{"HaaffPl1stMasc"} =  [$aaff."udumu"];
    $mf{"HaaffPl1stFemn"} =  [$aaff."udumu"];
    $mf{"HaaffPl1stNeut"} =  [$aaff."udumu"];
    $mf{"HaaffPl2ndMasc"} =  [$aaff."uduru"];
    $mf{"HaaffPl2ndFemn"} =  [$aaff."uduru"];
    $mf{"HaaffPl2ndNeut"} =  [$aaff."uduru"];
    $mf{"HaaffPl3rdMasc"} =  [$aaff."uduru"];
    $mf{"HaaffPl3rdFemn"} =  [$aaff."uduru"];
    $mf{"HaaffPl3rdNeut"} =  [$aaff."unu"];
    
    $aneg = $word;
    $aneg =~ s/ut\'a/$1/;
    $mf{"IanegSg1stMasc"} =  [$aneg."anu"];
    $mf{"IanegSg1stFemn"} =  [$aneg."anu"];
    $mf{"IanegSg1stNeut"} =  [$aneg."anu"];
    $mf{"IanegSg2ndMasc"} =  [$aneg."avu"];
    $mf{"IanegSg2ndFemn"} =  [$aneg."avu"];
    $mf{"IanegSg2ndNeut"} =  [$aneg."avu"];
    $mf{"IanegSg3rdMasc"} =  [$aneg."ad'u"];
    $mf{"IanegSg3rdFemn"} =  [$aneg."adu"];
    $mf{"IanegSg3rdNeut"} =  [$aneg."adu"];

    $mf{"IanegPl1stMasc"} =  [$aneg."amu"];
    $mf{"IanegPl1stFemn"} =  [$aneg."amu"];
    $mf{"IanegPl1stNeut"} =  [$aneg."amu"];
    $mf{"IanegPl2ndMasc"} =  [$aneg."aru"];
    $mf{"IanegPl2ndFemn"} =  [$aneg."aru"];
    $mf{"IanegPl2ndNeut"} =  [$aneg."aru"];
    $mf{"IanegPl3rdMasc"} =  [$aneg."aru"];
    $mf{"IanegPl3rdFemn"} =  [$aneg."aru"];
    $mf{"IanegPl3rdNeut"} =  [$aneg."avu"];

    $impr = $word;
    $impr =~ s/ut\'a$//;
    $mf{"JimprSg2ndMasc"} =  [$impr."u", $impr."umu"];
    $mf{"JimprSg2ndFemn"} =  [$impr."u", $impr."umu"];
    $mf{"JimprSg2ndNeut"} =  [$impr."u", $impr."umu"];

    $mf{"JimprPl1stMasc"} =  [$impr."udamu"];
    $mf{"JimprPl1stFemn"} =  [$impr."udamu"];
    $mf{"JimprPl1stNeut"} =  [$impr."udamu"];

    $mf{"JimprPl2ndMasc"} =  [$impr."an\'d\'i"];
    $mf{"JimprPl2ndFemn"} =  [$impr."an\'d\'i"];
    $mf{"JimprPl2ndNeut"} =  [$impr."an\'d\'i"];

    $prhb = $word;
    $prhb =~ s/ut\'a$//;
    $mf{"KprhbSg2ndMasc"} =  [$prhb."aku"];
    $mf{"KprhbSg2ndFemn"} =  [$prhb."aku"];
    $mf{"KprhbSg2ndNeut"} =  [$prhb."aku"];

    $mf{"KprhbPl2ndMasc"} =  [$prhb."akan\'d\'i"];
    $mf{"KprhbPl2ndFemn"} =  [$prhb."akan\'d\'i"];
    $mf{"KprhbPl2ndNeut"} =  [$prhb."akan\'d\'i"];

#    %verb_suffix_prhb = (
#			 "Sg2ndPrhbMasc" => "aka,aku,akumu,akumaa,akumii",
#			 "Sg2ndPrhbFemn" => "aka,aku,akumu,akumaa,akumii",
#			 "Sg2ndPrhbNeut" => "aka,aku,akumu,akumaa,akumii",
#			 );
#    for $key (keys %verb_suffix_impr){
#	@sfxs = split(/,/,$verb_suffix_impr{$key});
#	for ($i=0; $i<=$#sfxs; $i++) {
#	    $mf{$key}[$i] = $impr.$sfxs[$i];
#	}
#    }
    return (\%mf);
}

sub find_scform{ 
    my $word = shift;
    my  ($ls, %mf, $i);
    my (%verb_suffix_pres, %verb_suffix_past, %verb_suffix_futr, %verb_suffix_aaff);
    my (%verb_suffix_aneg, %verb_suffix_impr, %verb_suffix_prhb);
    $pres = $word;
    $pres =~ s/(.*)[ys]{1,2}ut\'a$/$1/;
    print "Epresent: $pres\n";
    $mf{"EpresSg1stMasc"} =  [$pres."yuchunnaanu", $pres."stunnaanu", $pres."staanu"];
    $mf{"EpresSg1stFemn"} =  [$pres."yuchunnaanu", $pres."stunnaanu", $pres."staanu"];
    $mf{"EpresSg1stNeut"} =  [$pres."yuchunnaanu", $pres."stunnaanu", $pres."staanu"];
    $mf{"EpresSg2ndMasc"} =  [$pres."yuchunnaavu", $pres."stunnavu",  $pres."staavu"];
    $mf{"EpresSg2ndFemn"} =  [$pres."yuchunnaavu", $pres."stunnavu",  $pres."staavu"];
    $mf{"EpresSg2ndNeut"} =  [$pres."yuchunnaavu", $pres."stunnavu",  $pres."staavu"];
    $mf{"EpresSg3rdMasc"} =  [$pres."yuchunnaad'u", $pres."stunnaad'u", $pres."staad'u"];
    $mf{"EpresSg3rdFemn"} =  [$pres."yuchunnadi", $pres."stunnadi", $pres."stun'di"];
    $mf{"EpresSg3rdNeut"} =  [$pres."yuchunnadi", $pres."stunnadi", $pres."stun'di"];
    
    $mf{"EpresPl1stMasc"} =  [$pres."yuchunnaamu", $pres."stunnaamu", $pres."staamu"];
    $mf{"EpresPl1stFemn"} =  [$pres."yuchunnaamu", $pres."stunnaamu", $pres."staamu"];
    $mf{"EpresPl1stNeut"} =  [$pres."yuchunnaamu", $pres."stunnaamu", $pres."staamu"];
    $mf{"EpresPl2ndMasc"} =  [$pres."yuchunnaaru", $pres."stunnaru",  $pres."staaru"];
    $mf{"EpresPl2ndFemn"} =  [$pres."yuchunnaaru", $pres."stunnaru",  $pres."staaru"];
    $mf{"EpresPl2ndNeut"} =  [$pres."yuchunnaaru", $pres."stunnaru",  $pres."staaru"];
    $mf{"EpresPl3rdMasc"} =  [$pres."yuchunnaaru", $pres."stunnaaru", $pres."staaru"];
    $mf{"EpresPl3rdFemn"} =  [$pres."yuchunnaaru", $pres."stunnaaru", $pres."staaru"];
    $mf{"EpresPl3rdNeut"} =  [$pres."yuchunnavi", $pres."stunnavi"];
    
    $past = $word;
    $past =~ s/(.*)[ys]{1,2}ut\'a/$1/;
    $plural =~ s/([aeiou]+[^aeiou]+)u([^aeiou]+)/$1i$2/g;
    $plural =~ s/([aeiou]+[^aeiou]+)u$/$1i$2/g;
    print "Fpast: $past\t$verb_suffix_past{$key}\n";
    $mf{"FpastSg1stMasc"} =  [$past."sitini", $past."stini", $past."shaanu"];
    $mf{"FpastSg1stFemn"} =  [$past."sitini", $past."stini", $past."shaanu"];
    $mf{"FpastSg1stNeut"} =  [$past."sitini", $past."stini", $past."shaanu"];
    $mf{"FpastSg2ndMasc"} =  [$past."sitivi", $past."stivi", $past."shaavu"];
    $mf{"FpastSg2ndFemn"} =  [$past."sitivi", $past."stivi", $past."shaavu"];
    $mf{"FpastSg2ndNeut"} =  [$past."sitivi", $past."stivi", $past."shaavu"];
    $mf{"FpastSg3rdMasc"} =  [$past."senu", $past."sinaad'u", $past."shaad'u"];
    $mf{"FpastSg3rdFemn"} =  [$past."senu", $past."sinadi", $past."shin'di"];
    $mf{"FpastSg3rdNeut"} =  [$past."senu", $past."sinadi", $past."shin'di"];
    
    $mf{"FpastPl1stMasc"} =  [$past."sitimi", $past."stimi", $past."shaamu"];
    $mf{"FpastPl1stFemn"} =  [$past."sitimi", $past."stimi", $past."shaamu"];
    $mf{"FpastPl1stNeut"} =  [$past."sitimi", $past."stimi", $past."shaamu"];
    $mf{"FpastPl2ndMasc"} =  [$past."sitiri", $past."stiri", $past."shaaru"];
    $mf{"FpastPl2ndFemn"} =  [$past."sitiri", $past."stiri", $past."shaaru"];
    $mf{"FpastPl2ndNeut"} =  [$past."sitiri", $past."stiri", $past."shaaru"];
    $mf{"FpastPl3rdMasc"} =  [$past."sitiri", $past."sinaaru", $past."shaaru"];
    $mf{"FpastPl3rdFemn"} =  [$past."sitiri", $past."sinaaru", $past."shaaru"];
    $mf{"FpastPl3rdNeut"} =  [$past."senu", $past."sinavi", $past."shinavi"];
    
    $futr = $word;
    $futr =~ s/(.*)[ys]{1,2}ut\'a/$1/;
    print "Future: $futr\n";
    $mf{"GfutrSg1stMasc"} =  [$futr."sedanu", $futr."seinu", $futr."sheinu"];
    $mf{"GfutrSg1stFemn"} =  [$futr."sedanu", $futr."seinu", $futr."sheinu"];
    $mf{"GfutrSg1stNeut"} =  [$futr."sedanu", $futr."seinu", $futr."sheinu"];
    $mf{"GfutrSg2ndMasc"} =  [$futr."sedavu", $futr."seivu", $futr."sheivu"];
    $mf{"GfutrSg2ndFemn"} =  [$futr."sedavu", $futr."seivu", $futr."sheivu"];
    $mf{"GfutrSg2ndNeut"} =  [$futr."sedavu", $futr."seivu", $futr."sheivu"];
    $mf{"GfutrSg3rdMasc"} =  [$futr."sed'ini", $futr."shed'ini"];
    $mf{"GfutrSg3rdFemn"} =  [$futr."sed'ini", $futr."shed'ini"];
    $mf{"GfutrSg3rdNeut"} =  [$futr."sed'ini", $futr."shed'ini"];

    $mf{"GfutrPl1stMasc"} =  [$futr."sedamu", $futr."seimu", $futr."sheimu"];
    $mf{"GfutrPl1stFemn"} =  [$futr."sedamu", $futr."seimu", $futr."sheimu"];
    $mf{"GfutrPl1stNeut"} =  [$futr."sedamu", $futr."seimu", $futr."sheimu"];
    $mf{"GfutrPl2ndMasc"} =  [$futr."sedaru", $futr."seiru", $futr."sheiru"];
    $mf{"GfutrPl2ndFemn"} =  [$futr."sedaru", $futr."seiru", $futr."sheiru"];
    $mf{"GfutrPl2ndNeut"} =  [$futr."sedaru", $futr."seiru", $futr."sheiru"];
    $mf{"GfutrPl3rdMasc"} =  [$futr."sedaru", $futr."seiru", $futr."sheiru"];
    $mf{"GfutrPl3rdFemn"} =  [$futr."sedaru", $futr."seiru", $futr."sheiru"];
    $mf{"GfutrPl3rdNeut"} =  [$futr."sed'ini", $futr."seini"];

    $aaff = $word;
    $aaff =~ s/(.*)[ys]{1,2}ut\'a/$1/;
    $mf{"HaaffSg1stMasc"} =  [$aaff."yudunu", $aaff."tunu", $aaff."stunu"];
    $mf{"HaaffSg1stFemn"} =  [$aaff."yudunu", $aaff."tunu", $aaff."stunu"];
    $mf{"HaaffSg1stNeut"} =  [$aaff."yudunu", $aaff."tunu", $aaff."stunu"];
    $mf{"HaaffSg2ndMasc"} =  [$aaff."yuduvu", $aaff."tuvu", $aaff."stuvu"];
    $mf{"HaaffSg2ndFemn"} =  [$aaff."yuduvu", $aaff."tuvu", $aaff."stuvu"];
    $mf{"HaaffSg2ndNeut"} =  [$aaff."yuduvu", $aaff."tuvu", $aaff."stuvu"];
    $mf{"HaaffSg3rdMasc"} =  [$aaff."yunu", $aaff."sunu"];
    $mf{"HaaffSg3rdFemn"} =  [$aaff."yunu", $aaff."sunu"];
    $mf{"HaaffSg3rdNeut"} =  [$aaff."yunu", $aaff."sunu"];
    
    $mf{"HaaffPl1stMasc"} =  [$aaff."yudumu", $aaff."tumu", $aaff."stumu"];
    $mf{"HaaffPl1stFemn"} =  [$aaff."yudumu", $aaff."tumu", $aaff."stumu"];
    $mf{"HaaffPl1stNeut"} =  [$aaff."yudumu", $aaff."tumu", $aaff."stumu"];
    $mf{"HaaffPl2ndMasc"} =  [$aaff."yuduru", $aaff."turu", $aaff."sturu"];
    $mf{"HaaffPl2ndFemn"} =  [$aaff."yuduru", $aaff."turu", $aaff."sturu"];
    $mf{"HaaffPl2ndNeut"} =  [$aaff."yuduru", $aaff."turu", $aaff."sturu"];
    $mf{"HaaffPl3rdMasc"} =  [$aaff."yuduru", $aaff."turu"];
    $mf{"HaaffPl3rdFemn"} =  [$aaff."yuduru", $aaff."turu"];
    $mf{"HaaffPl3rdNeut"} =  [$aaff."yunu", $aaff."sunu"];

    $aneg = $word;
    $aneg =~ s/(.*)[ys]{1,2}ut\'a/$1/;
    $anegShort = $aneg;
    $anegShort =~ s/([aeiou])[aeiou]/$1/; # do this only for Sg1st occurence of long vowel
    $mf{"IanegSg1stMasc"} =  [$aneg."yanu", $anegShort."yyanu"];
    $mf{"IanegSg1stFemn"} =  [$aneg."yanu", $anegShort."yyanu"];
    $mf{"IanegSg1stNeut"} =  [$aneg."yanu", $anegShort."yyanu"];
    $mf{"IanegSg2ndMasc"} =  [$aneg."yavu", $anegShort."yyavu"];
    $mf{"IanegSg2ndFemn"} =  [$aneg."yavu", $anegShort."yyavu"];
    $mf{"IanegSg2ndNeut"} =  [$aneg."yavu", $anegShort."yyavu"];
    $mf{"IanegSg3rdMasc"} =  [$aneg."yad'u", $anegShort."yyad'u"];
    $mf{"IanegSg3rdFemn"} =  [$aneg."yadu", $anegShort."yyadu"];
    $mf{"IanegSg3rdNeut"} =  [$aneg."yadu", $anegShort."yyadu"];

    $mf{"IanegPl1stMasc"} =  [$aneg."yamu", $anegShort."yyamu"];
    $mf{"IanegPl1stFemn"} =  [$aneg."yamu", $anegShort."yyamu"];
    $mf{"IanegPl1stNeut"} =  [$aneg."yamu", $anegShort."yyamu"];
    $mf{"IanegPl2ndMasc"} =  [$aneg."yaru", $anegShort."yyaru"];
    $mf{"IanegPl2ndFemn"} =  [$aneg."yaru", $anegShort."yyaru"];
    $mf{"IanegPl2ndNeut"} =  [$aneg."yaru", $anegShort."yyaru"];
    $mf{"IanegPl3rdMasc"} =  [$aneg."yaru", $anegShort."yyaru"];
    $mf{"IanegPl3rdFemn"} =  [$aneg."yaru", $anegShort."yyaru"];
    $mf{"IanegPl3rdNeut"} =  [$aneg."yavu", $anegShort."yyavu"];

    $impr = $word;
    $impr =~ s/(.*)[ys]{1,2}ut\'a/$1/;
    $mf{"JimprSg2ndMasc"} =  [$impr."yi", $impr."yumu"];
    $mf{"JimprSg2ndFemn"} =  [$impr."yi", $impr."yumu"];
    $mf{"JimprSg2ndNeut"} =  [$impr."yi", $impr."yumu"];

    $mf{"JimprPl1stMasc"} =  [$impr."yudamu"];
    $mf{"JimprPl1stFemn"} =  [$impr."yudamu"];
    $mf{"JimprPl1stNeut"} =  [$impr."yudamu"];

    $mf{"JimprPl2ndMasc"} =  [$impr."yan\'d\'i"];
    $mf{"JimprPl2ndFemn"} =  [$impr."yan\'d\'i"];
    $mf{"JimprPl2ndNeut"} =  [$impr."yan\'d\'i"];

    $prhb = $word;
    $prhb =~ s/[ys]{1,2}ut\'a$//;
    $prhbShort = $prhb;
    $prhbShort =~ s/([aeiou])[aeiou]/$1/; # do this only for Sg1st occurence of long vowel
    $mf{"KprhbSg2ndMasc"} =  [$prhb."yaku", $prhbShort."yyaku"];
    $mf{"KprhbSg2ndFemn"} =  [$prhb."yaku", $prhbShort."yyaku"];
    $mf{"KprhbSg2ndNeut"} =  [$prhb."yaku", $prhbShort."yyaku"];

    $mf{"KprhbPl2ndMasc"} =  [$prhb."yakan\'d\'i"];
    $mf{"KprhbPl2ndFemn"} =  [$prhb."yakan\'d\'i"];
    $mf{"KprhbPl2ndNeut"} =  [$prhb."yakan\'d\'i"];

    return (\%mf);
}




sub find_tcform{ 
    my $word = shift;
    my  ($ls, %mf, $i);
    my (%verb_suffix_pres, %verb_suffix_past, %verb_suffix_futr, %verb_suffix_aaff);
    my (%verb_suffix_aneg, %verb_suffix_impr, %verb_suffix_prhb);
    $pres = $word;
    $pres =~ s/(.*(ch)\2?)ut\'a$/$1/;
    $mf{"EpresSg1stMasc"} =  [$pres."utunnaanu", $pres."utaanu"];
    $mf{"EpresSg1stFemn"} =  [$pres."utunnaanu", $pres."utaanu"];
    $mf{"EpresSg1stNeut"} =  [$pres."utunnaanu", $pres."utaanu"];
    $mf{"EpresSg2ndMasc"} =  [$pres."utunnavu", $pres."utaavu"];
    $mf{"EpresSg2ndFemn"} =  [$pres."utunnavu", $pres."utaavu"];
    $mf{"EpresSg2ndNeut"} =  [$pres."utunnavu", $pres."utaavu"];
    $mf{"EpresSg3rdMasc"} =  [$pres."utunnaad'u", $pres."utaad'u"];
    $mf{"EpresSg3rdFemn"} =  [$pres."utunnadi", $pres."utun'di"];
    $mf{"EpresSg3rdNeut"} =  [$pres."utunnadi", $pres."utun'di"];
    
    $mf{"EpresPl1stMasc"} =  [$pres."utunnaamu", $pres."utaamu"];
    $mf{"EpresPl1stFemn"} =  [$pres."utunnaamu", $pres."utaamu"];
    $mf{"EpresPl1stNeut"} =  [$pres."utunnaamu", $pres."utaamu"];
    $mf{"EpresPl2ndMasc"} =  [$pres."utunnaru", $pres."utaavu"];
    $mf{"EpresPl2ndFemn"} =  [$pres."utunnaru", $pres."utaavu"];
    $mf{"EpresPl2ndNeut"} =  [$pres."utunnaru", $pres."utaavu"];
    $mf{"EpresPl3rdMasc"} =  [$pres."utunnaaru", $pres."utaaru"];
    $mf{"EpresPl3rdFemn"} =  [$pres."utunnaaru", $pres."utaaru"];
    $mf{"EpresPl3rdNeut"} =  [$pres."utunnavi"];
    
    $past = $word;
    $past =~ s/(.*(ch)\2?)ut\'a/$1/;
    $plural =~ s/([aeiou]+[^aeiou]+)u([^aeiou]+)/$1i$2/g;
    $plural =~ s/([aeiou]+[^aeiou]+)u([^aeiou]+)/$1i$2/g;
    $mf{"FpastSg1stMasc"} =  [$past."itini", $past."inaanu", $past."aanu"];
    $mf{"FpastSg1stFemn"} =  [$past."itini", $past."inaanu", $past."aanu"];
    $mf{"FpastSg1stNeut"} =  [$past."itini", $past."inaanu", $past."aanu"];
    $mf{"FpastSg2ndMasc"} =  [$past."itivi", $past."inaavu", $past."aavu"];
    $mf{"FpastSg2ndFemn"} =  [$past."itivi", $past."inaavu", $past."aavu"];
    $mf{"FpastSg2ndNeut"} =  [$past."itivi", $past."inaavu", $past."aavu"];
    $mf{"FpastSg3rdMasc"} =  [$past."enu", $past."inaad'u", $past."aad'u"];
    $mf{"FpastSg3rdFemn"} =  [$past."inadi", $past."in'di"];
    $mf{"FpastSg3rdNeut"} =  [$past."inadi", $past."in'di"];
    
    $mf{"FpastPl1stMasc"} =  [$past."itimi", $past."inaamu", $past."aamu"];
    $mf{"FpastPl1stFemn"} =  [$past."itimi", $past."inaamu", $past."aamu"];
    $mf{"FpastPl1stNeut"} =  [$past."itimi", $past."inaamu", $past."aamu"];
    $mf{"FpastPl2ndMasc"} =  [$past."itiri", $past."inaaru", $past."aaru"];
    $mf{"FpastPl2ndFemn"} =  [$past."itiri", $past."inaaru", $past."aaru"];
    $mf{"FpastPl2ndNeut"} =  [$past."itiri", $past."inaaru", $past."aaru"];
    $mf{"FpastPl3rdMasc"} =  [$past."inaaru", $past."aaru"];
    $mf{"FpastPl3rdFemn"} =  [$past."inaaru", $past."aaru"];
    $mf{"FpastPl3rdNeut"} =  [$past."inaaru", $past."aaru"];
    
    $futr = $word;
    $futr =~ s/(.*(ch)\2?)ut\'a/$1/;
    $mf{"GfutrSg1stMasc"} =  [$futr."edanu", $futr."einu"];
    $mf{"GfutrSg1stFemn"} =  [$futr."edanu", $futr."einu"];
    $mf{"GfutrSg1stNeut"} =  [$futr."edanu", $futr."einu"];
    $mf{"GfutrSg2ndMasc"} =  [$futr."edavu", $futr."eivu"];
    $mf{"GfutrSg2ndFemn"} =  [$futr."edavu", $futr."eivu"];
    $mf{"GfutrSg2ndNeut"} =  [$futr."edavu", $futr."eivu"];
    $mf{"GfutrSg3rdMasc"} =  [$futr."ed'ini", $futr."iini"];
    $mf{"GfutrSg3rdFemn"} =  [$futr."ed'ini", $futr."iini"];
    $mf{"GfutrSg3rdNeut"} =  [$futr."ed'ini", $futr."iini"];

    $mf{"GfutrPl1stMasc"} =  [$futr."edamu", $futr."eimu"];
    $mf{"GfutrPl1stFemn"} =  [$futr."edamu", $futr."eimu"];
    $mf{"GfutrPl1stNeut"} =  [$futr."edamu", $futr."eimu"];
    $mf{"GfutrPl2ndMasc"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl2ndFemn"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl2ndNeut"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl3rdMasc"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl3rdFemn"} =  [$futr."edaru", $futr."eiru"];
    $mf{"GfutrPl3rdNeut"} =  [$futr."edaru", $futr."eiru"];

    $aaff = $word;
    $aaff =~ s/(.*(ch)\2?)ut\'a/$1/;
    $mf{"HaaffSg1stMasc"} =  [$aaff."udunu", $aaff."utunu"];
    $mf{"HaaffSg1stFemn"} =  [$aaff."udunu", $aaff."utunu"];
    $mf{"HaaffSg1stNeut"} =  [$aaff."udunu", $aaff."utunu"];
    $mf{"HaaffSg2ndMasc"} =  [$aaff."uduvu", $aaff."utuvu"];
    $mf{"HaaffSg2ndFemn"} =  [$aaff."uduvu", $aaff."utuvu"];
    $mf{"HaaffSg2ndNeut"} =  [$aaff."uduvu", $aaff."utuvu"];
    $mf{"HaaffSg3rdMasc"} =  [$aaff."unu"];
    $mf{"HaaffSg3rdFemn"} =  [$aaff."unu"];
    $mf{"HaaffSg3rdNeut"} =  [$aaff."unu"];
    
    $mf{"HaaffPl1stMasc"} =  [$aaff."udumu", $aaff."utumu"];
    $mf{"HaaffPl1stFemn"} =  [$aaff."udumu", $aaff."utumu"];
    $mf{"HaaffPl1stNeut"} =  [$aaff."udumu", $aaff."utumu"];
    $mf{"HaaffPl2ndMasc"} =  [$aaff."uduru", $aaff."uturu"];
    $mf{"HaaffPl2ndFemn"} =  [$aaff."uduru", $aaff."uturu"];
    $mf{"HaaffPl2ndNeut"} =  [$aaff."uduru", $aaff."uturu"];
    $mf{"HaaffPl3rdMasc"} =  [$aaff."uduru"];
    $mf{"HaaffPl3rdFemn"} =  [$aaff."uduru"];
    $mf{"HaaffPl3rdNeut"} =  [$aaff."unu"];
    
    $aneg = $word;
    $aneg =~ s/(.*(ch)\2?)ut\'a/$1/;
    $mf{"IanegSg1stMasc"} =  [$aneg."anu"];
    $mf{"IanegSg1stFemn"} =  [$aneg."anu"];
    $mf{"IanegSg1stNeut"} =  [$aneg."anu"];
    $mf{"IanegSg2ndMasc"} =  [$aneg."avu"];
    $mf{"IanegSg2ndFemn"} =  [$aneg."avu"];
    $mf{"IanegSg2ndNeut"} =  [$aneg."avu"];
    $mf{"IanegSg3rdMasc"} =  [$aneg."ad'u"];
    $mf{"IanegSg3rdFemn"} =  [$aneg."adu"];
    $mf{"IanegSg3rdNeut"} =  [$aneg."adu"];

    $mf{"IanegPl1stMasc"} =  [$aneg."amu"];
    $mf{"IanegPl1stFemn"} =  [$aneg."amu"];
    $mf{"IanegPl1stNeut"} =  [$aneg."amu"];
    $mf{"IanegPl2ndMasc"} =  [$aneg."aru"];
    $mf{"IanegPl2ndFemn"} =  [$aneg."aru"];
    $mf{"IanegPl2ndNeut"} =  [$aneg."aru"];
    $mf{"IanegPl3rdMasc"} =  [$aneg."aru"];
    $mf{"IanegPl3rdFemn"} =  [$aneg."aru"];
    $mf{"IanegPl3rdNeut"} =  [$aneg."avu"];

    $impr = $word;
    $impr =~ s/(.*(ch)\2?)ut\'a/$1/;
    $mf{"JimprSg2ndMasc"} =  [$impr."u", $impr."umu"];
    $mf{"JimprSg2ndFemn"} =  [$impr."u", $impr."umu"];
    $mf{"JimprSg2ndNeut"} =  [$impr."u", $impr."umu"];

    $mf{"JimprPl1stMasc"} =  [$impr."udaamu"];
    $mf{"JimprPl1stFemn"} =  [$impr."udaamu"];
    $mf{"JimprPl1stNeut"} =  [$impr."udaamu"];

    $mf{"JimprPl2ndMasc"} =  [$impr."an\'d\'i"];
    $mf{"JimprPl2ndFemn"} =  [$impr."an\'d\'i"];
    $mf{"JimprPl2ndNeut"} =  [$impr."an\'d\'i"];

    $prhb = $word;
    $prhb =~ s/(.*)(ch)\2?ut\'a/$1$2a/;
    $mf{"KprhbSg2ndMasc"} =  [$prhb."vaaku"];
    $mf{"KprhbSg2ndFemn"} =  [$prhb."vaaku"];
    $mf{"KprhbSg2ndNeut"} =  [$prhb."vaaku"];

    $mf{"KprhbPl2ndMasc"} =  [$prhb."kan\'d\'i"];
    $mf{"KprhbPl2ndFemn"} =  [$prhb."kan\'d\'i"];
    $mf{"KprhbPl2ndNeut"} =  [$prhb."kan\'d\'i"];

    return (\%mf);
}



return 1;
