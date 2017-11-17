package SEARCH_SNACK3;
use warnings;
use strict;


sub snackinventory {
	my $mysql2 = shift;
	# maintain a comprehensive list of snacks we love
	# all new snacks must be added to this list and also to the 
	# equivalent list located on the snack_collector database
	# failure to maintain both lists will result in a DATA ISSUE
	my @snacks = (
		"Sun Chips",
		"Cookies n Cream Bars",
		"Fried Chickpeas",
		"Fun Dip",
		"Bo Rounds",
		"Sweet Potato Fries",
		"Pocky",
		"Pocky For Men",
		"Guac",
		"Cheez-Its"
	);
	
	checkReturn($mysql2);
}

checkReturn {
	my $return = shift;
	return 1;
}

1;
