require './Node'
require './List'
require './Tarjeta'


#Funcion buscar en lista
def Buscar_Tarjeta(lista, numIngresado)
  card=lista.buscar(numIngresado)
  return card
end

#Actualizacion de datos
def Actualizacion(lista, card)
  lista.actualizar(card)
  return lista
end

#Funcion de Retiro
def Retiro(lista, card, monto)
  if card != nil
    saldo=card.get_saldo
    lineaCredito=card.get_lineaCredito
    #Si la tarjeta es de debito se le descuenta lo retirado     
    if (card.get_tipo=="d")
      cobro=monto
      #Se verifica si la operacion es valida
      if cobro<=saldo
        card.set_saldo(saldo - cobro)
        puts ""
        puts "Operacion Exitosa"
        puts ""
        puts "Saldo Disponible: #{card.get_saldo}"
        puts ""
      else
        puts "No se puede retirar ese monto"
        return lista
      end
    end
    #Si la tarjeta es de credito se le descuenta 0.05 mas de lo retirado
    if (card.get_tipo=="c")
      cobro=monto*1.05
      #Se verifica si la operacion es valida
      if (cobro+saldo)<=lineaCredito and cobro<=(lineaCredito * 0.5)
      card.set_saldo(saldo + cobro) #En este causo aumenta la deuda (El saldo en este caso es la deuda)
      puts ""
      puts "Operacion Exitosa"
      puts ""
      puts "Deuda: #{card.get_saldo}"
      puts ""
      else
        puts "No se puede retirar ese monto"
        return lista
      end
    end
  end
  #Se actualiza la lista de db
  lista=Actualizacion(lista, card)
  return lista
end


#Deposito
def Deposito(lista, card, monto)
  if card!=nil  
    saldo=card.get_saldo
    lineaCredito=card.get_lineaCredito

    #Si la tarjeta es de debito, se le aumenta al saldo
    if (card.get_tipo=="d")
      cobro=monto
      card.set_saldo(saldo + cobro)
      lista=Actualizacion(lista, card)
      puts ""
      puts "Operacion Exitosa"
      puts ""
      puts "Saldo Disponible: #{card.get_saldo}"
      puts ""
      return lista 
    end
    #Si la tarjeta es de credito, se repone el salde
    if(card.get_tipo=="c")
      pago=monto
      calMaxPagar=saldo-monto
      #Se verifica si se ingreso mas de lo debido
      if(calMaxPagar<=lineaCredito and saldo>=pago)
        #En este caso el saldo es la deuda
        card.set_saldo(saldo-pago)
        lista=Actualizacion(lista, card)
        puts ""
        puts "Operacion Exitosa"
        puts ""
        puts "Deuda: #{card.get_saldo}"
        puts ""
        return lista 
      else
        puts "Deposito supera deuda de la tarjeta de credito"
        return nil
      end
    end
  end
end

#Consultas
def Consultas(card)
  card.consultas
end

#Opciones
def Options(lista, card)
  puts ""
  puts "\n1.-Retiro \n2.-Deposito \n3.-Consultas\n\n"
  puts "Que operacion desea realizar?"
  opcion= gets
  #Aqui se busca la operacion a realizar
  case opcion
  when "1\n" 
    puts ""
    puts "Ingrese el monto a retirar"
    monto=gets.to_f
    operacion=Retiro(lista, card,monto)
    if operacion==nil
      puts "Error en el retiro"
      main(lista)
    else
      lista=operacion
    end
    NuevaOp(lista, card)
  when "2\n"
    puts "" 
    puts "Ingrese el monto a depositar"
    monto=gets.to_f
    operacion=Deposito(lista, card,monto)
    if operacion==nil
      puts "Error en el deposito"
      main(lista)
    else
      lista=operacion
    end
    NuevaOp(lista, card)
  when "3\n"
    Consultas(card)
    NuevaOp(lista, card)
  else
    puts ""
    puts "Seleccione una opcion valida"
    Options(lista,card)
  end
end  

#Realizar nuevas operaciones
def NuevaOp(lista,card)
  puts ""
  puts ""
  puts "¿Desea continuar con operaciones?(si) o (no)"
  puts ""
  continuacion=gets

  if(continuacion=="S\n" or continuacion=="s\n")
    Options(lista,card)
  else
    puts "Fin de las operaciones"
    puts ""
  end
end

#Prueba
def main(lista)
  
  puts ""
    
  puts "Ingrese su numero de tarjeta: "
  
  numTarjeta= gets.to_i
  #Se busca la tarjeta para verificar su existencia en la db
  card=Buscar_Tarjeta(lista, numTarjeta)
  if(card==nil) #caso de no estar, se reinicia el programa
    main(lista)
  end

  Options(lista, card)
