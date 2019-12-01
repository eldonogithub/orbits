#!/usr/bin/perl

use strict;
use warnings;

my @f = (1, 1);
my $i = 0;
my $ratio = $f[1] / $f[0];
my $prev=0.0;

while ( 1 ) {
  $i++;
  
  my $ratio = $f[1] / $f[0];
  print $i . " $f[0] $f[1] $ratio\n";
  if ( $prev == $ratio ) {
    last;
  }
  $prev=$ratio;
  my $fib = $f[0] + $f[1];
  $f[0] = $f[1];
  $f[1] = $fib;
}
