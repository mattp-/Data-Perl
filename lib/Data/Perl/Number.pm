package Data::Perl::Number;

# ABSTRACT: Wrapping class for Perl scalar numbers.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::Number';

1;
__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/number/;

  my $num = number(123);

  $num->add(5); # $num == 128

  $num->div(2); # $num == 64

=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::Number> role, which
provides all functionality. You probably want to look there instead.

=cut
