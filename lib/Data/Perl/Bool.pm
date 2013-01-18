package Data::Perl::Bool;

use strictures 1;

sub new { my $bool = $_[1] ? 1 : 0; bless(\$bool, $_[0]) }

sub set { ${$_[0]} = 1 }

sub unset { ${$_[0]} = 0 }

sub toggle { ${$_[0]} = ${$_[0]} ? 0 : 1; }

sub not { !${$_[0]} }

1;
