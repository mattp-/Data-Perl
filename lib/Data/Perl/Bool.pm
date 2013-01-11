package Data::Perl::Bool;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(bool);
}

use strictures 1;

sub new { my $cl = shift; bless(\(!!$_[0])), $cl }

sub bool { Data::Perl::Bool->new(shift||0) }

sub set { $$_[0] = !!$_[1] }

sub unset { $$_[0] = 0 }

sub toggle { $$_[0] = $$_[0] ? 0 : 1; }

sub not { $$_[0] = !$$_[0] }

1;
