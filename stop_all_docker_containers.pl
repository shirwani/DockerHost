#!/usr/bin/perl
use warnings;
use strict;

foreach my $l(split(/\n/, `docker ps -a`)){
    chomp($l);
    my $container_id = (split(/\s+/, $l))[0];
    next if($container_id eq 'CONTAINER');
    print "Stopping docker container ID: " . $container_id . "\n";
    `docker stop $container_id`;
}
