#!/usr/bin/perl
use warnings;
use strict;

`./rm_all_docker_containers.pl`;
foreach my $l(split(/\n/, `docker images -a`)){
    chomp($l);
    my $container_id = (split(/\s+/, $l))[2];
    next if($container_id eq 'IMAGE');
    print "Removing docker image ID: " . $container_id . "\n";
    `docker rmi $container_id`;
}
