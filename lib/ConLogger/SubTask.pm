# -*- cperl -*-
package ConLogger::SubTask;

=head1 NAME

ConLogger::SubTask -- auto-scope indenter

=cut

require 5.006;
require ConLogger;

use strict;

sub new {
    my $class = shift;
    my $self = {};
    bless( $self, $class );
    ++$ConLogger::__indentLevel;
    return $self;
}

sub DESTROY {
  --$ConLogger::__indentLevel;
}

1;

__END__

=head1 SYNOPSIS

  use ConLogger::SubTask;

  my $task = ConLogger::SubTask->new();
  ConLogger::logitem( "Starting burning wood in stove nr. 5" );

  for( my $i = 0; $i < 12; ++$i ) {

    my $taski = ConLogger::SubTask->new();
    ConLogger::logitem( "Starting batch $i" );

    for( my $j = 0; $j < 24; ++$j ) {
      my $taskj = ConLogger::SubTask->new();
      Conlogger::logitem( "Feeding lot no $j" );
      # burn();
    }

  }

  ConLogger::logitem( "Stove nr. 5 has finished" );

=head1 DESCRIPTION

This module allows indentation level management for the ConLogger log
printers (using a.o. C<ConLogger::logitem>). It employs the RAII
programming idiom to do so.

=head1 SEE ALSO

=over

=item * ConLogger

=item * ConLogger::ProgressBar

=back

=head1 COPYRIGHT

 CONFIDENTIAL AND PROPRIETARY (C) 2013 Digital Manifold Waves

=head1 AUTHOR

 Digital Manifold Waves -- F<walter.daems@uantwerpen.be>

=cut
