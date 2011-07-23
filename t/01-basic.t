use strict;
use warnings;
use Test::More 0.88;
use Plack::Builder;
use HTTP::Request::Common;
use Plack::Test;
use File::Spec;
use File::Basename;

my $base = dirname(File::Spec->rel2abs(__FILE__));

my $handler = builder {
    enable 'Plack::Middleware::Static::Range',
        path => sub { s!^/share/!!}, root => $base;
    mount '/' => builder {
        sub {
            [200, [], ['ok']]
        };
    };
};
my %test = (
    client => sub {
        my $cb  = shift;
        {
            note('not static');
            my $res = $cb->(GET 'http://localhost/');
            is $res->content, 'ok';
        }

        {
            note('text file');
            my $res = $cb->(GET 'http://localhost/share/foo.txt');
            is $res->content_type, 'text/plain';
            is $res->content, "0123\n5678\n";
        }

        {
            note('not 200');
            my $res = $cb->(GET 'http://localhost/share/not_found.css');
            is $res->code, 404;
        }
    },
    app => $handler,
);

test_psgi %test;

done_testing;
