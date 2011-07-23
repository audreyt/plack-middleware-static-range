package Plack::App::File::Range;
use 5.008001;
use strict;
use warnings;
use parent 'Plack::App::File';
our $VERSION = '0.01';

1;

__END__

=encoding utf8

=head1 NAME

Plack::App::File::Range - Serve static files with support for Range requests

=head1 SYNOPSIS

    use Plack::App::File::Range;
    my $app = Plack::App::File::Range->new(root => "/path/to/htdocs")->to_app;

=head1 DESCRIPTION

This module is a subclass of L<Plack::App::File> with additional support for
requests with C<Range> headers.

It is used internally by L<Plack::Middleware::Static::Range>.

=head1 SEE ALSO

L<Plack::Middleware::Static::Range>, L<Plack::App::File>

=head1 AUTHORS

唐鳳 E<lt>cpan@audreyt.orgE<gt>

=head1 CC0 1.0 Universal

To the extent possible under law, 唐鳳 has waived all copyright and related
or neighboring rights to L<Plack::App::File::Range>.

This work is published from Taiwan.

L<http://creativecommons.org/publicdomain/zero/1.0>

=cut
