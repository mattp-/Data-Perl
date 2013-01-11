package Data::Perl::String;

BEGIN {
  require Exporter;
  our @ISA = qw(Exporter);
  our @EXPORT = qw(string);
}

use strictures 1;

sub new { my $cl = shift; bless(\$_[0], $cl) }

sub string { Data::Perl::String->new(shift||'') }

sub inc { ${$_[0]}++ }

sub append { ${$_[0]} = ${$_[0]} . $_[1] }

sub prepend { ${$_[0]} = $_[1] . ${$_[0]} }

sub replace {
  if (ref($_[2]) eq 'CODE') {
    ${$_[0]} =~ s/$_[1]/$_[2]->()/e;
  }
  else {
    ${$_[0]} =~ s/$_[1]/$_[2]/;
  }
}

sub match {
  ${$_[0]} =~ /$_[1]/;
}

sub chop { CORE::chop ${$_[0]} }

sub chomp { CORE::chomp ${$_[0]} }

sub clear { ${$_[0]} = '' }

sub length { CORE::length ${$_[0]} }

sub substr { ... }

1;
