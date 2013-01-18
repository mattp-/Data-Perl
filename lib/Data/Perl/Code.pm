package Data::Perl::Code;

use strictures 1;

sub new { my $cl = shift; bless $_[0], $cl }

sub execute { $_[0]->(@_[1..$#_]) }

#sub execute_method { $_[0]->($_[0], @_[1..$#_]) }
sub execute_method { ... }

1;
