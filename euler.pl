#!/usr/bin/perl

use strict;
use warnings FATAL=>'all';

my $n = 1;
my $divisor = 1.0;
my $euler = 1.0;
my $x = $ARGV[0] || 1;

# uses e(x) = 1 + x/1! + x^2/2! + x^3/3! ...
my $prev = 0;

while(1) {
  printf "%4d %.48f\n", $n, $euler;

  if ( abs($euler - $prev) < 0.0000000000000000000000000000000000000000000000000010) {
    exit;
  }

  # save current value
  $prev = $euler;

  # compute next approximation
  $euler += $x**$n/( $divisor );

  # next nth 
  $n++;

  # comopute next factorial
  $divisor *= $n;
}
