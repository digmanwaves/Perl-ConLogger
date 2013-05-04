require 5.006;

use ExtUtils::MakeMaker;

$target = 'MS'; # set this to MS to avoid generating man pages with 
$version = '1.00',

WriteMakefile
  (
   NAME      => 'ConLogger',
   AUTHOR    => 'Walter Daems / Digital Manifold Waves (walter@digmanwaves.net)',
   ABSTRACT  => 'Simple logging facility for STDOUT status printing',
   VERSION   => $version,
   PREREQ_PM => { 
		},
   ( $target eq 'MS' ) ? ( MAN1PODS => {}, MAN3PODS => {} ) : (),
   META_ADD  => 
   { provides => {
       'ConLogger'              => { file => 'lib/Conlogger.pm',
				     version => $version },
       'ConLogger::SubTask'     => { file => 'lib/Conlogger/SubTask.pm',
				     version => $version },
       'ConLogger::ProgressBar' => { file => 'lib/Conlogger/ProgressBar.pm',
				     version => $version },
     }
   },
#   EXE_FILES => [ '' ],
   test      => { TESTS => 't/???-test-*.pl' },
  );


