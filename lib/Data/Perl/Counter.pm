package Data::Perl::Counter;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(counter);
}

use strictures 1;

sub new { my $cl = shift; bless \$_[0], $cl }

sub counter { Data::Perl::Counter->new(shift||0) }

sub inc { ${$_[0]} += ($_[1] ? $_[1] : 1) }

sub dec { ${$_[0]} -= ($_[1] ? $_[1] : 1) }

sub reset { ${$_[0]} = 0 }

1;
