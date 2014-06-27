package Data::Perl::Role::Code;

# ABSTRACT: Wrapping class for Perl coderefs.

use strictures 1;

use Role::Tiny;

sub new { my $cl = shift; bless $_[0], $cl }

sub execute { $_[0]->(@_[1..$#_]) }

#sub execute_method { $_[0]->($_[0], @_[1..$#_]) }
sub execute_method { die 'This remains unimplemented for now.' }

1;
__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/code/;

  my $code = code(sub { 'Foo'} );

  $code->execute(); # returns 'Foo';

=head1 DESCRIPTION

This class provides a wrapper and methods for interacting with Perl coderefs.

=head1 PROVIDED METHODS

=over 4

=item B<new($coderef)>

Constructs a new Data::Perl::Code object, initialized to $coderef as passed in,
and returns it.

=item B<execute(@args)>

Calls the coderef with the given args.

=item B<execute_method(@args)>

Calls the coderef with the the instance as invocant and given args. B<This is
currently disabled and triggers a die due to implementation details yet to be
resolved.>

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
