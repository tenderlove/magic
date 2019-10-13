package Legions;

use FileFormat;
our @ISA = qw( FileFormat );

sub get_rowlist {
    my $self = shift;
    my @fields = ('Card Name', 'Card Color', 'Mana Cost', 'Type & Class',
        'Pow/Tou', 'Card Text', 'Flavor Text', 'Artist', 'Rarity', 'Card #');

    return @fields;
}

sub set {
    my $self = shift;

    return 'LE';
}

1;
