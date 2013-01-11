package Data::Perl::String;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(string);
}

use strictures 1;

sub new { my $cl = shift; bless(\$_[0]), $cl }

sub string { Data::Perl::String->new(shift||'') }

sub inc { $$_[0] = $$_[0]++ }

sub append { $$_[0] = $$_[0] . $_[1] }

sub prepend { $$_[0] = $_[1] . $$_[0] }

sub replace {
  ref $_[1]
    ? $$_[0] =~ s/$$_[0]/$_[1]->()/e
    : $$_[0] =~ s/$$_[0]/$_[1]/;
}

sub match {
    $$_[0] =~ /$_[1]/;
}

sub chop { chop $$_[0] }

sub chomp { chop $$_[0] }

sub clear { $$_[0] = '' }

sub length { length $$_[0] }

sub substr { ... }

1;
