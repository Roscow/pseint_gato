


subproceso	 mostrar_logo
	//logo principal
	Escribir "####################################"
	Escribir "##             GATO#              ##"	
	Escribir "##________________________________##"
FinsubProceso

subproceso	 logo_P1vsP2
	//logo principal
	Escribir "####################################"
	Escribir "##        JUEGO P1 VS P2          ##"	
	Escribir "##________________________________##"
FinsubProceso


subproceso	 logo_P1vsPc
	//logo principal
	Escribir "####################################"
	Escribir "##        JUEGO P1 VS PC          ##"	
	Escribir "##________________________________##"
FinsubProceso


Funcion	tipo_juego <- menu_principal()
	mostrar_logo;
	Escribir "####################################"
	Escribir "##         Menu princial          ##"
	Escribir "##________________________________##"
	Escribir "##  Seleccione un modo            ##"
	Escribir "##    1- Player1 vs Player2       ##"
	Escribir "##    2- Player1 vs PC            ##"
	Escribir "##________________________________##"
	Escribir "ingrese...."	
	Leer tipo_juego;	
FinsubProceso


subproceso mostrar_cuadrante
	Escribir "seleccione un cuadrante"; 
	Escribir "[1][2][3]";	
	Escribir "[4][5][6]";	
	Escribir "[7][8][9]";
FinSubProceso





//modo juego P1 VS P2
SubProceso contra_jugador
	Definir aux como texto;
	definir num como entero;
	definir var_quien_comienza como entero; 
	
	Limpiar Pantalla;
	mostrar_logo;
	logo_P1vsP2;
	
	Escribir "Elija un player cada jugador";
	Escribir "presione para continuar...";
	leer aux;
	//numero al azar del 0 al 1
	num <- azar(2)
	si(num = 0)
		Escribir "comienza el Player1";
		var_quien_comienza <- 0;
		
	SiNo
		Escribir "comienza el Player2";
		var_quien_comienza <-1;
	FinSi
	Escribir "presione una tecla para continuar"
	leer aux;
	Limpiar Pantalla;
	secuencia_jugadas(var_quien_comienza)
FinSubProceso



