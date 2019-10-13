package Mirrodin;

use FileFormat;
our @ISA = qw( FileFormat );

sub get_rowlist {
    my $self = shift;
    my @fields = ('Card Name', 'Color', 'Cost', 'Type', 'Pow/Tgh', 'Rules Text',
        'Flavor Text', 'Rarity', 'Number', 'Artist');

    return @fields;
}

sub set {
    my $self = shift;

    return 'MR';
}

1;
