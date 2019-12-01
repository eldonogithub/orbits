#!/usr/bin/perl

use strict;
use warnings;

my $prev = 1;
my $next = 0;

my $i;

while ( 1 ) {
  $i++;

  print "$i $prev\n";
  $next = 1 + 1.0 / ( $prev ) ;
  if ( $next == $prev ) {
    last;
  }
  $prev = $next;
}
