#!/usr/bin/perl
######################################################################
# Anchota.pl -> una huevada para paragrafear lo que venga.
######################################################################

use strict;
use Getopt::Std;
use Pod::Usage;
use autodie;
use feature "say";
use Text::Wrap;
use File::Slurp "read_file";


my %opts = ();
getopts('hf:i:c:',\%opts);
my $ancho_linea = $opts{c} || 80;
my $indent = $opts{i} || " " ;
$Text::Wrap::columns = $ancho_linea;
my $tty_s = 0;
my @PIPA = ();
unless (-t){
    $tty_s++;
    while(<STDIN>){
        chomp;
        push(@PIPA,$_);
    }
}

######################################################################

=pod

=encoding utf8

=head1 SYNOPSIS

Este programa parrafea lo que venga.

=head2 Forma de uso:

Es posible pipear texto a traves de este programa o utilizarlo mediantes opciones.

Acepta las siguientes:

=over

=item B<-h>                 Imprime esta ayuda y muere. 

=item B<-f> [ARCHVIVO]      Abre el archivo y lo parrafea (como un loquito).

=item B<-i> [INDENT]        Configura el numero de espacios a utilizar como indentado al comienzo de cada parrafo.

=item B<-c> [CARACTERES]    Setea el ancho de linea.

=back

Sin opciones asume un indentado de parrafo de 1 espacio y 80 caracteres de longitud de linea.

=cut

######################################################################
# COD PPAL
######################################################################
if ($opts{h}){
    ayudas();
} else {
    my $fin = parrafea_puto();
    print $fin;
}

######################################################################
# SUBS
######################################################################

sub parrafea_puto {
    if ($opts{f}){
        my @l = read_file($opts{f});
        my $ll = wrap($indent,'',@l);
        return $ll;
    } elsif ($tty_s) {
        my $ll = wrap($indent,'',@PIPA);
        return $ll;
    } else {
        my $ll = wrap($indent,'',@ARGV);
        return $ll;
    }
}

sub ayudas {
    pod2usage(-verbose=>3);
    exit;
}

=pod

=head1 Autor y Licencia.

Programado por B<Marxbro> aka B<Gstv>, ditribuir solo bajo la licencia
WTFPL: I<Do What the Fuck You Want To Public License>.

Zaijian.

=cut
