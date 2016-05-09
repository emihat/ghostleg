#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw/shuffle/;

my $maxnum = 53;
die "Usage: $0 number\n" if @ARGV < 1;

my $num = shift @ARGV;
die "number must be smaller than $maxnum\n" if $num >= $maxnum;

my @res = shuffle 1..$num;
my @lab = ('A'..'Z', 'a'..'z')[0..$num-1];

print "\n";
map { print "  $_" } @lab;
print "\n";

my %bar = ();
for(my $i=0; $i<10; $i++){
  for(my $j=0; $j<$num; $j++){
    my $seed = int(rand(9));
    if($i>0 && $j>0 && $seed%3==0 && $bar{$i-1}{$j}==0 && $bar{$i}{$j-1}==0){
      print "--|";
      $bar{$i}{$j} = 1;
    }
    else{
      print "  |";
      $bar{$i}{$j} = 0;
    }
  }
  print "\n";
}

map { printf(" %2s", $_) } @res; 
print "\n\n";

