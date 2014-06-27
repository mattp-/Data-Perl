package Data::Perl::Role::Counter;

# ABSTRACT: Wrapping class for a simple numeric counter.

use strictures 1;

use Role::Tiny;

sub new { bless \(my $n = $_[1]), $_[0] }

sub inc { ${$_[0]} += ($_[1] ? $_[1] : 1) }

sub dec { ${$_[0]} -= ($_[1] ? $_[1] : 1) }

sub reset { ${$_[0]} = 0 }

1;
__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/counter/;

  my $c = counter(4);

  $c->inc;   # $c == 5

  $c->reset; # $c == 0

=head1 DESCRIPTION

This class provides a wrapper and methods for a simple numeric counter.

=head1 PROVIDED METHODS

=over 4

=item B<new($value)>

Constructs a new Data::Perl::Collection::Counter object initialized with the passed
in value, and returns it.

=item B<set($value)>

Sets the counter to the specified value and returns the new value.

This method requires a single argument.

=item B<inc>

=item B<inc($arg)>

Increases the attribute value by the amount of the argument, or by 1 if no
argument is given. This method returns the new value.

This method accepts a single argument.

=item B<dec>

=item B<dec($arg)>

Decreases the attribute value by the amount of the argument, or by 1 if no
argument is given. This method returns the new value.

This method accepts a single argument.

=item B<reset>

Resets the value stored in this slot to its default value, and returns the new
value.

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
