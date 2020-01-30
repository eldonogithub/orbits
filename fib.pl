#!/usr/bin/perl

use strict;
use warnings;

my @f = (1, 1);
my $i = 0;
my $ratio = $f[1] / $f[0];
my $prev=0.0;

if ( @ARGV == 0 ) {
  print "Usage: fib VALUE\n";
  exit;
}
my $days=$ARGV[0];

printf "Days: %d\n",$days;

my $hours=$days*8;
my $goal = $hours/4; # minimum fibonacci goal

printf "Goal ratio: %.10f\n", $goal;

while ( 1 ) {
  $i++;
  
  # compute current golden ratio of next/prev fibonacci numbers
  my $ratio = $f[1] / $f[0];
  my $granularity = 1/$f[1] * $days*8;

  printf "%4d %4d %4d %.20f %.20f\n",$i, $f[0],$f[1],$ratio,$granularity;

  if ( $f[1] > $goal ) {
    printf "Fibonacci Number to use: %d\n", $f[1];
    last;
  }

  # Is the new estimate different from the previous?
  if ( $prev == $ratio ) {
    last;
  }

  $prev=$ratio;

  # compute next fibonacci number
  my $fib = $f[0] + $f[1];

  # save state
  $f[0] = $f[1];
  $f[1] = $fib;
}
