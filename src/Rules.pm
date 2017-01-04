package Rules;
use strict;
use warnings;

use Moose;

has 'rules' => (
    is => 'ro',
    isa => 'ArrayRef',
    default => sub { [] });

1;
