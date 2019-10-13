#!/usr/bin/perl -w

use WWW::Mechanize;

my $m = new WWW::Mechanize;

$m->get("http://wizards.com/default.asp?x=magic/products/cardlists");

my @links = $m->links();

foreach my $l (@links) {
    my $text = $l->text();
    if($text =~ m/spoiler/i) {
        print "http://wizards.com" . $l->url() . "\n";
    }
}
