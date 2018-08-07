#!/usr/bin/env perl
use Getopt::Long;

my %opts;

GetOptions(\%opts,
	"please" => \$be_polite);

if (!$be_polite) {
	print("Get the fuck out\n");
	exit();
}

for ($i = 0; $i < 100; $i++) {
	print("Snacks, buddy!\n");
	sleep(2);
}
