# -*- cperl -*-
package ConLogger::ProgressBar;

=head1 NAME

ConLogger::ProgressBar -- progress bar

=cut

require 5.006;
require ConLogger;

use strict;
use constant WIDTH => 74;

sub new {
    my $class = shift;
    my $self = {};
    bless( $self, $class );
    return $self;
}

sub DESTROY {
  my $self = shift;

  $self->progress( 1, 1 );
  print "\r" . ' ' x WIDTH . "\r";
}

sub progress {
  my $self = shift;

  my ( $i, $tot ) = @_;
  my $percentage = $i / $tot;
  my $length = WIDTH - 2 * ( $ConLogger::__indentLevel + 1 ) - 7;
  return $self if $length < 4;
  my $curlength = int( $length * $percentage );
  my $remlength = $length - $curlength;
  print ' ' x ( ($ConLogger::__indentLevel + 1) * 2 ) . 
    '[' . '=' x $curlength . ' ' x $remlength . '] ' .
      sprintf( "%3d%%", 100.0 * $percentage ) . "\r";

  return $self;
}

1;

__END__

=head1 SYNOPSIS

  use ConLogger::ProgressBar;

  use ConLogger::SubTask;

  my $task = ConLogger::SubTask->new();
  ConLogger::logitem( "Starting burning wood in stove nr. 5" );

  for( my $i = 0; $i < 12; ++$i ) {

    my $taski = ConLogger::SubTask->new();
    ConLogger::logitem( "Starting batch $i" );

    my $pb = ConLogger::ProgressBar->new();

    for( my $j = 0; $j < 24; ++$j ) {
      $pb->progress( $j, 24 );
      # burn();
    }

  }

  ConLogger::logitem( "Stove nr. 5 has finished" );

=head1 DESCRIPTION

This module provides a properly indented progress bar. It employs the
RAII programming idiom to keep things tidy and clean.

=head1 SEE ALSO

=over

=item * ConLogger

=item * ConLogger::SubTask

=back

=head1 COPYRIGHT

 CONFIDENTIAL AND PROPRIETARY (C) 2013 Digital Manifold Waves

=head1 AUTHOR

 Digital Manifold Waves -- F<walter.daems@uantwerpen.be>
=cut
