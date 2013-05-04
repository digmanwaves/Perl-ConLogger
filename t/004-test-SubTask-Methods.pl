# -*- cperl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

my $cntr = 1;
BEGIN { $| = 1; print "1..2\n"; }
END { print "not ok $cntr\n" unless $cntr == 0 }
use ConLogger;
use ConLogger::SubTask;
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

$expout = "- I am curious to see how this works...
  I hope it goes like stink.
  - This is subtaskitem 0
    - This is subsubtaskitem 0
    - This is subsubtaskitem 1
    - This is subsubtaskitem 2
  - This is subtaskitem 1
    - This is subsubtaskitem 0
    - This is subsubtaskitem 1
    - This is subsubtaskitem 2
  - This is subtaskitem 2
    - This is subsubtaskitem 0
    - This is subsubtaskitem 1
    - This is subsubtaskitem 2
  - This is subtaskitem 3
    - This is subsubtaskitem 0
    - This is subsubtaskitem 1
  - This is subtaskitem 4
    - This is subsubtaskitem 0
    - This is subsubtaskitem 1
    - This is subsubtaskitem 2\n";

$stdout = "";
open CAPTURESTANDARDOUT, '>', \$stdout or die( "Can't open STDOUT: $!" );
select CAPTURESTANDARDOUT;
ConLogger::logitem( "I am curious to see how this works...\n" .
	      "I hope it goes like stink." );
my $st = ConLogger::SubTask->new();
for( my $i = 0; $i < 5; ++$i ) {
  ConLogger::logitem( "This is subtaskitem $i" );
  eval {
    my $sst = ConLogger::SubTask->new();
    for( my $j = 0; $j < 3; ++$j ) {
      ConLogger::logitem( "This is subsubtaskitem $j" );
      die( "Aargh!" ) if( $i == 3 and $j ==1 );
    }
  }
}

close CAPTURESTANDARDOUT;
select STDOUT;
unless ( $expout eq $stdout ) {
  warn( "Expected $expout; Got: $stdout" );
  print 'not '; 
}
print "ok $cntr\n";

$cntr = 0;
