open (fi, $ARGV[0]);
open (fo, ">$ARGV[0].sfx");
open (f2d, ">$ARGV[0].2d");
while ($word = <fi>){
    chomp($word);
    @letters = split(//, $word);
    $f=0;
    $ls = $word;
    $ls =~ s/.*[aeiou]+([^aeiou]+[aeiou\-\']+)/$1/;
    $ls =~ s/n\'//;
    print (fo "$word\t$ls\n");
    
    if ($word =~ /.*[ae]{1}mu$/){
	print (f2d "$word\n");
    }
}
close(fi);
close(fo);
close(f2d);
