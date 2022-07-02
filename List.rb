require './Node'
require './Tarjeta'

class List
  attr_accessor :L
    
  def initialize
    @L=nil        
  end
    
  def getL
    @L    
  end
    
  def addFirst(value)
    newNode=Node.new(value)
    if(@L!=nil)
      newNode.setNext(@L)
    end
    @L=newNode
  end
    
  def addLast(value)
    newNode=Node.new(value)
    if(@L==nil)
      addFirst(value)
    else
      ptr=@L
      while ptr.getNext != nil
        ptr=ptr.getNext
      end
      ptr.setNext(newNode)
      newNode.setNext(nil)
    end
  end
    
  def showElements
    ptr=@L
    while ptr != nil
      ptr.getValue.imprimir
      ptr=ptr.getNext
    end
  end

  def buscar(numT)
    ptr=@L
     while ptr!= nil #En este bucle se busca la tarjeta ingresada
      if (ptr.getValue.get_num==numT)
        break
      end
      ptr=ptr.getNext
    end
    #Aqui se verifica si existe la tarjeta
    if (ptr!=nil)  #retorna la tarjeta que ha sido buscada
      return ptr.getValue
    else #Se manda un mensaje de error
      puts "ERROR 404 CARD NOT FOUND" #A
      return nil
    end
  end

  def actualizar(card)
    ptr=@L
    while ptr!=nil
    #Aqui se reempleaza el elemento de la lista por la modificacion que se realizo
      if(ptr.getValue.get_num == card.get_num)
        ptr.setValue(card)
      end
      ptr=ptr.getNext
      
    end

  end

end

=begin
INICIO
	Importar Clase Node
	Importar Clase Tarjeta
INICIO CLASE LIST
		Node L
		Inicio Constructor()
			L=nulo
		Fin Constructor
		Inicio Getter getL()
			Retornar L
		Fin Getter getL
		Inicio Función addFirst(Tarjeta valor)
			Node NuevoNodo= Node.new(valor)
			Si L != nulo Entonces
				NuevoNodo.setNext(valor)
			Fin Si
			L=NuevoNodo
		Fin Función addFirst
		Inicio Función addLast(Tarjeta valor)
			Node NuevoNodo= Node.new(valor)
			Si L==nulo Entonces
				addFirst(Valor)
			Si no
				Node ptr=L
				Mientras ptr.getNext !=nulo
					ptr=ptr.getNext
				Fin Bucle
				ptr.setNext(NuevoNode)
				NuevoNodo.setNext(nulo)
			Fin Si
		Fin Función addLast
		Inicio Función showElements()
			Node ptr=L
			Mientras ptr!=nulo
				ptr.getValue.imprimir
				ptr=ptr.getNext	
			Fin bucle
		Fin Función showElements
		Inicio Función BuscarTarjeta(Int numTarjeta)
			Node ptr=L
			Mientras ptr!=nulo
				Si ptr.getValue.get_numeroTarjeta=numTarjeta Entonces
					Salir del Bucle
				Sino
					ptr=ptr.getNext
				Fin Si
			Fin Bucle
			Si ptr!=nulo Entonces
				Retornar ptr.getValue
			Sino
				Imprimir por pantalla “ERROR 404 CARD NOT FOUND”
				Retornar nulo
			Fin Si
		Fin Función BuscarTarjeta
		Inicio Función Actualizar(Tarjeta card)
			Node ptr=L
			Mientras ptr!=nulo
				Si ptr.getValue.get_num = card.get_num Entonces
					ptr.setValue(card)
				Fin Si
				ptr=ptr.getNext
			Fin Bucle
		Fin Función Actualizar
	FIN CLASE LIST
FIN
=end