use strict;
use warnings;

use Test::Spec;
use Rules;

describe "A test" => sub {
  it "should pass" => sub {
    ok(1);
  };

};

describe "Rules" => sub {
  it "can be created" => sub {
    my $rules = Rules->new;
    ok(defined $rules);
  };

  describe "as a container" => sub {
    my $rules = Rules->new;
    it "accepts rules" => sub {
      is(scalar @{$rules->rules}, 0);
      $rules->add_rule('hola', sub {}, 'error');
      is(scalar @{$rules->rules}, 1);
    };
  };
};

describe "Rules" => sub {
  my $rules = Rules->new;
  $rules->add_rule('one', sub { 1; }, 'One error');
  $rules->add_rule('two', sub { 2; }, 'Two error');

  it "can be executed" => sub {
    my $rule_one_out = $rules->check_rule('one');
    is($rule_one_out, 1);
    my $rule_two_out = $rules->check_rule('two');
    is($rule_two_out, 2);
  };

  it "should die for non existent rule" => sub {
    eval {
      my $rule_inexistent = $rules->check_rule('x');
    };
    ok($@);
  };
};


runtests unless caller;
1;
