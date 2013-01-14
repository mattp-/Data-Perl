use Test::More;
use Data::Perl::Code;
use strict;
use Scalar::Util qw/reftype/;

# constructor
is ref(code(sub{})), 'Data::Perl::Code', 'constructor shortcut works';

my $b = code(sub { 2});
is reftype($b), 'CODE', 'inner struct is coderef of ctr';

is $b->(), 2, 'coderef returns correct value';

is $b->execute, 2, 'execute returns correct value';

# tbd: execute_method

done_testing();
