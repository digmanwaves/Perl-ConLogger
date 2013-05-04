# -*- cperl -*-
package ConLogger;

=head1 NAME

ConLogger -- decent logging progress to the console (stdout)

=cut

require 5.006;
use strict;

our $__indentLevel = 0;

sub logitem {
  my ( $text ) = @_;
  chomp $text;

  my @text = split( "\n", $text );
  $text = shift @text;

  print ' ' x ( $__indentLevel * 2 ) . '- ' . $text . "\n";
  foreach $text ( @text ) {
    print ' ' x ( $__indentLevel * 2 ) . '  ' . $text . "\n";
  }
}

sub logcont {
  my ( $text ) = @_;
  chomp $text;

  my @text = split( "\n", $text );
  foreach $text ( @text ) {
    print ' ' x ( $__indentLevel * 2 ) . '  ' . $text . "\n";
  }
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
