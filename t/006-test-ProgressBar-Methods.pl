# -*- cperl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

my $cntr = 1;
BEGIN { $| = 1; print "1..2\n"; }
END { print "not ok $cntr\n" unless $cntr == 0 }
use ConLogger::ProgressBar;
print "ok $cntr\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my $stdout;
my $expout;


# # check progressbar
$cntr = 2;
$expout = "  [                                                                 ]   0%\r  [=============                                                    ]  20%\r  [==========================                                       ]  40%\r  [=======================================                          ]  60%\r  [====================================================             ]  80%\r  [=================================================================] 100%\r\r                                                                          \r";
$stdout = "";
open CAPTURESTANDARDOUT, '>', \$stdout or die( "Can't open STDOUT: $!" );
select CAPTURESTANDARDOUT;
{
  my $pb = ConLogger::ProgressBar->new();

  for ( my $i = 0; $i <= 5; ++$i ) {
    $pb->progress( $i, 5 );
  }
}
close CAPTURESTANDARDOUT;
select STDOUT;
unless ( $expout eq $stdout ) {
  warn( "Error: Expected: $expout; Got: $stdout\n" );
  print 'not ';
}
print "ok $cntr\n";

$cntr = 0;

