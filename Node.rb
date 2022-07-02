class Node 
  attr_accessor :value
  def initialize(value)
    @value=value
    @next=nil
  end
    
  def getValue
    return @value
  end
    
  def setValue(value)
    @value=value
  end
    
  def getNext
    @next
  end
    
  def setNext(value)
    @next=value
  end
end

=begin
INICIO
	Importar Clase Tarjeta
	INICIO CLASE NODE
		Tarjeta value
		Node next
		Inicio Constructor(Tarjeta valor)
			value=valor
			next=nulo
Fin Constructor
Inicio Getter getValue()
	Retornar value
Fin Getter getValue 
Inicio Setter setValue(Tarjeta valor)
	value=valor
Fin Setter set Value
Inicio Getter getNext()
	Retornar next
Fin Getter getNext
Inicio Setter setNext(Node nodo)
	next=valor
Fin Setter setNext
	FIN CLASE NODE
FIN

=end