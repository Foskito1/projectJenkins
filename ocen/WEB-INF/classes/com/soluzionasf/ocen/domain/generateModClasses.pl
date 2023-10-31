# Script that generates the corresponding module class from the
# BDI classes. It replace the BDI information with the
# corresponding module information.
#author: David Leal
# date: 24/12/2002

# Generating the family: CenModService.java
&replace("CenBdiStandardService.java", "CenCmbStandardService.java", "CMB", "Cmb");
&replace("CenBdiStandardService.java", "CenManStandardService.java", "MAN", "Man");
&replace("CenBdiStandardService.java", "CenOpeStandardService.java", "OPE", "Ope");

# Replace the $TOKEN, $Token by values of the input arguments
sub replace {
	# Using meaningfull variable names
	my($inFileName, $outFileName, $VALUE, $Value) =@_;
	# Tokens to find
	$TOKEN = "BDI";
	$Token = "Bdi";
	# Opening the input and output file
	open(INPUT, "<$inFileName");
	open(OUTPUT, ">$outFileName");
	# It searches on the INPUT file the regular expresions (/s), the 
	# g denotes replace all occurencies of the token to find on the line.
	while(<INPUT>) {
		s/$TOKEN/$VALUE/g;
		s/$Token/$Value/g;
		print OUTPUT;
	}
	close(OUTPUT);
	close(INPUT);
}