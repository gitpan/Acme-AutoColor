package Acme::AutoColor;

use 5.006;
use strict;
use warnings;

use Graphics::ColorNames 0.32;

our $VERSION = '0.01';

our $Colors;

sub import {
  my $class = shift;
  # TODO: parse version numbers
  $Colors = Graphics::ColorNames->new(@_);
}

package main;

use Carp qw( croak );
use Graphics::ColorNames qw( hex2tuple );

our $AUTOLOAD;

sub AUTOLOAD {
  my $class = shift;
  $AUTOLOAD =~ /.*::(\w+)/;

  my $value = $Acme::AutoColor::Colors->FETCH($1);
  if (defined $value) {
    return wantarray ? hex2tuple($value) : $value;
  } else {
    croak "Unknown method: $1";
  }
}

1;
__END__


=head1 NAME

Acme::AutoColor - automatic color names

=head1 SYNOPSIS

  use Acme::AutoColor;

  $red   = RED();    # 'ff0000'
  @green = GREEN();  # (0, 255, 0)

=head1 DESCRIPTION

This module uses an AUTOLOAD function which assumes unrecognized methods
are color names.

Color names are case-insensitive, though style-wise one should
probably use all capitals.

It returns a hex string or a an array of RGB triplets depending on the
calling context.

Color schemes may be specified in the use line:

  use Acme::AutoColor qw( X HTML );

=head1 SEE ALSO

L<Graphics::ColorNames>

=head1 AUTHOR

Robert Rothenberg <rrwo at cpan.org>

=head1 LICENSE

Copyright (c) 2005 Robert Rothenberg. All rights reserved.
This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
