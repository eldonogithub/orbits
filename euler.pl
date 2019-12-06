#!/usr/bin/perl

use strict;
use warnings FATAL=>'all';

my $n = 1;
my $divisor = 1.0;
my $euler = 1.0;

while(1) {
  printf "%d %.20f\n", $n, $euler;

  $euler += 1/( $divisor );

  $n++;

  $divisor *= $n;
}
