package GZT;
use warnings;
use strict;
use utf8;
use Test::More;
use Gzip::Zopfli 'ZopfliCompress';
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = (qw/ZopfliCompress/, @Test::More::EXPORT);
# Set all the file handles to UTF-8

my $builder = Test::More->builder;
binmode $builder->output,         ":encoding(utf8)";
binmode $builder->failure_output, ":encoding(utf8)";
binmode $builder->todo_output,    ":encoding(utf8)";
binmode STDOUT, ":encoding(utf8)";
binmode STDERR, ":encoding(utf8)";

sub import
{
    my ($class) = @_;

    strict->import ();
    utf8->import ();
    warnings->import ();
    Test::More->import ();
    Zopfli::Compress->import (':all');
    GZT->export_to_level (1);
}

1;
