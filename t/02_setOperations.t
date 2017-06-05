use strict;
use warnings;
use File::Basename qw/dirname/;
use FindBin qw/$RealBin/;

use Test::More tests => 3;

use lib "$RealBin/../lib/perl5";
use_ok 'Bio::Kmer';

# Pure perl
my $kmer1=Bio::Kmer->new(dirname($0)."/../data/rand.fastq.gz",{kmerlength=>8});
my $kmer2=Bio::Kmer->new(dirname($0)."/../data/rand2.fastq.gz",{kmerlength=>8});

my $intersection = $kmer1->intersection($kmer2);
is scalar(@$intersection), 33948, "Intersection of all kmers";

my $union = $kmer1->union($kmer2);

is scalar(@$union), 62362, "Union of all kmers";

#is $$histJf[$i], $correctCounts[$i], "Freq of $i checks out";

