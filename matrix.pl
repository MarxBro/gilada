#!/usr/bin/perl
$|++;

if ( $ARGV[0] ) {

    # colores
    while (1) {
        print " " x ( rand(35) + 1 );
        print "\e["
          . ( ( 31 .. 37 )[ rand(7) ] ) . ";"
          . ( ( 41 .. 47 )[ rand(7) ] ) . "m"
          . int( rand(2) ) . "\e[0m";
        sleep( select( undef, undef, undef, 0.006 ) );
    }
}
else {
    while (1) {
        print " " x ( rand(35) + 1 ), int( rand(2) );
        sleep( select( undef, undef, undef, 0.006 ) );
    }
}
