package Rules;
use strict;
use warnings;

use Moose;
use Rule;
use Data::Dumper;

has 'rules' => (
    is => 'ro',
    isa => 'ArrayRef',
    default => sub { [] });

sub add_rule {
    my ($self, $name, $fn, $err) = @_;
    my $rule = Rule->new(name => $name, fn => $fn, err => $err);
    push @{$self->rules}, $rule;
};

sub check_rule {
    my ($self, $name) = @_;
    my @rule = grep { $_->name() eq $name } @{$self->rules};
    return defined @rule[0] ? $rule[0]->fn->() : die "No rule found";
};

no Moose;
__PACKAGE__->meta->make_immutable;
1;
