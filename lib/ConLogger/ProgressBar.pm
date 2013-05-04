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

=head1 SEE ALSO

 --

=head1 COPYRIGHT

 CONFIDENTIAL AND PROPRIETARY (C) 2013 Digital Manifold Waves

=head1 AUTHOR

 Digital Manifold Waves -- F<walter.daems@ua.ac.be>

=cut
