#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my $tolerance=0.00000000000000001;

sub subdivide {
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

    print "Starting with Square:\n";
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

    printf "Polygon sides: %20d side: %.32f perimeter: %.32f\n", $sides, $s,
      $perimeter;

    my $prev=$perimeter;
    while (1) {
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.32f perimeter: %.32f\n", $sides,
          $s, $perimeter;

        if ( abs($perimeter - $prev) < $tolerance ) {
          return;
        }
        $prev=$perimeter;
    }
}

sub hexagon {

    print "Starting with Hexagon:\n";
    # a hexagon inside the circle has a diagonal of 1
    my $d = 1.0;
    my $r = $d / 2.0;

    # the sides of the hexagon inside the circle
    my $s = $r;

    # There are 6 sides
    my $sides = 6;

    my $perimeter = $sides * $s;

    printf "Polygon sides: %20d side: %.32f perimeter: %.32f\n", $sides, $s,
      $perimeter;

    my $prev=$perimeter;
    while (1) {
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.32f perimeter: %.32f\n", $sides,
          $s, $perimeter;

        if ( abs($perimeter - $prev) < $tolerance ) {
          return;
        }
        $prev=$perimeter;
    }
}

sub triangle {

    print "Starting with Triangle:\n";
    printf "Tolerance: %.32f\n", $tolerance;
    # still want the radius to be 0.5 do diameter has to be 1.0
    my $d = 1.0;
    my $r = $d / 2.0;
    printf "Radius: %.32f\n", $r;

    # the triangle ABC has 3 sides, AB, BC, CA
    # BC is perpendicular to A
    # so half of BC is the length of the right triangle
    my $r2 = $r/2.0;

    # compute half the side
    my $s2 = sqrt($r ** 2 - $r2**2);

    # a full side of the equilateral triangle
    my $s = $s2 * 2;

    my $height = sqrt( $s**2 - $s2**2 );

    my $area   = $s2 * $height;

    # There are 3 sides
    my $sides = 3;

    my $perimeter     = $sides * $s;
    my $semiperimeter = $perimeter / 2;
    my $inradius      = $area / $semiperimeter;
    my $outradius     = $height - $inradius;

    printf "Altitude: %.32f\n",  $height;
    printf "In Radius: %.32f\n", $inradius;
    printf "Out Radius %.32f\n", $outradius;

    printf "Polygon sides: %20d side: %.32f perimeter: %.32f\n", $sides, $s,
      $perimeter;

    my $prev=$perimeter;
    while (1) {
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.32f perimeter: %.32f\n", $sides,
          $s, $perimeter;

        if ( abs($perimeter - $prev) < $tolerance ) {
          return;
        }
        $prev=$perimeter;
    }
}

square();
hexagon();
triangle();
