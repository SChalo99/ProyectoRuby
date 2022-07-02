#Clase Tarjeta
class Tarjeta
  attr_accessor :nombre ,:num, :saldo, :tipo, :lineaCredito 
    #Metodo Constructor
  def initialize(nombre, num, saldo, tipo)
    @nombre=nombre
    @num = num
    @saldo = saldo #El saldo para caso de tarjeta de credito seria la deuda del usuario
    @tipo = tipo
  end
#Getters and Setters    
  def get_nombre
    return @nombre
  end  
  def get_num
    return @num
  end
  def get_saldo
    return @saldo
  end
  def get_tipo
    return @tipo
  end
  def get_lineaCredito
    return @lineaCredito
  end

  def set_nombre(nombre)
    @nombre=nombre
  end
  def set_num(numero)
    @num=numero
  end
  def set_saldo(saldo)
    @saldo=saldo
  end
  def set_tipo(tipo)
    @tipo=tipo
  end
  def set_lineaCredito(lineaCredito)
    @lineaCredito=lineaCredito
  end
  
  def imprimir

    if @tipo=="d"
      puts "#{@nombre},#{@num}, #{@saldo}, #{@tipo}"
    else
      puts "#{@nombre},#{@num}, #{@saldo}, #{@tipo}, #{@lineaCredito}" 
    end
  end

  def consultas
    puts "Nombre: #{@nombre}"
    puts "Numero de Tarjeta: #{@num}"
    
    if @tipo=='d'
      puts "Tipo de Tarjeta: Dedito" 
      puts "Saldo Disponible: #{@saldo}"
    end
    if @tipo=='c'
      puts "Tipo de Tarjeta: Credito" 
      puts "Deuda: #{@saldo}"
      puts "Linea de Credito: #{@lineaCredito}" 
    end
  end
  
end

=begin
  INICIO
	INICIO CLASE TARJETA
		String nombre
		Int numeroTarjeta
		Float saldo
		Char tipoTarjeta
		Float líneaCredito
		Inicio Constructor(String nom, Int num, Float sal, Chat Tipo)
			nombre=nom
			numeroTarjeta=num
			saldo=sal
			tipoTarjeta=tipo
		Fin Constructor
		Inicio Getter get_nombre()
			Retornar nombre
		Fin Getter get_nombre
		Inicio Getter get_numeroTarjeta()
			Retornar numeroTarjeta 	
		Fin Getter get_numeroTarjeta
		Inicio Getter get_saldo()
			Retornar saldo
		Fin Getter get_saldo
		Inicio Getter get_tipoTarjeta()
			Retornar tipoTarjeta
		Fin Getter get_tipoTarjeta
		Inicio Getter get_lineaCredito()
			Retornar lineaCredito
		Fin Getter get_lineaCredito

		Inicio Setter set_nombre(String nom)
			nombre=nom
		Fin Setter set_nombre
		Inicio Setter set_numeroTarjeta(Int num)
			numeroTarjera=num
		Fin Setter set_numeroTarjeta
		Inicio Setter set_saldo(Float sal)
			saldo=sal
		Fin Setter set_saldo
		Inicio Setter set_tipoTarjeta(Char tipo)
			tipoTarjeta=tipo
		Fin Setter set_tipoTarjeta
		Inicio Setter set_lineaCredito(Float lineaCred)
			lineaCredito= lineaCred
		Fin Setter set_lineaCredito
		
		Inicio Función imprimir()
			Si tipoTarjeta=’d’ Entonces
Imprimir por pantalla nombre+”,”+ numeroTarjeta+”,”+ saldo+”,”+ tipoTarjeta
			Sino
Imprimir por pantalla nombre+”,”+ numeroTarjeta+”,”+ saldo+”,”+ tipoTarjeta+”,”+lineaCredito 
			Fin Si
		Fin Función imprimir
		Inicio Función consultas()
			Imprimir por pantalla “Nombre: ”+nombre, 
Imprimir por pantalla “Numero de Tarjeta: ”+numeroTarjeta
Si tipoTarjeta=’d’ Entonces
	Imprimir por pantalla “Tipo de tarjeta: Debito” 
	Imprimir por pantalla “Saldo: ”+ saldo
			Sino 
Imprimir por pantalla “Tipo de tarjeta: Credito” 
				Imprimir por pantalla “Deuda: ”+ saldo
				Imprimir por pantalla “Linea de Credito: ”+ lineaCredito
			Fin Si	
		Fin Función consultas
	FIN CLASE TARJETA
FIN
=end