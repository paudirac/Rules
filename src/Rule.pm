package Rule;
use strict;
use warnings;

sub noop {};

use Moose;

has 'name' => (is => 'ro', isa => 'Str');
has 'fn' => (is => 'ro', isa => 'Ref', default => sub { noop });
has 'err' => (is => 'ro', isa => 'Str', default => 'Error');

no Moose;
__PACKAGE__->meta->make_immutable;
1;
