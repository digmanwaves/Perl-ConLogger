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

=head1 SEE ALSO

 --

=head1 COPYRIGHT

 CONFIDENTIAL AND PROPRIETARY (C) 2013 Digital Manifold Waves

=head1 AUTHOR

 Digital Manifold Waves -- F<walter.daems@ua.ac.be>

=cut
