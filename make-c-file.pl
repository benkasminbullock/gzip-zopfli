

#!/home/ben/software/install/bin/perl
use Z;
use C::Tokenize;
my $dir = '/home/ben/software/zopfli/src/zopfli';
my @c = <$dir/*.c>;
my @h = <$dir/*.h>;
my %h2file;
for my $hfile (@h) {
    my $h = $hfile;
    $h =~ s!.*/!!;
    $h2file{$h} = read_text ($hfile);
}
my $out = "$Bin/zopfli-one.c";
my $c = '';
for my $file (@c) {
    my $text = read_text ($file);
    $c .= $text;
}
for (0..10) {
    $c =~ s!^#\s*include\s*"(.*?)"!/* $1 */\n$h2file{$1}!gm;
}
#$c =~ s!^#\s*include\s*"(.*?)"!/* $1 */\n$h2file{$1}!gm;
write_text ($out, $c);
do_system ("cc -Wall -c $out");