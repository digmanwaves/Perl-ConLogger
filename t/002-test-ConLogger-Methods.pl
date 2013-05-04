# -*- cperl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

my $cntr = 1;
BEGIN { $| = 1; print "1..3\n"; }
END { print "not ok $cntr\n" unless $cntr == 0 }
use ConLogger;
print "ok $cntr\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my $stdout;
my $expout;

# check conlogitem
$cntr = 2;
$expout = "- I am curious to see how this works...\n" .
          "  I hope it goes like stink.\n";
$stdout = "";
open CAPTURESTANDARDOUT, '>', \$stdout or die( "Can't open STDOUT: $!" );
select CAPTURESTANDARDOUT;
ConLogger::logitem( "I am curious to see how this works...\n" .
	      "I hope it goes like stink." );
close CAPTURESTANDARDOUT;
select STDOUT;
unless( $expout eq $stdout ) {
  warn( "Error: Expected: $expout; Got: $stdout\n" );
  print 'not ';
}
print "ok $cntr\n";

# check conlogcont
$cntr = 3;
$expout = "  This should be a continuation\n  that works\n- Take that!\n";
$stdout = "";
open CAPTURESTANDARDOUT, '>', \$stdout or die( "Can't open STDOUT: $!" );
select CAPTURESTANDARDOUT;
ConLogger::logcont( "This should be a continuation\nthat works\n" );
ConLogger::logitem( "Take that!" );
close CAPTURESTANDARDOUT;
select STDOUT;
unless ( $expout eq $stdout ) {
  warn( "Error: Expected: $expout; Got: $stdout\n" );
  print 'not ';
}
print "ok $cntr\n";

# # check progressbar
# $cntr = 4;
# $expout = "[                                                                    ]   0%\r[=============                                                       ]  20%\r[===========================                                         ]  40%\r[========================================                            ]  60%\r[======================================================              ]  80%\r[====================================================================] 100%\r";

# $stdout = "";
# open CAPTURESTANDARDOUT, '>', \$stdout or die( "Can't open STDOUT: $!" );
# select CAPTURESTANDARDOUT;
# for ( my $i = 0; $i <= 5; ++$i ) {
#   $cl->progress( $i, 5 );
# }
# close CAPTURESTANDARDOUT;
# select STDOUT;
# unless ( $expout eq $stdout ) {
#   warn( "Error: Expected: $expout; Got: $stdout\n" );
#   print 'not ';
# }
# print "ok $cntr\n";

$cntr = 0;

