object nightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos()= 1
    method consecuenciaDeCargar(){}
}

object bumblebee {
  var trasformacion = auto

  method trasformacion(nuevo){trasformacion = nuevo}
  method peso() = 800
  method peligrosidad() = trasformacion.peligrosidad()
  method bultos() = 2
  method consecuenciaDeCargar(){trasformacion = robot}

}

object auto{
  method peligrosidad() = 15
}

object robot{
  method peligrosidad() = 30
}

object paqueteLadrillo {
  var ladrillos = 5

  method ladrillos(cantidad) {ladrillos = cantidad}
  method peso() = ladrillos * 2
  method peligrosidad() = 2
  method bultos() = if(ladrillos <= 100) 1
                    else if (ladrillos.between(101, 300)) 2
                    else 3
  method consecuenciaDeCargar(){ladrillos = ladrillos + 12}
}

object arena {
  var peso = 10

  method peso(nuevo){peso = nuevo}
  method peso() = peso 
  method peligrosidad() = 1
  method bultos() = 1
  method consecuenciaDeCargar(){peso = 0.max(peso - 10)}
}

object bateriaAntiaerea {
  var tieneMisiles = true

  method sacarMisiles(){
    tieneMisiles = !tieneMisiles
  }
  method cargarMisiles(){
    tieneMisiles = true
  }
  method peso(){if(tieneMisiles) 300
                else 200
  }
  method peligrosidad(){if(tieneMisiles) 100
                        else 0
  }
  method bultos() = if(tieneMisiles) 2 else 1
  method consecuenciaDeCargar(){self.cargarMisiles()}
}

object contenedor {
  const objetos = []

  method agregar(unObjeto) {objetos.add(unObjeto)}
  method peso() = 100 + objetos.sum({o => o.peso()})
  method peligrosidad() {
    if(objetos.isEmpty())  0 
    else objetos.max({o => o.peligrosidad()}).peligrosidad()
  }
  method bultos() = 1 + objetos.sum({o => o.bultos()})
  method consecuenciaDeCargar(){
    objetos.forEach({o => o.consecuenciaDeCargar()})
  }
}

object residuosRadioactivos {
  var peso = 10

  method peso(nuevo) {peso = nuevo}
  method peso() = peso
  method peligrosidad() = 200
  method bultos() = 1
  method consecuenciaDeCargar(){peso = peso + 15}
}

object embalaje {
  var objeto = null

  method objeto(nuevo){objeto = nuevo}
  method peso() = objeto.peso()
  method peligrosidad() = objeto.peligrosidad() / 2
  method bultos() = 2
  method consecuenciaDeCargar(){}
}