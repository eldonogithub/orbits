#!/usr/bin/perl

use strict;
use warnings;

use Math::Trig;

# simple iterative solution
sub simple {

    my $r = 1.0;

    # circle major and minor axis are the same
    my $a = $r;
    my $b = $r;

    my $x     = -$a;
    my $xend  = $a;
    my $delta = 1 / 10.0;

    while ( $x < $xend ) {
        my $y = sqrt( 1 - $x**2 );
        print "X: $x Y: $y\n";
        $x += $delta;
    }
    my $y = sqrt( 1 - $xend**2 );
    print "X: $xend Y: $y\n";
}

# use parametric equation to find points on ellipse by the angle
sub angle {
    my $r = 1.0;
    my $xaxis = 1.0;
    my $h = 0.0;

    my $yaxis = 1.0;
    my $k = 0.0;

    my $angle = 0.0;

    my $radians = 2 * pi;    # 360 degrees

    my $delta = $radians / 10.0;    # do 10 steps around the circle

    while ( $angle < $radians ) {
        # parametric equation for ellipse/circle

        my $x = cos($angle) * $xaxis + $h;
        my $y = sin($angle) * $yaxis + $k;

        print "X: $x Y: $y\n";

        $angle += $delta;
    }
    $angle = $radians;

    my $y = sin($angle) * $r;
    my $x = cos($angle) * $r;

    print "X: $x Y: $y\n";
}

angle();