end

t1=Tarjeta.new("Sergio Flores",4564989907672113,300000,"d")
t2=Tarjeta.new("Gonzalo Garma",4563498990762343,30000,"c")
t2.set_lineaCredito(30000)
t3=Tarjeta.new("Alexis Coria",4113978622345551,35000,"d")
t4=Tarjeta.new("Katyuska Hinostroza",5928826708248418,8728,"c")
t4.set_lineaCredito(26287)
t5=Tarjeta.new("Gertrudis Losada",5745459779025390,17808,"d")
t6=Tarjeta.new("Iago Sanjuan",5730020147007349,18292,"c")
t6.set_lineaCredito(26772)
t7=Tarjeta.new("Samara Leal",5122714476046939,6422,"c")
t7.set_lineaCredito(28808)
t8=Tarjeta.new("Marco Leonel",5349584811671748,17446,"c")
t8.set_lineaCredito(20973)
t9=Tarjeta.new("Hernan Pirata",5358353360077577,18720,"c")
t9.set_lineaCredito(22540)
t10=Tarjeta.new("Marcos Calvo",5609819427755696,17663,"c")
t10.set_lineaCredito(27897)
t11=Tarjeta.new("Jorge Moy",4663066366069151,17477,"c")
t11.set_lineaCredito(21058)
t12=Tarjeta.new("Jose Valdivia",4365184305103292,10265,"d")
t13=Tarjeta.new("Miguel Bolognesi",4455522295328778,14624,"c")
t13.set_lineaCredito(26618)
t14=Tarjeta.new("Ana Mamani",4874394281641581,7018,"c")
t14.set_lineaCredito(20259)
t15=Tarjeta.new("Humberto Huaman",5836616066011234,13184,"c")
t15.set_lineaCredito(24450)
t16=Tarjeta.new("Gian Tapia",5926267321918478,8037,"d")
t17=Tarjeta.new("Daniel Garcia",4357867441385042,13411,"d")
t18=Tarjeta.new("Pablo Reyes",5173949773682295,5157,"d")
t19=Tarjeta.new("Josh Salcedo",5479206689459293,6144,"d")
t20=Tarjeta.new("Maria Li",5264483918341715,19331,"d")
t21=Tarjeta.new("Samantha Castro",4943517189670475,1561,"d")
t22=Tarjeta.new("Alessandra Caballero",5558690124024524,8612,"d")

lista=List.new

lista.addLast(t1)
lista.addLast(t2)
lista.addLast(t3)
lista.addLast(t4)
lista.addLast(t5)
lista.addLast(t6)
lista.addLast(t7)
lista.addLast(t8)
lista.addLast(t9)
lista.addLast(t10)
lista.addLast(t11)
lista.addLast(t12)
lista.addLast(t13)
lista.addLast(t14)
lista.addLast(t15)
lista.addLast(t16)
lista.addLast(t17)
lista.addLast(t18)
lista.addLast(t19)
lista.addLast(t20)
lista.addLast(t21)
lista.addLast(t22)

#Si desea ver los elementos de la lista
#lista.showElements

main(lista)

=begin

INICIO
	Importar Clase Tarjeta
	Importar Clase Node
	Importar Clase List
	INICIO FUNCIÓN Buscar_Tarjeta(List lista,Int numTarjeta)
		Tarjeta card=lista.BuscarTarjeta(numTarjeta)
		Retornar card
	FIN FUNCIÓN Buscar_Tarjeta
	INICIO FUNCIÓN Actualizacion(List lista, Tarjeta card)
		lista.Actualizar(card)
		Retornar lista
	FIN FUNCIÓN Actualizacion
	INICIO FUNCIÓN Retiro(List lista, Tarjeta card, Float monto)
		Si card != nulo Entonces
			Float saldo=card.get_saldo
			Float lineaCredito=card.get_lineaCredito
			Si card.get_tipoTarjeta=‘d’ Entonces
				Float cobro=monto
				Si cobro<=saldo Entonces
					card.set_saldo(saldo-cobro)
					Imprimir en pantalla “”
					Imprimir en pantalla “Operación Exitosa”
					Imprimir en pantalla “”
					Imprimir en pantalla “Saldo Disponible: ”+card.get_saldo
					Imprimir en pantalla “”
				Sino
					Imprimir en pantalla “No se puede retirar ese monto”
					Retornar lista
				Fin Si
			Fin Si
			Si card.get_tipoTarjeta=‘c’ Entonces
				cobro=monto*1.05
				Si ((cobro+saldo)<=lineaCredito) y (cobro<=(lineaCredito*0.5))
					card.set_saldo(cobro+saldo)
					Imprimir en pantalla “”
					Imprimir en pantalla “Operación Exitosa”
					Imprimir en pantalla “”
					Imprimir en pantalla “Deuda: ”+card.get_saldo
					Imprimir en pantalla “”
				Sino 	
					Imprimir en pantalla “No se puede retirar ese monto”
					Retornar lista
				Fin Si
			Fin Si
		Fin Si
		lista=Actualizacion(lista,card)
		Retornar lista		
