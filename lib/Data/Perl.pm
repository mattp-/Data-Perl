package Data::Perl;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(hash array counter string code bool number);
}

use strictures 1;

use Data::Perl::Collection::Array;
use Data::Perl::Collection::Hash;
use Data::Perl::Code;
use Data::Perl::Number;
use Data::Perl::Bool;
use Data::Perl::String;
use Data::Perl::Counter;

sub array { Data::Perl::Collection::Array->new(@_) }

sub hash { Data::Perl::Collection::Hash->new(@_) }

sub code { Data::Perl::Code->new(shift||sub {}) }

sub number { Data::Perl::Number->new(shift||0) }

sub bool { Data::Perl::Bool->new(shift||0) }

sub string { Data::Perl::String->new(shift||'') }

sub counter { Data::Perl::Counter->new(shift||0) }

1;
