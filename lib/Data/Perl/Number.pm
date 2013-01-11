package Data::Perl::Number;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(counter);
}

use strictures 1;

sub new { my $cl = shift; bless(\$_[0]), $cl }

sub number { Data::Perl::Number->new(shift||0) }

sub add { $$_[0] = $$_[0] + $_[1] }

sub sub { $$_[0] = $$_[0] - $_[1] }

sub mul { $$_[0] = $$_[0] * $_[1] }

sub div { $$_[0] = $$_[0] / $_[1] }

sub mod { $$_[0] = $$_[0] % $_[1] }

sub abs { $$_[0] = abs($$_[0]) }

1;
