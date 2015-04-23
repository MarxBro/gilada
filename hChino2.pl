#!/usr/bin/perl
##############################################################################
#: Devuelve el signo del horoscopo chino correspondiente
#: al a�o ingresado. Ej:
#: ./hChino2.pl 1980
#:					MarxBro.2010.
##############################################################################
$signo=0;
#Array!
@signos =	("mono",
				"gallo", 
				"perro", 
				"chancho",
				"rata", 
				"b�falo", 
				"tigre", 
				"conejo", 
				"drag�n", 
				"serpiente", 
				"caballo", 
				"cabra",
			);
if ($#ARGV< 0){					#Ning�n par�metro.
	print "Forma de uso:\n";
	print "\t./hChino2.pl [a�o]";
	print "\t\tallthemarxbrothersATgmail.com \n";
	exit 1;
	}
if ($#ARGV > 0) {				#M�s de un par�metro.
	print "Error. Se necesita solo un par�metro.\n";
	print "Por favor, intente de nuevo y escriba solo un a�o esta vez...\n";
	exit 1;
	}
else{							#Todo bien... a laburar.
	$agno = @ARGV[0];

sub my_prueba {
	my $i = $agno;
	if ($i < 0){
		until ($i < 12 & $i > -1){
			$i+=12;
		}
		$signo=$i;
		return $signo;
	}
	
	if ($i < 12){
			$signo=$i;
			return $signo;
		}
	else{
		until ($i < 12){
			$i-=12;
			if ($i < 12){
				$signo=$i;
			}
		}
		return $signo;
	}
}
#Para terminar, imprime los resultados en stdout (la consola!).
$nro= my_prueba();
print "\t" . "$agno \t==>".  "\t". @signos["$nro"] . "\n";
print "\t\t\t\t\tZaijian.\n"."\t\t\t\t\tallthemarxbrothersATgmail.com \n";
exit 0; # Final Feliz :-)
}
##############################################################################
# Hasta donde s�, los a�os en el hor�scopo chino cambian en Febrero,
# por lo que el resultado no necesariamente es exacto. 1984, por ejemplo, 
# tambi�n fu� a�o del chancho... �Realmente le preocupa?
##############################################################################
# 								GsTv aka MarxBro	 =>   puppyencastellano.tk
##############################################################################
#EOF

__DATA__
Este programa es muuuuuy viejo, de lo primero que hice en Perl.
Como anda, no me gaste en estilizarlo o corregirlo.
Tomalo o dejalo.
