subproceso	 mostrar_logo
	//logo principal
	Escribir "####################################"
	Escribir "##             GATO#              ##"	
	Escribir "##________________________________##"
FinsubProceso



subproceso	 menu_principal	
	Escribir "####################################"
	Escribir "##         Menu princial          ##"
	Escribir "##________________________________##"
	Escribir "##  Seleccione un modo            ##"
	Escribir "##    1- Player1 vs Player2       ##"
	Escribir "##    2- Player1 vs PC            ##"
	Escribir "##________________________________##"
	Escribir "ingrese...."	
FinsubProceso












//modo juego P1 VS P2
SubProceso contra_jugador
	Definir aux como texto;
	definir num como entero;
	definir var_quien_comienza como entero;
	
		
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
	Escribir num;
FinSubProceso



subproceso prueba
	//crear los espacios de la matriz//
	para i<-0 hasta 16 con paso 1 hacer
		para j<-0 hasta 16 con paso 1 Hacer
			
			//llenar lineas horizontales y verticales del tablero
			si (i=5 o i=11 o j=5 o j=11) 
				escribir "#" sin saltar	
			SiNo
				escribir " " sin saltar	
			FinSi						
		FinPara		
		Escribir ""
	FinPara		
FinSubProceso
	

Algoritmo juego_gato
	
	//definir la matriz//	
	Dimension A[17,17];
	mostrar_logo;
	menu_principal;
	contra_jugador;
	

	
	
	
	
	
	
	
FinAlgoritmo
