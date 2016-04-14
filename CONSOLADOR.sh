#!/bin/bash
######################################################################
# CONSOLADOR -> mejora la estética de tu terminal urxvt.
# ----------
#
# + Ver en: y .
# + Un rxvt-unicode-9.15 completo para Puppy Linux acá:
# + En Slackware, es recomendable usar el Slackbuild, agregando la 
# opción "--enable-256-color" entre los FLAGS.
# Enlace:
#
######################################################################
# NOTAS:
# 
# El array ${FUENTES}, guarda las fuentes a levantar por xft que
# pudiesen no estar disponibles en su sistema, por lo cual es muy
# recomendable modificarlo.
# Para descargar Inconsolata, Audimat Pro y Lekton, cd en alguna 
# ubicacion y:  
# wget "http://levien.com/type/myfonts/Inconsolata.otf" && \
#   wget "http://www.smeltery.net/dl/audimat/audimat_OT.zip" && \
#   wget "http://www.fontsquirrel.com/fonts/download/lekton"
#
# Lo mismo transferido al "gusto" respecto a los colores: arrays
# mas chicos pueden dar resultados mas predecibles y eficaces,
# resultando siempre en una consola de su agradoi/preferencia.
# 
# Decidí parametrizar opciones con que urxvt se ejecuta...
# Se pueden cambiar a partir de la línea 30. Asume valores por defecto,
# bastante "estándares" y similares a lo de siempre (por las dudas).
#
#######################################################################

COLORIN='\E[37;41m'
XXX="tput sgr0" 
NN="`basename $0`";


AYUDA(){
echo -n " 
$NN [color] [color] [fuente X] [nro]
" &&
echo -ne "\n$COLORIN" &&
echo -n "Modo de uso:" &&
echo -ne "`$XXX`" &&
echo "
	$NN
	$NN [color letras]
	$NN [color letras] [color fondo]
	$NN [color letras] [color fondo] [fuente]
	$NN [color letras] [color fondo] [fuente] [trans]
	$NN [h|-h|help|-help|ayuda]
	$NN [s|-s]
	$NN [f|-f]
	$NN [bg|-bg]
	$NN [fg|-fg]				
" &&
echo -ne "$COLORIN $NN:`$XXX`
" && echo " Asistente para mejorar la estetica de urxvt. Sin opciones, selecciona entre
una serie de parametros aleatorios. Los argumentos utilizados son devueltos en
la salida, si el programa es ejecutado desde una terminal; en todos los casos,
el seteo resultante (con parametros aleatorios o no) es escrito en: 
/tmp/CONSOLADOR.log.
 Si se ejecuta con -c, el programa muestra el ultimo seteo efectuado, acorde a
la ultima ejecucion realizada (util para detectar fuentes renderizadas
incorrectamente o colores en la misma condicion). Si algun parametro falta,
este sera seleccionado aleatoriamente tambien. La sesion de urxvt resultante
es un proceso separado del script en si mismo.
 Las opciones f, bg y fg imprimen una lista de las fuentes, colores de fondo y
colores de texto -en orden respectivo-, posibles de ser inicializados.

                                                              Zaijian. -GsTv-
" &&
	exit 0
}

DAME_SETUP(){
	echo -e $(cat /tmp/CONSOLADOR.log) && 
	exit 0
}

LISTA_FUENTES(){
	for index in ${!FUENTE[*]}
	do
		echo ${FUENTE[$index]}
	done
}

LISTA_COLORES_FONDO(){
	for index in ${!COLORES_FONDO[*]}
	do
		echo ${COLORES_FONDO[$index]}
	done
}

LISTA_COLORES_TEXTO(){
	for index in ${!COLORES_TXT[*]}
	do
		echo ${COLORES_TXT[$index]}
	done
}

[[ $1 == "-h" ]] || [[ $1 == "h" ]] || [[ $1 == "help" ]] || [[ $1 == "-help" ]] || [[ $1 == "ayuda" ]] && AYUDA
[[ $1 == "-c" ]] || [[ $1 == "c" ]]  && DAME_SETUP

COLORES_FONDO=("aliceblue" "aqua" "aquamarine" "azure" "black"
"blanchedalmond" "blue" "blueviolet" "brown" "burlywood" "cadetblue"
"chocolate" "darkblue" "darkcyan" "darkgoldenrod" "darkgray" "darkgreen"
"darkkhaki" "darkmagenta" "darkolivegreen" "darkorange" "darkorchid" "darkred"
"darksalmon" "darkseagreen" "darkslateblue" "darkslategray" "darkturquoise"
"darkviolet" "deeppink" "deepskyblue" "dimgray" "dodgerblue" "firebrick"
"floralwhite" "forestgreen" "fuchsia" "gainsboro" "ghostwhite" "gold"
"goldenrod" "gray" "green" "greenyellow" "honeydew" "hotpink" "indianred"
"indigo" "ivory" "khaki" "lavender" "lavenderblush" "lawngreen" "lemonchiffon"
"lightsteelblue" "lightyellow" "limegreen" "linen" "magenta" "maroon"
"mediumauqamarine" "mediumblue" "mediumorchid" "mediumpurple" "mediumseagreen"
"mediumslateblue" "mediumspringgreen" "mediumturquoise" "mediumvioletred"
"midnightblue" "mintcream" "mistyrose" "moccasin" "navajowhite" "navy"
"oldlace" "olive" "olivedrab" "orange" "orangered" "orchid" "palegoldenrod"
"palegreen" "paleturquoise" "palevioletred" "papayawhip" "peachpuff" "peru"
"pink" "plum" "powderblue" "purple" "red" "rosybrown" "royalblue"
"saddlebrown" "salmon" "sandybrown" "seagreen" "seashell" "sienna" "silver"
"skyblue" "slateblue" "slategray" "snow" "springgreen" "steelblue" "tan"
"teal" "thistle" "tomato" "turquoise" "violet" "wheat" "white" "whitesmoke"
"yellow" "yellowgreen")

