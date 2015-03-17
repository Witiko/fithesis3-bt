#!/usr/bin/perl -w 
# Detects pages containing no text in "$1".

use CAM::PDF;
my $filename=$ARGV[0];
my $doc = CAM::PDF->new($filename) || die "$CAM::PDF::errstr\n";
my $pages = $doc->numPages();

my $missing = 0;
for (my $i = 1; $i <= $pages; $i++) {
  if (length($doc->getPageText($i)) != 0) {
    print("$i\t$missing\n");
  } else {
    print("$i\n");
    $missing++;
  }
}