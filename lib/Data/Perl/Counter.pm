package Data::Perl::Counter;

# ABSTRACT: Wrapping class for a simple numeric counter.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::Counter';

1;
__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/counter/;

  my $c = counter(4);

  $c->inc;   # $c == 5

  $c->reset; # $c == 0

=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::Counter> role, which
provides all functionality. You probably want to look there instead.

=cut
