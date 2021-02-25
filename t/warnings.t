use FindBin '$Bin';
use lib "$Bin";
use GZT;

my $warnings;
$SIG{__WARN__} = sub { $warnings = "@_" };

my $in = 'something' x 10;

ZopfliCompress ($in, monkey => 99);
ok ($warnings, "Got warnings with non-option");
like ($warnings, qr!Unknown option!, "Got right warning");
$warnings = undef;

ZopfliCompress ($in, type => 'bonkers');
ok ($warnings, "Got warnings with non-type");
like ($warnings, qr!Unknown compression type!, "Got right warning");
$warnings = undef;

done_testing ();
