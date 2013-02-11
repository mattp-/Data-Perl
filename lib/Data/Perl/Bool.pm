package Data::Perl::Bool;

# ABSTRACT: Wrapping class for boolean values.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::Bool';

1;
__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/bool/;

  my $bool = bool(0);

  $bool->toggle; # 1

  $bool->unset; # 0

=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::Bool> role, which
provides all functionality. You probably want to look there instead.


=cut
