package FileFormat;

use strict;
use Data::Dumper;

sub get_rowlist {
    my $self = shift;
    my @fields = ('Card Name', 'Color', 'Cost', 'Type', 'Pow/Tgh', 'Rules Text',
        'Flavor Text', 'Rarity', 'Number', 'Artist');

    return @fields;
}

sub parse {
    my $self = shift;

    my @fields = $self->get_rowlist();

    my $counter = scalar(@fields) + 1;
    my %row;
    while(<STDIN>) {
        # Skip blank lines
        next if(m/^\s*$/);

        # Remove spaces from end of lines
        s/\s+$//;

        chomp();

        # First we check for the first row, then reset everything
        if(m/^\s*$fields[0]/) {
            # Sanity check
            if($counter < scalar(@fields)) {
                print "counter: $counter\n";
                print "Not enough fields in this row:\n";
                print Dumper(\%row);
                die;
            } else {
                if($counter != scalar(@fields) + 1) {
                    $self->print_row(\%row);
                    undef %row;
                }
                $counter = 0;
            }
        }

        # Get a field
        if(m/^\s*$fields[$counter]:\s*(.*)\s*$/) {
            $row{$fields[$counter]} = $1;
            $counter++;
        } else {
            # If we aren't at a row, append the info
            if(m/^\s*(.*)$/) {
                $row{$fields[$counter - 1]} .= " $1";
            } else {
                $row{$fields[$counter - 1]} .= $_;
            }
        }
    }
    $self->print_row(\%row);
}

sub print_row {
    my $self = shift;
    my $row = shift;
    my @fields = $self->get_rowlist();
    my @field_values;
    for(my $i = 0; $i < scalar(@fields); $i++) {
        push(@field_values, $row->{$fields[$i]});
    }
    if((my $image = $self->check_for_image($row->{'Card Name'}))) {
        push(@field_values, $image);
    }

    if((my $set = $self->set())) {
        push(@field_values, $set);
    }
    print join('|', @field_values);
    print "\n";
}

sub check_for_image {
    my $self = shift;
    my $file = shift;
    #if(-e "/home/aaron/magic/download/Img/MI/$file.jpeg") {
    #    return "$file.jpg";
    #} else {
    #    return '';
    #}
    return 0;
}

sub set {
    my $self = shift;

    return 0;
}

1;
