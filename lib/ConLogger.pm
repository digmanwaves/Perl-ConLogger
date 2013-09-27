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

=head1 SYNOPSIS

  use ConLogger;

  ConLogger::logitem( "preheating the stove" );

  # start_heater();
  # wait_until_temperature_high_enough();

  ConLogger::logitem( "starting burning process" );
  ConLogger::logcont( "at 2000K" );

=head1 DESCRIPTION

This module allows logging events to the console (STDOUT). These
events are properly indented based on the indentation level set using
the package variable $__indentLevel. This variable can be managed by
the ConLogger::SubTask module, to allow for exception-safe indentation
management.

The module has two submodules:

=over

=item * ConLogger::SubTask to allow for exception-safe indentation
management

=item * ConLogger::ProgressBar to allow easy progress monitoring using
a text-bar

=back

=head1 SEE ALSO

=over

=item * ConLogger::SubTask

=item * ConLogger::ProgressBar

=back

=head1 COPYRIGHT

 CONFIDENTIAL AND PROPRIETARY (C) 2013 Digital Manifold Waves

=head1 AUTHOR

 Digital Manifold Waves -- F<walter.daems@uantwerpen.be>

=cut
