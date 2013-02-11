  package Data::Perl::Collection::Hash;

# ABSTRACT: Wrapping class for Perl's built in hash structure.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::Collection::Hash';

1;

__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/hash/;

  my $hash = hash(a => 1, b => 2);

  $array->push(5);

  $hash->values; # (1, 2)

  $hash->set('foo', 'bar'); # (a => 1, b => 2, foo => 'bar')


=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::Collection::Hash>
role, which provides all functionality. You probably want to look there
instead.

=cut
