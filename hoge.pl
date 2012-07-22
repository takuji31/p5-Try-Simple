#!/usr/bin/env perl
use 5.016_000;
use warnings;

use Project::Libs;

use Try::Simple;

try {

}->catch (SampleException => my $e => sub {

});


package SampleException;
use strict;
use warnings;
use 5.010_001;
#use parent qw/Try::Simple::Exception/;

1;
