package Gzip::Zopfli;
use warnings;
use strict;
use Carp;
use utf8;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw/ZopfliCompress/;
our %EXPORT_TAGS = (
    all => \@EXPORT_OK,
);
our $VERSION = '0.00_02';
require XSLoader;
XSLoader::load ('Gzip::Zopfli', $VERSION);
1;
