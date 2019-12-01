#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

sub polygon {
    my ( $s, $r ) = @_;

    # compute half the side we are bisecting
    my $s2 = $s / 2.0;

    # now determne the adjacent length
    my $a = sqrt( $r**2.0 - $s2**2.0 );

    # the adjacent length from the radius is the additional
    # length of the new vertex to the edge of the circle
    my $b = $r - $a;

    # determine length of the new side
    my $l = sqrt( $b**2.0 + $s2**2.0 );

    return $l;
}

sub square {

    # compute square around

    # The circle is radius 1

    # a square inside the circle has a diagonal of 1
    my $d = 1.0;
    my $r = $d / 2.0;

    # the sides of the square inside the circle
    my $s = $d / sqrt(2);

    # There are 4 sides
    my $sides = 4;

    my $perimeter = $sides * $s;

    printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s, $perimeter;

    while (1) {
        $s = polygon( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s, $perimeter;
    }
}

sub hexagon {
  
    # a hexagon inside the circle has a diagonal of 1
    my $d = 1.0;
    my $r = $d / 2.0;

    # the sides of the hexagon inside the circle
    my $s = $r;

    # There are 6 sides
    my $sides = 6;

    my $perimeter = $sides * $s;

    printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s, $perimeter;

    while (1) {
        $s = polygon( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s, $perimeter;
    }
}

hexagon();
