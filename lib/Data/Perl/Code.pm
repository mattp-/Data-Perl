package Data::Perl::Code;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(code);
}

use strictures 1;

sub new { my $cl = shift; bless $_[0], $cl }

sub code { Data::Perl::Code->new(shift||sub {}) }

sub execute { $_[0]->(@_[1..$#_]) }

#sub execute_method { $_[0]->($_[0], @_[1..$#_]) }
sub execute_method { ... }

1;
