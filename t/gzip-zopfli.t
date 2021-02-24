# This is a test for module Gzip::Zopfli.

use warnings;
use strict;
use utf8;
use Test::More;
use_ok ('Gzip::Zopfli');
my $builder = Test::More->builder;
binmode $builder->output,         ":utf8";
binmode $builder->failure_output, ":utf8";
binmode $builder->todo_output,    ":utf8";
binmode STDOUT, ":encoding(utf8)";
binmode STDERR, ":encoding(utf8)";
use Gzip::Zopfli 'ZopfliCompress';
my $in = 'something' x 1000;
my $out = ZopfliCompress ($in);
cmp_ok (length ($out), '<', length ($in), "compressed something");
done_testing ();
# Local variables:
# mode: perl
# End:
