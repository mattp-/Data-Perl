package Data::Perl::Role::Bool;

# ABSTRACT: Wrapping class for boolean values.

use strictures 1;

use Role::Tiny;

sub new { my $bool = $_[1] ? 1 : 0; bless(\$bool, $_[0]) }

sub set { ${$_[0]} = 1 }

sub unset { ${$_[0]} = 0 }

sub toggle { ${$_[0]} = ${$_[0]} ? 0 : 1; }

sub not { !${$_[0]} }

1;
__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/bool/;

  my $bool = bool(0);

  $bool->toggle; # 1

  $bool->unset; # 0

=head1 DESCRIPTION

This class provides a wrapper and methods for interacting with boolean values.

=head1 PROVIDED METHODS

None of these methods accept arguments.

=over 4

=item B<new($value)>

Constructs a new Data::Perl::Collection::Bool object initialized with the passed
in value, and returns it.

=item B<set>

Sets the value to C<1> and returns C<1>.

=item B<unset>

Set the value to C<0> and returns C<0>.

=item B<toggle>

Toggles the value. If it's true, set to false, and vice versa.

Returns the new value.

=item B<not>

Equivalent of 'not C<$value>'.

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
