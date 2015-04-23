#!/usr/bin/perl
######################################################################
# Sendmail wannabe by me.
######################################################################
use autodie;
use feature q|say|;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;
use Encode;
use MIME::Words qw/encode_mimewords/;
use Getopt::Std;
use Pod::Usage;

=pod

=encoding utf8

=head1 Descripcion.

Este programa manda mails desde la consola desde texto pipeado a la enrada.

=head1 SYNOPSIS

Mandar mails como un loco, usando Gmail.

=cut

$|++;
my %opts = ();
getopts( 't:s:f:hd', \%opts );

=pod

=head2 Forma de uso:

Asi.

=over

=item -t [OBLIGATORIO]  -> Destinatario. 

=item -s [Opc.]         -> ASUNTO!!!! Puede estar ausente.

=item -f [Opc.]         -> Emisor o "From". Puede estar ausente 
                            (se utiliza el nombre de la cuenta de gmail).

=item -d                -> Debug.

=back

=cut

######################################################################
# Variables defaults, setear esto antes que nada.
######################################################################

#my @BODY_ = ();
my $BODY = '';
my $gmail_user = 'jacinto-camelachot@gmail.com' || die;
my $gmail_password = 'password123' || die;
my $sender_default = '';
my $CCO_default = ''; 
my $debug = 0;
$debug++ if $opts{d};
my $default_subject = 'Prueba';

my $SUBJECT = $opts{s};
dbg($SUBJECT);
my $SENDER = '';
if ( $opts{f} ) {
    $SENDER = "$opts{f}";
}
else {
    $SENDER = $gmail_user;
}
my $TO = $opts{t};

######################################################################
# SUBs
######################################################################

sub ayudas {
        pod2usage( -verbose => 3 );
    exit;
}

sub dbg {
    say @_ if $debug;
}

sub Codificar_cuerpo {
    my $b = shift;
    my $qw = encode( "iso-8859-1", "$b" );
    dbg($qw);
    return $qw;
}

sub Codificar_asunto {
    my $a  = shift;
    my $as = encode_mimewords("$a");
    dbg($as);
    return $as;
}

sub main_ {

    die unless $TO;
    unless ($SUBJECT) { $SUBJECT = $default_subject; }
    my $asunto = Codificar_asunto($SUBJECT);
    my $cuerpy = Codificar_cuerpo($BODY);
    my $email = Email::Simple->create(
        header => [
            From    => $SENDER,
            To      => $TO,
            Subject => $asunto,
            Bcc     => $CCO_default,
        ],
        body => $cuerpy,
    );
    my $sender = Email::Send->new(
        {
            mailer      => 'Gmail',
            mailer_args => [
                username => $gmail_user,
                password => $gmail_password,
            ]
        }
    );
    $email->header_set( 'MIME-Version'              => '1.0' );
    $email->header_set( 'Content-Transfer-Encoding' => '7bit' );
    $email->header_set( 'Content-Type' => 'text/plain; charset="utf8"' );
    eval { $sender->send($email) };
}

######################################################################
# Cod ppal.
######################################################################
if ( $opts{h} ) {
    ayudas();
}
elsif ( $opts{t} ) {
    while (<STDIN>) {
        $BODY .= $_;
    }
    dbg($BODY);
    die unless $BODY;
    main_();
    exit 0;
}
else {
    ayudas(1);
}

=pod

=head1 Autor y Licencia.

Programado por B<Marxbro> aka B<Gstv>, no me acuerdo bien cuando.
Sacado de algunos ejemplos de la web y le agregue algunas giladas.
Distribuir solo bajo la licencia WTFPL: I<Do What the Fuck You Want To Public License>.

Zaijian.

=cut
