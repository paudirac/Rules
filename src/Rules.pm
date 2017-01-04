package Rules;
use strict;
use warnings;

use Moose;
use Rule;

has 'rules' => (
    is => 'ro',
    isa => 'ArrayRef',
    default => sub { [] });

sub add_rule {
    my ($self, $name, $fn, $err) = @_;
    my $rule = Rule->new(name => $name, fn => $fn, err => $err);
    push @{$self->rules}, $rule;
};

no Moose;
__PACKAGE__->meta->make_immutable;
1;
