package Data::Perl::Collection::Array::AutoFlatten;

# ABSTRACT: Like Collection::Array, but flattened.

use Scalar::Util qw/blessed/;

use parent qw/Data::Perl::Collection::Array/;

use strictures 1;

# promote $self to __PACKAGE__ if it is a builtin
sub _bless { blessed($_[0]) ? $_[0] : bless($_[0], __PACKAGE__) }

sub map { _bless(shift)->SUPER::map(@_)->flatten }

sub grep { _bless(shift)->SUPER::grep(@_)->flatten }

sub sort { _bless(shift)->SUPER::sort(@_)->flatten }

sub reverse { _bless(shift)->SUPER::reverse(@_)->flatten }

sub sort_in_place { _bless(shift)->SUPER::sort_in_place(@_)->flatten }

sub splice {
  my $self = _bless(shift);
  if (wantarray) {
    my ($result) = $self->SUPER::splice(@_);
    $result->flatten;
  }
  else {
    $self->SUPER::splice(@_);
  }

}

sub shuffle { _bless(shift)->SUPER::shuffle(@_)->flatten }

sub uniq { _bless(shift)->SUPER::uniq(@_)->flatten }

1;

__END__
==pod

=head1 SYNOPSIS

  use aliased 'Data::Perl::Collection::Array::AutoFlatten';

  my $array = Array->new(1, 2, 3);

  $array->push(5);

  $array->grep(sub { $_ > 2 })->map(sub { $_ ** 2 }); # fails


=head1 DESCRIPTION

This class wraps Data::Perl::Collection::Array to ensure all methods that could
otherwise return a Collection::Hash or Collection::Array object will instead
return a real perl hash or array. As a result, chaining methods is impossible.

=head1 WRAPPED METHODS

=over 4

=item * B<map($cb)>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=item * B<grep($cb)>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=item * B<reverse>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=item * B<sort($sort_cb))>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=item * B<sort_in_place($sort_cb)>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=item * B<splice($offset, $length, @values)>

In list context, instead of returning a Data::Perl::Collection::Array object, a
real array is returned.

=item * B<shuffle>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=item * B<uniq>

Instead of returning a Data::Perl::Collection::Array object, a real array is
returned.

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
