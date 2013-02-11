package Data::Perl::String;

# ABSTRACT: Wrapping class for Perl scalar strings.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::String';

1;

__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/string/;

  my $string = string("foo\n");

  $string->chomp; # returns 1, $string == "foo"

=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::String> role, which
provides all functionality. You probably want to look there instead.

=cut
