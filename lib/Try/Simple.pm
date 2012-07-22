package Try::Simple;
use strict;
use warnings;
use 5.010_001;


our $VERSION = '0.01';

use Class::Accessor::Lite (
    new => 1,
    rw  => [qw/error catches finally/],
);

use Exporter::Lite;
use Scalar::Util qw/blessed/;
use PadWalker qw/var_name peek_my/;

our @EXPORT = qw/
    try
    catch
/;

sub try (&;@) {
    my ($try, @catches) = @_;

    #backup error message
    my $error = $@;

    my $result = !eval {
        $@ = $error;
        $try->();
    };
    if ($error) {
        for my $catch (@catches){
            my $handled = $catch->handle($@);
            if ($handled) {
                last;
            }
        }
    }

}

sub catch {
    my $exception = shift;
    my $catch = pop;
    my $instance = Try::Simple::Catch->new(code => $catch, $cond => $cond);
}

package Try::Simple::Catch;
use strict;
use warnings;
use 5.010_001;

use Class::Accessor::Lite (
    new => 1,
    ro  => [qw/code/],
);

sub handle {
    my ($self, $error) = @_;
    my $v_name = var_name(2, \$_[1]) // '';
    if ($v_name) {
        ${peek_my(1)->{$v_name}} = $error;
    }

    $self->code->($error);
}

1;

1;


1;
__END__

=head1 NAME

Try::Simple - Perl extention to do something

=head1 VERSION

This document describes Try::Simple version 0.01.

=head1 SYNOPSIS

    use Try::Simple;

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.10.0 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

Nishibayashi Takuji E<lt>takuji@senchan.jpE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012, Nishibayashi Takuji. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