COLORES_TXT=("antiquewhite" "beige" "bisque" "chartreuse" "coral"
"cornflowerblue" "cornsilk" "cyan" "floralwhite" 
"ghostwhite" "goldenrod" "greenyellow" "honeydew" "ivory" "khaki"
"lavender" "lavenderblush" "lawngreen" "lemonchiffon" "lightblue" "lightcoral"
"lightcyan" "lightgoldenrodyellow" "lightgreen" "lightgrey" "lightpink"
"lightsalmon" "lightseagreen" "lightskyblue" "lightslategray" "lightsteelblue"
"lightyellow" "limegreen" "linen" "maroon" "mediumauqamarine"
"mediumblue" "mediumorchid" "mediumpurple" "mediumseagreen" "mediumslateblue"
"mediumspringgreen" "mediumturquoise" "mediumvioletred" "midnightblue"
"mintcream" "mistyrose" "navajowhite" "olivedrab" "orchid" "palegoldenrod" "palegreen"
"paleturquoise" "palevioletred" "papayawhip" "peachpuff" "peru" "pink" "plum"
"powderblue" "purple" "red" "rosybrown" "saddlebrown" "salmon"
"sandybrown" "seagreen" "seashell" "silver" "skyblue" 
"snow" "springgreen" "steelblue" "thistle" "turquoise" "white" "whitesmoke" "yellowgreen")

######################################################################
# FUENTES -->
######################################################################
# Para la mayoria de los Puppy Linux, creo que esto va a andar:
#FUENTES=("DejaVu Sans" courier "DejaVu Mono" fixed)
#----
# Este es mi seteo "completo":
#FUENTE=(Inconsolata "Audimat Mono" courier Cousine "DejaVu Sans Mono" "Droid
#Sans Mono" "Lekton" "Monaco" "NovaMono" "Luxi Mono" "Linux Libertine Mono" "Liberation
#Mono" "Lucida Console" Monospace "Nimbus Mono L" i"Telegrama" "Terminus(TTF)" 
#Thabit "Ubuntu Mono" Orbitron "saxMono" "Scifly" "Aurulent Sans Mono")
#----
#Este es mi seteo "optimizado" (las fuentes que mas me gustan):
FUENTE=(Inconsolata "Audimat Mono" "Consolas" "Ubuntu Mono")

######################################################################
# Parámetros
######################################################################
[[ $1 == "-f" ]] || [[ $1 == "f" ]]  && LISTA_FUENTES | column && exit 0
[[ $1 == "-bg" ]] || [[ $1 == "bg" ]]  && LISTA_COLORES_FONDO | column && exit 0
[[ $1 == "-fg" ]] || [[ $1 == "fg" ]]  && LISTA_COLORES_TEXTO | column && exit 0

[ $1 ] && COLOR_FG="$1"
[ ! $1 ] && COLOR_FG=${COLORES_TXT[$RANDOM % ${#COLORES_TXT[*]}]}
[ $2 ] && COLOR_BG="$2"
[ ! $2 ] && COLOR_BG=${COLORES_FONDO[$RANDOM % ${#COLORES_FONDO[*]}]}
[ $3 ] && FUENTE_NN="$3"
#[ ! $3 ] && FUENTE_NN="Inconsolata"
[ ! $3 ] && FUENTE_NN=${FUENTE[$RANDOM % ${#FUENTE[*]}]}
# Corregir valores de transparencia fuera de rango.
if [ $4 ]; then
   if [ $4 -lt 101 ]; then
       TRANS="$4"
   else
       echo "Transparencia fuera de rango."
       if [ $4 -gt 0 ]; then
           TRANS="95"
       else
           TRANS="5"
       fi
       echo "El nivel a usar a continuacion es de: $TRANS"
   fi
else
    TRANS="`echo $(($RANDOM % 50))`" && let "TRANS = $TRANS + 15"
fi


echo -e "\nEl color de fondo elegido entre ${#COLORES_FONDO[*]} colores es: $COLOR_BG" &&
echo "El color de la fuente elegido entre ${#COLORES_TXT[*]} colores es: $COLOR_FG" &&
echo "La fuente elegida entre las ${#FUENTE[*]} fuentes disponibles es: $FUENTE_NN" &&
echo "El nivel de transparencia final es de: $TRANS" &&
echo -e "\n\t\t\t~~|GsTv|~~."
echo -e "$COLOR_FG con fondo $COLOR_BG, $FUENTE_NN, tr a $TRANS" > /tmp/CONSOLADOR.log &&

######################################################################
# Ejecutar urxvt y terminar.
######################################################################
exec urxvt -vb +st -tr -cr green -tint $COLOR_BG -pr green -pr2 $COLOR_FG -sh $TRANS -bg $COLOR_BG -fg $COLOR_FG -fn "xft:$FUENTE_NN:pixelsize=12:antialias=true:hinting=true" 2> /dev/null &
#exec xterm -vb -tr -cr green -tint $COLOR_BG -pr green -pr2 $COLOR_FG -sh $TRANS -bg $COLOR_BG -fg $COLOR_FG -fn "xft:$FUENTE_NN:pixelsize=12:antialias=true:hinting=true" & #2> /dev/null &

exit 0
# EOF ############################################### ~~ GsTv ~~ #####
