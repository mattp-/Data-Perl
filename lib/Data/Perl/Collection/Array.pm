package Data::Perl::Collection::Array;

# ABSTRACT: Wrapping class for Perl's built in array structure.

use strictures 1;

use List::Util;
use List::MoreUtils;
use Scalar::Util qw/blessed/;
use Syntax::Keyword::Junction ();

sub new { my $cl = CORE::shift; bless([ @_ ], $cl) }

sub count { CORE::scalar @{$_[0]} }

sub is_empty { CORE::scalar @{$_[0]} ? 0 : 1 }

sub elements { @{$_[0]} }

sub get { $_[0]->[ $_[1] ] }

sub pop { CORE::pop @{$_[0]} }

sub push { CORE::push @{$_[0]}, @_[1..$#_] }

sub shift { CORE::shift @{$_[0]} }

sub unshift { CORE::unshift @{$_[0]}, @_[1..$#_] }

sub first { &List::Util::first($_[1], @{$_[0]}) }

sub first_index { &List::MoreUtils::first_index($_[1], @{$_[0]}) }

sub reduce { List::Util::reduce { $_[1]->($a, $b) } @{$_[0]} }

sub set { $_[0]->[ $_[1] ] = $_[2] }

sub accessor {
  if (@_ == 2) {
    $_[0]->[$_[1]];
  }
  elsif (@_ > 2) {
    $_[0]->[$_[1]] = $_[2];
  }
}

sub natatime {
  my $iter = List::MoreUtils::natatime($_[1], @{$_[0]});

  if ($_[2]) {
    while (my @vals = $iter->()) {
      $_[2]->(@vals);
    }
  }
  else {
    $iter;
  }
}

sub shallow_clone { blessed($_[0]) ? bless([@{$_[0]}], ref $_[0]) : [@{$_[0]}] }

# Data::Collection methods that return a Data::Perl::Collection::Array object
#sub members {
#  my ($self) = @_;
#  qw/map grep member_count sort reverse print any all one none join/;
#}

sub map {
  my ($self, $cb) = @_;

  ref($self)->new(CORE::map { $_->$cb } $self->elements);
}

sub grep {
  my ($self, $cb) = @_;

  ref($self)->new(CORE::grep { $_->$cb } $self->elements);
}

sub sort {
  my ($self) = @_;

  ref($self)->new($_[1] ? CORE::sort { $_[1]->($a, $b) } $self->elements : CORE::sort $self->elements);
}

sub reverse {
  my ($self) = @_;

  ref($self)->new(CORE::reverse $self->elements);
}

sub sort_in_place {
  my ($self) = @_;

  @{$_[0]} = ($_[1] ? sort { $_[1]->($a, $b) } @{$_[0]} : sort @{$_[0]});

  $self;
}

sub splice {
  ref($_[0])->new(CORE::splice @{$_[0]}, $_[1], $_[2], @_[3..$#_]);
}

sub shuffle {
  my ($self) = @_;

  ref($self)->new(List::Util::shuffle($self->elements));
}

sub uniq {
  my ($self) = @_;

  ref($self)->new(List::MoreUtils::uniq($self->elements));
}

sub delete {
  my ($self, $idx) = @_;

  $self->splice($idx, 1);
}

sub insert {
  my ($self, $idx, $el) = @_;

  $self->splice($idx, 0, $el);
}

sub flatten {
    @{$_[0]}
}

sub flatten_deep {
  my ($self, $depth) = @_;
  --$depth if (defined($depth));

  my @elements = CORE::map {
      (ref eq 'ARRAY')
          ? (defined($depth) && $depth == -1) ? $_ : _flatten_deep( @$_, $depth )
          : $_
  } $self->elements;

  ref($self)->new(@elements);
}

sub member_count {
  my ($self) = @_;

  scalar $self->elements;
}

sub join {
  my ($self, $with) = @_;

  CORE::join((defined $with ? $with : ','), $self->elements);
}

sub print {
  my ($self, $fh) = @_;

  print { $fh ||= *STDOUT } $self->join;
}

# junctions
=begin
sub all {
  my ($self) = @_;
  Syntax::Keyword::Junction::all($self->elements);
}

sub any {
  my ($self) = @_;
  Syntax::Keyword::Junction::any($self->elements);
}

sub none {
  my ($self) = @_;
  Syntax::Keyword::Junction::none($self->elements);
}

sub one {
  my ($self) = @_;
  Syntax::Keyword::Junction::one($self->elements);
}
=cut

1;

__END__
==pod

=head1 SYNOPSIS

  use Data::Perl qw/array/;

  my $array = array(1, 2, 3);

  $array->push(5);

  $array->grep(sub { $_ > 2 }); # (3, 5);


=head1 DESCRIPTION

  This class provides a wrapper and methods for interacting with a hash.

=head1 PROVIDED METHODS

=over 4

=item B<new($value, $value, ....)>

Constructs a new Data::Perl::Collection::Array object initialized with passed
in values, and returns it.

=item * B<count>

Returns the number of elements in the array.

  $stuff = Stuff->new;
  $stuff->options( [ "foo", "bar", "baz", "boo" ] );

  print $stuff->count; # prints 4

This method does not accept any arguments.

=item * B<is_empty>

Returns a boolean value that is true when the array has no elements.

  $stuff->is_empty ? die "No options!\n" : print "Good boy.\n";

This method does not accept any arguments.

=item * B<elements>

Returns all of the elements of the array as an array (not an array reference).

  my @options = $stuff->elements;
  print "@options\n";    # prints "foo bar baz boo"

This method does not accept any arguments.

=item * B<get($index)>

Returns an element of the array by its index. You can also use negative index
numbers, just as with Perl's core array handling.

  my $option = $stuff->get(1);
  print "$option\n";    # prints "bar"

If the specified element does not exist, this will return C<undef>.

This method accepts just one argument.

=item * B<pop>

Just like Perl's builtin C<pop>.

This method does not accept any arguments.

=item * B<push($value1, $value2, value3 ...)>

Just like Perl's builtin C<push>. Returns the number of elements in the new
array.

This method accepts any number of arguments.

=item * B<shift>

Just like Perl's builtin C<shift>.

This method does not accept any arguments.

=item * B<unshift($value1, $value2, value3 ...)>

Just like Perl's builtin C<unshift>. Returns the number of elements in the new
array.

This method accepts any number of arguments.

=item * B<splice($offset, $length, @values)>

Just like Perl's builtin C<splice>. In scalar context, this returns the last
element removed, or C<undef> if no elements were removed. In list context,
this returns all the elements removed from the array.

This method requires at least one argument.

=item * B<first( sub { ... } )>

This method returns the first matching item in the array, just like
L<List::Util>'s C<first> function. The matching is done with a subroutine
reference you pass to this method. The subroutine will be called against each
element in the array until one matches or all elements have been checked.

  my $found = $stuff->find_option( sub {/^b/} );
  print "$found\n";    # prints "bar"

This method requires a single argument.

=item * B<first_index( sub { ... } )>

This method returns the index of the first matching item in the array, just
like L<List::MoreUtils>'s C<first_index> function. The matching is done with a
subroutine reference you pass to this method. The subroutine will be called
against each element in the array until one matches or all elements have been
checked.

This method requires a single argument.

=item * B<grep( sub { ... } )>

This method returns every element matching a given criteria, just like Perl's
core C<grep> function. This method requires a subroutine which implements the
matching logic.

  my @found = $stuff->grep( sub {/^b/} );
  print "@found\n";    # prints "bar baz boo"

This method requires a single argument.

=item * B<map( sub { ... } )>

This method transforms every element in the array and returns a new array,
just like Perl's core C<map> function. This method requires a subroutine which
implements the transformation.

  my @mod_options = $stuff->map( sub { $_ . "-tag" } );
  print "@mod_options\n";    # prints "foo-tag bar-tag baz-tag boo-tag"

This method requires a single argument.

=item * B<reduce( sub { ... } )>

This method turns an array into a single value, by passing a function the
value so far and the next value in the array, just like L<List::Util>'s
C<reduce> function. The reducing is done with a subroutine reference you pass
to this method.

  my $found = $stuff->reduce( sub { $_[0] . $_[1] } );
  print "$found\n";    # prints "foobarbazboo"

This method requires a single argument.

=item * B<sort>

=item * B<sort( sub { ... } )>

Returns the elements of the array in sorted order.

You can provide an optional subroutine reference to sort with (as you can with
Perl's core C<sort> function). However, instead of using C<$a> and C<$b> in
this subroutine, you will need to use C<$_[0]> and C<$_[1]>.

  # ascending ASCIIbetical
  my @sorted = $stuff->sort();

  # Descending alphabetical order
  my @sorted_options = $stuff->sort( sub { lc $_[1] cmp lc $_[0] } );
  print "@sorted_options\n";    # prints "foo boo baz bar"

This method accepts a single argument.

=item * B<sort_in_place>

=item * B<sort_in_place( sub { ... } )>

Sorts the array I<in place>, modifying the value of the attribute.

You can provide an optional subroutine reference to sort with (as you can with
Perl's core C<sort> function). However, instead of using C<$a> and C<$b>, you
will need to use C<$_[0]> and C<$_[1]> instead.

This method does not define a return value.

This method accepts a single argument.

=item * B<shuffle>

Returns the elements of the array in random order, like C<shuffle> from
L<List::Util>.

This method does not accept any arguments.

=item * B<uniq>

Returns the array with all duplicate elements removed, like C<uniq> from
L<List::MoreUtils>.

This method does not accept any arguments.

=item * B<join($str)>

Joins every element of the array using the separator given as argument, just
like Perl's core C<join> function.

  my $joined = $stuff->join(':');
  print "$joined\n";    # prints "foo:bar:baz:boo"

This method requires a single argument.

=item * B<set($index, $value)>

Given an index and a value, sets the specified array element's value.

This method returns the value at C<$index> after the set.

This method requires two arguments.

=item * B<delete($index)>

Removes the element at the given index from the array.

This method returns the deleted value. Note that if no value exists, it will
return C<undef>.

This method requires one argument.

=item * B<insert($index, $value)>

Inserts a new element into the array at the given index.

This method returns the new value at C<$index>.

This method requires two arguments.

=item * B<clear>

Empties the entire array, like C<@array = ()>.

This method does not define a return value.

This method does not accept any arguments.

=item * B<accessor($index)>

=item * B<accessor($index, $value)>

This method provides a get/set accessor for the array, based on array indexes.
If passed one argument, it returns the value at the specified index.  If
passed two arguments, it sets the value of the specified index.

When called as a setter, this method returns the new value at C<$index>.

This method accepts one or two arguments.

=item * B<natatime($n)>

=item * B<natatime($n, $code)>

This method returns an iterator which, on each call, returns C<$n> more items
from the array, in order, like C<natatime> from L<List::MoreUtils>. A coderef
can optionally be provided; it will be called on each group of C<$n> elements
in the array.

This method accepts one or two arguments.

=item * B<shallow_clone>

This method returns a shallow clone of the array reference.  The return value
is a reference to a new array with the same elements.  It is I<shallow>
because any elements that were references in the original will be the I<same>
references in the clone.

=back

=head1 SEE ALSO

=over 4

=item * L<Data::Perl>

=item * L<MooX::HandlesVia>

=back

=cut
