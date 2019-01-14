#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use local::lib qw(perl5);

use Time::HiRes qw(time);
use DateTime;
use Math::Trig;
use POSIX;
use Data::Dumper;

use constant MILLISECONDS => 1000;

my $fh;

my $datafile = "orbits.dat";

open( $fh, '<', $datafile ) || die "Unable to open $datafile: $!";

my $header = <$fh>;

my @header = split( /\s+/, $header );

print "Header: ",join( ", ", @header ), "\n";

my $data = {};

print "Processing data\n";

while ( my $line = <$fh> ) {
  my %row;

  @row{@header} = split( /\s+/, $line );

  print join( ", ", @row{@header} ), "\n";

  $data->{ $row{"Planet"} } = \%row;
}
close($fh);

print "Mars: ", join( ", ", @{ $data->{"Mars"} }{@header} ), "\n";

# month is zero-indexed, so 0 is January
# var tMillisFromJ2000 = Date.now() - Date.UTC(2000, 0, 1, 12, 0, 0);
# var tCenturiesFromJ2000 = tMillisFromJ2000 / (1000*60*60*24*365.25*100);

# https://en.wikipedia.org/wiki/Epoch_(astronomy)#Julian_years_and_J2000
# J2000.0 - the equinox and mean equator of 2000 Jan 1st 12:00 UT
my $dt = DateTime->new( year => 2000, month => 1, day => 1 );
my $now = DateTime->now();

my @l1 = ( 0, 0, 0, 1, 0, 100 );    # time_t This should be Jan 1, 2000
my $t1 = POSIX::mktime(@l1);
print "\n";
print "localtime: ", join( ", ", @l1 ), "\n";
print "mktime: ", POSIX::ctime($t1);
my $t2 = time;
my @l2 = localtime($t2);            # time_t
print "localtime: ", join( ", ", @l2 ), "\n";
print "time: ", POSIX::ctime($t2);

my $duration = $now->subtract_datetime($dt);
my $milli    = time * MILLISECONDS;
print $milli, "\n";

print $duration->in_units('seconds'), "\n";
