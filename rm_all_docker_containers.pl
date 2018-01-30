#!/usr/bin/perl
use warnings;
use strict;

`./stop_all_docker_containers.pl`;
foreach my $l(split(/\n/, `docker ps -a`)){
    chomp($l);
    my $container_id = (split(/\s+/, $l))[0];
    next if($container_id eq 'CONTAINER');
    print "Removing docker container ID: " . $container_id . "\n";
    `docker rm $container_id`;
}
