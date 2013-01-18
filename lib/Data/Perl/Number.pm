package Data::Perl::Number;

use strictures 1;

sub new { bless(\$_[1], $_[0]) }

sub add { ${$_[0]} = ${$_[0]} + $_[1] }

sub sub { ${$_[0]} = ${$_[0]} - $_[1] }

sub mul { ${$_[0]} = ${$_[0]} * $_[1] }

sub div { ${$_[0]} = ${$_[0]} / $_[1] }

sub mod { ${$_[0]} = ${$_[0]} % $_[1] }

sub abs { ${$_[0]} = abs(${$_[0]}) }

1;
