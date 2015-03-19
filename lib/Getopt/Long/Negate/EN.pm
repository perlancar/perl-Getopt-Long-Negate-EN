package Getopt::Long::Negate::EN;

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(negations_for_option);

sub negations_for_option {
    my $word = shift;
    if    ($word =~ /\Awith([_-].+)/   ) { return ("without$1") }
    elsif ($word =~ /\Awithout([_-].+)/) { return ("with$1")    }
    elsif ($word =~ /\Ais([_-].+)/     ) { return ("isnt$1")    }
    elsif ($word =~ /\Aisnt([_-].+)/   ) { return ("is$1")      }
    elsif ($word =~ /\Aare([_-].+)/    ) { return ("arent$1")   }
    elsif ($word =~ /\Aarent([_-].+)/  ) { return ("are$1")     }
    elsif ($word =~ /\Ano[_-](.+)/     ) { return ($1)          }
    else {
        # default from Getopt::Long
        return ("no-$word", "no$word");
    }
}

=head1 SYNOPSIS

 use Getopt::Long::Negate::EN qw(negations_for_option);

 # the Getopt::Long's default
 @negs = negations_for_option('foo'); # ('no-foo', 'nofoo')

 @negs = negations_for_option('with-foo');    # ('without-foo')
 @negs = negations_for_option('without-foo'); # ('with-foo')

 @negs = negations_for_option('is-foo');      # ('isnt-foo')
 @negs = negations_for_option('isnt-foo');    # ('is-foo')

 @negs = negations_for_option('are-foo');     # ('isnt-foo')
 @negs = negations_for_option('arent-foo');   # ('arent-foo')

 @negs = negations_for_option('no-foo');      # ('foo')


=head1 DESCRIPTION

This module aims to provide a nicer negative boolean option names. By default,
L<Getopt::Long> provides options C<--foo> as well as C<--no-foo> and C<--nofoo>
if you specify boolean option specification C<foo!>. But this produces
awkward/incorrect English word like C<--nowith-foo> or C<--no-is-foo>. In those
two cases, C<--without-foo> and C<--isnt-foo> are better option names.


=head1 FUNCTIONS

None are exported by default, but they are exportable.

=head1 negations_for_option($str) => list

