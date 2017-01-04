use strict;
use warnings;

use Test::Spec;
use Rules;

describe "A test" => sub {
  it "should pass" => sub {
    ok(1);
  };
};

runtests unless caller;
1;