FIN FUNCIÓN Retiro

INICIO FUNCIÓN Deposito (List lista, Tarjeta card, Float monto)
		Si card != nulo Entonces
      Float saldo=card.get_saldo
			Float lineaCredito=card.get_lineaCredito
			Si card.get_tipoTarjeta=‘d’ Entonces
				Float cobro=monto
				card.set_saldo(saldo+cobro)
				lista=Actualizacion(lista,card)
				Imprimir en pantalla “”
				Imprimir en pantalla “Operación Exitosa”
				Imprimir en pantalla “”
				Imprimir en pantalla “Saldo Disponible: ”+card.get_saldo
				Imprimir en pantalla “”
				Retornar lista
			Fin Si
			Si card.get_tipoTarjeta=‘c’ Entonces
				Float pago=monto
				Float calMaxPagar=saldo-monto
			Si (calMaxPagar<=linaCredito) y (saldo>=pago)
				card.set_saldo(saldo-pago)
					lista=Actualizacion(lista,card)
					Imprimir en pantalla “”
					Imprimir en pantalla “Operación Exitosa”
					Imprimir en pantalla “”
					Imprimir en pantalla “Deuda: ”+card.get_saldo
					Imprimir en pantalla “”
					Retornar lista
				Si no
          Imprimir en pantalla “Deposito supera deuda de la tarjeta de credito”
          Retornar nulo
				Fin Si
			Fin Si
		Fin Si
FIN FUNCIÓN Deposito

INICIO FUNCIÓN Consultas(Tarjeta card)
	card.consultas
FIN FUNCIÓN Consultas
INICIO FUNCIÓN Opciones (List lista, Tarjeta card)
	Imprimir por pantalla ""
 	Imprimir por pantalla "\n1.-Retiro \n2.-Deposito \n3.-Consultas\n\n"
  	Imprimir por pantalla "Que operacion desea realizar?"
	String opcion= Escanear valor String por pantalla
	Caso:
		Cuando opcion=”1\n”
			Imprimir por pantalla ""
   			Imprimir por pantalla "Ingrese el monto a retirar"
			Float monto= Escanear valor Float por pantalla
			List operacion=Retiro(lista, card, monto)
			Si operacion=nulo
				Imprimir por pantalla " Error en el retiro"
				MAIN(lista)
			Sino
				lista=operación
			Fin Si
			NuevaOp(lista, card)
		Fin Caso 1
		Cuando opcion=”2\n”
			Imprimir por pantalla ""
   			Imprimir por pantalla "Ingrese el monto a depositar"
			Float monto= Escanear valor Float por pantalla
			List operacion=Deposito(lista, card, monto)
			Si operacion=nulo
				Imprimir por pantalla " Error en el deposito"
				MAIN(lista)
			Sino
				lista=operación
			Fin Si
			NuevaOp(lista, card)
		Fin Caso 2
		Cuando opcion=”3\n”
			Consultas(card)
			NuevaOp(lista, card)
		Fin Caso 3
		Sino
			Imprimir por pantalla ""
    			Imprimir por pantalla "Seleccione una opcion valida"
    			Opciones(lista,card)
	Fin Caso	
FIN FUNCIÓN Opciones
INICIO FUNCIÓN NuevaOp(List lista, Tarjeta card)
Imprimir por pantalla ""
  	Imprimir por pantalla ""
  	Imprimir por pantalla "¿Desea continuar con operaciones?(si) o (no)"
  	Imprimir por pantalla ""
  	String continuacion= Escanear valor String por pantalla

  	Si (continuacion=="S\n" ) o (continuacion=="s\n")
    		Opciones(lista,card)
  	Sino
    		Imprimir por pantalla "Fin de las operaciones"
    		Imprimir por pantalla ""
  	Fin si
FIN FUNCIÓN NuevaOp
	INICIO MAIN(List lista)
		Imprimir por pantalla ""
 		Imprimir por pantalla "Ingrese su numero de tarjeta: "
		Int numTarjeta= Escanear valor Integer por pantalla
		Tarjeta card=Buscar_Tarjeta(lista,numTarjeta)
		Si card=nulo Entonces
			MAIN(lista)
		Fin Si
		Opciones(lista, card)
	FIN MAIN
FIN

=end