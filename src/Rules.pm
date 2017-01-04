package Rules;
use strict;
use warnings;

use Moose;

has 'rules' => (
    is => 'ro',
    isa => 'ArrayRef',
    default => sub { [] });

sub add_rule {
    my ($self, $name) = @_;
    push @{$self->rules}, $name;
};

1;
