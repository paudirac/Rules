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


runtests unless caller;
1;
