package Data::Perl::Collection::Array;

# ABSTRACT: Wrapping class for Perl's built in array structure.

use strictures 1;

use Role::Tiny::With;

with 'Data::Perl::Role::Collection::Array';

1;

__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/array/;

  my $array = array(1, 2, 3);

  $array->push(5);

  $array->grep(sub { $_ > 2 })->map(sub { $_ ** 2 })->elements; # (3, 5);


=head1 DESCRIPTION

This class is a simple consumer of the L<Data::Perl::Role::Collection::Array>
role, which provides all functionality. You probably want to look there
instead.

=cut
