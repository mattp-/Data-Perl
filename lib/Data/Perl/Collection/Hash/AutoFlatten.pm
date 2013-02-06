package Data::Perl::Collection::Hash::AutoFlatten;

# ABSTRACT: Like Collection::Hash, but flattened.

use parent qw/Data::Perl::Collection::Hash/;

use strictures 1;

sub get {
  my $self = shift;
  @_ > 1 ? $self->SUPER::get(@_)->flatten : $self->SUPER::get(@_)
}

sub set {
  my $self = shift;
  my ($results) = $self->SUPER::set(@_);
  wantarray ? $results->flatten : $results->get(0);
}

sub delete {
  my $self = shift;
  my ($results) = $self->SUPER::delete(@_);
  wantarray ? $results->flatten : $results->get(-1);
}

sub keys { shift->SUPER::keys(@_)->flatten }

sub kv { shift->SUPER::kv(@_)->flatten }

sub elements { shift->SUPER::elements(@_)->flatten }

1;

__END__
==pod

=head1 SYNOPSIS

  use aliased 'Data::Perl::Collection::Hash::AutoFlatten';

  my $hash = Hash->new(qw/a b c d/);

  $hash->keys; # returns qw/a c/

  $hash->keys->count; # doesn't work


=head1 DESCRIPTION

This class wraps Data::Perl::Collection::Hash to ensure all methods that could
otherwise return a Collection::Hash or Collection::Array object will instead
return a real perl hash or array. As a result, chaining methods is impossible.

=head1 WRAPPED METHODS

=over 4

=item * B<get($value, $value, ....)>

When more than one value is passed in, an array is returned instead of
a Data::Perl::Collection::Array object.

=item * B<set($value, $value, ....)>

In list context, instead of returning a Data::Perl::Collection::Array object,
a real array is returned.

=item * B<delete>

In list context, instead of returning a Data::Perl::Collection::Array object of
deleted items, a real array is returned.

=item * B<keys>

In list context, instead of returning a Data::Perl::Collection::Array object of
items, a real array is returned.

=item * B<kv>

In list context, instead of returning a Data::Perl::Collection::Array object of
items, a real array is returned.

=item * B<elements>

In list context, instead of returning a Data::Perl::Collection::Array object of
items, a real array is returned.

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
