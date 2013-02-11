package Data::Perl::Code;

# ABSTRACT: Wrapping class for Perl coderefs.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::Code';

1;

__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/code/;

  my $code = code(sub { 'Foo'} );

  $code->execute(); # returns 'Foo';

=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::Code> role, which
provides all functionality. You probably want to look there instead.

=cut
