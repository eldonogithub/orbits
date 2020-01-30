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

    printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s,
      $perimeter;

    # remember this estimate
    my $prev=$perimeter;

    while (1) {

        # compute the next size of the new polygon
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides,
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

    printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s,
      $perimeter;

    my $prev=$perimeter;
    while (1) {
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides,
          $s, $perimeter;

        if ( abs($perimeter - $prev) < $tolerance ) {
          return;
        }
        $prev=$perimeter;
    }
}

sub triangle {

    print "Starting with Triangle inside a circle with radius 0.5:\n";
    printf "Tolerance: %.20f\n", $tolerance;
    # still want the radius to be 0.5 do diameter has to be 1.0
    my $d = 1.0;
    my $r = $d / 2.0;
    printf "Radius: %.20f\n", $r;

    # A triangle in a circle is an equilateral triangle with angles 60/60/60 
    # the triangle ABC has 3 sides, AB, BC, CA
    # BC is perpendicular to A
    # so half of BC is the length of the right angle

    # The radius is 0.5 from above, so the relationship of the radius of the circle 
    # to the distance to the bisecting point is 1/2 and this makes a 30/60/90 triangle.
    # For a 30/60/90 triangle, the segment from the center of the circle 
    # to the bisect point is also 1/2 of the radius
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

    printf "Altitude: %.20f\n",  $height;
    printf "In Radius: %.20f\n", $inradius;
    printf "Out Radius %.20f\n", $outradius;

    printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s,
      $perimeter;

    my $prev=$perimeter;
    while (1) {
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;

        printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides,
          $s, $perimeter;

        if ( abs($perimeter - $prev) < $tolerance ) {
          return;
        }
        $prev=$perimeter;
    }
}

sub triangle2 {

    print "Starting with Triangle with sides 1.0:\n";
    printf "Tolerance: %.20f\n", $tolerance;

    # A triangle in a circle is an equilateral triangle with angles 60/60/60 
    # the triangle ABC has 3 sides, AB, BC, CA
    # BC is perpendicular to A
    # so half of BC is the length of the right angle

    # a full side of the equilateral triangle
    my $s = 1.0;

    # compute half the side
    my $s2 = $s / 2;

    # The radius is 0.5 from above, so the relationship of the radius of the circle 
    # to the distance to the bisecting point is 1/2 and this makes a 30/60/90 triangle.
    # For a 30/60/90 triangle, the segment from the center of the circle 
    # to the bisect point is also 1/2 of the radius

    my $r2 = $s2 / sqrt(3); # for a 30/60/90 triangle
    my $r = $r2 * 2;

    # so now we know the diameter;
    my $d = $r * 2;

    printf "Radius: %.20f\n", $r;
    printf "Diameter: %.20f\n", $d;

    my $height = sqrt( $s**2 - $s2**2 );

    my $area   = $s2 * $height;

    # There are 3 sides
    my $sides = 3;

    my $perimeter     = $sides * $s;
    my $semiperimeter = $perimeter / 2;
    my $inradius      = $area / $semiperimeter;
    my $outradius     = $height - $inradius;

    printf "Altitude: %.20f\n",  $height;
    printf "In Radius: %.20f\n", $inradius;
    printf "Out Radius %.20f\n", $outradius;

    printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides, $s,
      $perimeter;

    my $prev=$perimeter;
    while (1) {
        $s = subdivide( $s, $r );

        # double the number of sides
        $sides *= 2.0;

        # new perimeter
        my $perimeter = $s * $sides;
        my $pi = $perimeter / $d;

        printf "Polygon sides: %20d side: %.20f perimeter: %.20f\n", $sides,
          $s, $pi;

        if ( abs($perimeter - $prev) < $tolerance ) {
          return;
        }
        $prev=$perimeter;
    }
}

#square();
hexagon();
# triangle2();
