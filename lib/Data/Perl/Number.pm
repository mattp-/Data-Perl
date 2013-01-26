package Data::Perl::Number;

# ABSTRACT: Wrapping class for Perl scalar numbers.

use strictures 1;

sub new { bless \(my $n = $_[1]), $_[0] }

sub add { ${$_[0]} = ${$_[0]} + $_[1] }

sub sub { ${$_[0]} = ${$_[0]} - $_[1] }

sub mul { ${$_[0]} = ${$_[0]} * $_[1] }

sub div { ${$_[0]} = ${$_[0]} / $_[1] }

sub mod { ${$_[0]} = ${$_[0]} % $_[1] }

sub abs { ${$_[0]} = abs(${$_[0]}) }

1;

__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/number/;

  my $num = number(123);

  $num->add(5); # $num == 128

  $num->div(2); # $num == 64

=head1 DESCRIPTION

  This class provides a wrapper and methods for interacting with scalar strings.

=head1 PROVIDED METHODS

All of these methods modify the attribute's value in place. All methods return
the new value.

=over 4

=item B<new($value)>

Constructs a new Data::Perl::Collection::Number object initialized with the passed
in value, and returns it.

=item * B<add($value)>

Adds the current value of the attribute to C<$value>.

=item * B<sub($value)>

Subtracts C<$value> from the current value of the attribute.

=item * B<mul($value)>

Multiplies the current value of the attribute by C<$value>.

=item * B<div($value)>

Divides the current value of the attribute by C<$value>.

=item * B<mod($value)>

Returns the current value of the attribute modulo C<$value>.

=item * B<abs>

Sets the current value of the attribute to its absolute value.

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