Funcion secuencia_jugadas(var_quien_comienza)
	definir jugadas_par como texto;
	Definir jugadas_impar como texto;
	definir simbolo_actual como caracter; //el que empieza tiene cruz
	definir cuadrante_logico como logico ;
	Definir cuadrante_num como texto;
	definir ganar como logico;
	Definir  jugador_actual como texto;
	ganar<-falso;
	//definir matriz base
	dimension matriz[3,9];
	para i <-1 hasta 3 con paso 1 hacer
		para j <-1 hasta 9 con paso 1 hacer			
			matriz[i,j]= "]";	
			si ((i=1 o i=2 o i=3 ) y (j=1 o j=4 o j=7))
				matriz[i,j]= "[";
			FinSi
		FinPara
	FinPara
	matriz[1,2]="1";
	matriz[1,5]="2";
	matriz[1,8]="3";
	matriz[2,2]="4";
	matriz[2,5]="5";
	matriz[2,8]="6";
	matriz[3,2]="7";
	matriz[3,5]="8";
	matriz[3,8]="9";
	
	
	si(var_quien_comienza=0)
		jugadas_par <- "Player2";	
		jugadas_impar <-"Player1";
	FinSi
	
	si(var_quien_comienza=1)
		jugadas_par <- "Player1";
		jugadas_impar <-"Player2";
	FinSi
	
	

	//son 9 jugadas por lo que el ciclo se cierra despues de 9
	turno=1;
	Mientras (turno<=9 y ganar=falso)
		escribir "turno N°: ",turno;
		//cuando es impar
		si(turno MOD 2 <> 0)
			Escribir jugadas_impar, " Es su turno";
			jugador_actual = jugadas_impar;
			simbolo_actual= "x";
		FinSi
		
		si(turno MOD 2 =0)
			Escribir jugadas_par, " Es su turno";
			simbolo_actual= "o";
			jugador_actual = jugadas_par;			
		FinSi
		turno=turno +1;
		
		 
		//mostrar matriz				
		para i <-1 hasta 3 con paso 1 hacer
			para j <-1 hasta 9 con paso 1 hacer
				
				escribir matriz[i,j] sin saltar;						
			FinPara
			Escribir "";
		FinPara		
		
		//ingresar el cuadrande donde se insertara
		cuadrante_logico <- falso;
		mientras (cuadrante_logico=falso)
			Escribir "SELECCIONE UN CUADRANTE";
			leer cuadrante_num;
			
			para i <-1 hasta 3 con paso 1 hacer
				para j <-1 hasta 9 con paso 1 hacer
					si(matriz[i,j]= cuadrante_num)
						matriz[i,j]= simbolo_actual;
						Escribir "se agrego simbolo";
						cuadrante_logico = verdadero;
					FinSi
				FinPara			
			FinPara
			
		FinMientras											
		//revisar si despues de jugar hay un ganador
		//con el simbolo actual se pueden dar 8 casos para ganar(se puede optimizar mas adelante este proces)
		//Caso 1
		si (matriz[1,2]= simbolo_actual y matriz[1,5] =simbolo_actual y matriz[1,8]=simbolo_actual )
			ganar<- verdadero;
		FinSi
		//caso2
		si (matriz[1,2]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[3,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 3
		si (matriz[1,8]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[3,2]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 4
		si (matriz[3,2]= simbolo_actual y matriz[3,5] =simbolo_actual y matriz[3,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 5
		si (matriz[2,2]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[2,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi			
		//caso 6
		si (matriz[1,2]= simbolo_actual y matriz[2,2] =simbolo_actual y matriz[3,2]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 7
		si (matriz[1,5]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[3,5]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 8
		si (matriz[1,8]= simbolo_actual y matriz[2,8] =simbolo_actual y matriz[3,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		
		Limpiar Pantalla;
	FinMientras	
	si(ganar=Verdadero)
		Escribir "#############################";
		Escribir "#        Game Over          #";
		Escribir "# el ganador es :",jugador_actual,"    #";
	FinSi
	
	si(ganar=falso)
		Escribir "#############################";
		Escribir "#        Game Over          #";
		Escribir "#          EMPATE           #";
	FinSi
FinFuncion


Funcion cuadrante <- elegir_cuadrante_pc( )
	cuadrante = azar(8);
Fin Funcion

Funcion secuencia_jugadas2(var_quien_comienza)
	definir jugadas_par como texto;
	Definir jugadas_impar como texto;
	definir simbolo_actual como caracter; //el que empieza tiene cruz
	definir cuadrante_logico como logico ;
	Definir cuadrante_num como texto;
	definir ganar como logico;
	Definir  jugador_actual como texto;
	ganar<-falso;
	//definir matriz base
	dimension matriz[3,9];
	para i <-1 hasta 3 con paso 1 hacer
		para j <-1 hasta 9 con paso 1 hacer			
			matriz[i,j]= "]";	
			si ((i=1 o i=2 o i=3 ) y (j=1 o j=4 o j=7))
				matriz[i,j]= "[";
			FinSi
		FinPara
	FinPara
	matriz[1,2]="1";
	matriz[1,5]="2";
	matriz[1,8]="3";
	matriz[2,2]="4";
	matriz[2,5]="5";
	matriz[2,8]="6";
	matriz[3,2]="7";
	matriz[3,5]="8";
	matriz[3,8]="9";
	
	
	si(var_quien_comienza=0)
		jugadas_par <- "computadora";	
		jugadas_impar <-"Player1";
	FinSi
	
	si(var_quien_comienza=1)
		jugadas_par <- "Player1";
		jugadas_impar <-"computadora";
	FinSi
	
	
	
	//son 9 jugadas por lo que el ciclo se cierra despues de 9
	turno=1;
	Mientras (turno<=9 y ganar=falso)
		escribir "turno N°: ",turno;
		//cuando es impar
		si(turno MOD 2 <> 0)
			Escribir jugadas_impar, " Es su turno";
			jugador_actual = jugadas_impar;
			simbolo_actual= "x";
		FinSi
		
		si(turno MOD 2 =0)
			Escribir jugadas_par, " Es su turno";
			simbolo_actual= "o";
			jugador_actual = jugadas_par;			
		FinSi
		turno=turno +1;
		
		
		//mostrar matriz				
		para i <-1 hasta 3 con paso 1 hacer
			para j <-1 hasta 9 con paso 1 hacer
				
				escribir matriz[i,j] sin saltar;						
			FinPara
			Escribir "";
		FinPara		
		
		//ingresar el cuadrande donde se insertara
		cuadrante_logico <- falso;
		mientras (cuadrante_logico=falso)
			Escribir "SELECCIONE UN CUADRANTE";
			si(jugador_actual="computadora")
				esperar 5 segundos;
				cuadrante_num <- ConvertirATexto(elegir_cuadrante_pc);
			FinSi
			si(jugador_actual="Player1")
				leer cuadrante_num;
			FinSi
			
			//cuadrante_num <- ConvertirATexto(elegir_cuadrante_pc);
			
			para i <-1 hasta 3 con paso 1 hacer
				para j <-1 hasta 9 con paso 1 hacer
					si(matriz[i,j]= cuadrante_num)
						matriz[i,j]= simbolo_actual;
						Escribir "se agrego simbolo";
						cuadrante_logico = verdadero;						
					FinSi
				FinPara			
			FinPara
			
			
		FinMientras											
		//revisar si despues de jugar hay un ganador
		//con el simbolo actual se pueden dar 8 casos para ganar(se puede optimizar mas adelante este proces)
		//Caso 1
		si (matriz[1,2]= simbolo_actual y matriz[1,5] =simbolo_actual y matriz[1,8]=simbolo_actual )
			ganar<- verdadero;
		FinSi
		//caso2
		si (matriz[1,2]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[3,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 3
		si (matriz[1,8]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[3,2]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 4
		si (matriz[3,2]= simbolo_actual y matriz[3,5] =simbolo_actual y matriz[3,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 5
		si (matriz[2,2]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[2,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi			
		//caso 6
		si (matriz[1,2]= simbolo_actual y matriz[2,2] =simbolo_actual y matriz[3,2]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 7
		si (matriz[1,5]= simbolo_actual y matriz[2,5] =simbolo_actual y matriz[3,5]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		//caso 8
		si (matriz[1,8]= simbolo_actual y matriz[2,8] =simbolo_actual y matriz[3,8]=simbolo_actual)
			ganar<- verdadero;
		FinSi
		
		Limpiar Pantalla;
	FinMientras	
	si(ganar=Verdadero)
		Escribir "#############################";
		Escribir "#        Game Over          #";
		Escribir "# el ganador es :",jugador_actual,"    #";
	FinSi
	
	si(ganar=falso)
		Escribir "#############################";
		Escribir "#        Game Over          #";
		Escribir "#          EMPATE           #";
	FinSi
FinFuncion


//modo juego P1 VS PC
SubProceso contra_maquina
	Definir aux como texto;
	definir num como entero;
	definir var_quien_comienza como entero; 
	
	Limpiar Pantalla;
	mostrar_logo;
	logo_P1vsPC;
	
	Escribir "usted es el Player1";
	Escribir "presione para continuar...";
	leer aux;
	//numero al azar del 0 al 1
	num <- azar(2)
	si(num = 0)
		Escribir "comienza el Player1";
		var_quien_comienza <- 0;
		
	SiNo
		Escribir "comienza la computadora";
		var_quien_comienza <-1;
	FinSi
	Escribir "presione una tecla para continuar"
	leer aux;
	Limpiar Pantalla;
	secuencia_jugadas2(var_quien_comienza)
FinSubProceso

Algoritmo juego_gato
	//variables locales
	definir tipo_juego como entero;
	//no hay validaciones , eso pa mas adelante
	tipo_juego <- menu_principal;
	si (tipo_juego = 1)
		Escribir "juego P1 VS P2";
		contra_jugador;
	FinSi
	si (tipo_juego = 2 )
		Escribir "JUEGO P1 vs PC";
		contra_maquina;
	FinSi
FinAlgoritmo
