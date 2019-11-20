Algoritmo sin_titulo
	
	//definir la matriz//	
	Dimension A[17,17];
	
	//crear los espacios de la matriz//
	para i<-0 hasta 16 con paso 1 hacer
		para j<-0 hasta 16 con paso 1 Hacer
			
			//llenar lineas horizontales y verticales del tablero
			si (i=5 o i=12 o j=5 o j=12) 
				escribir "0" sin saltar	
			SiNo
				escribir "#" sin saltar	
			FinSi						
		FinPara		
		Escribir ""
	FinPara		

FinAlgoritmo
