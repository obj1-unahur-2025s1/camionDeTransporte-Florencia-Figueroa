object nightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
  var trasformacion = auto

  method trasformacion(nuevo){trasformacion = nuevo}
  method peso() = 800
  method peligrosidad() = trasformacion.peligrosidad()
}

object auto{
  method peligrosidad() = 15
}

object robot{
  method peligrosidad() = 30
}

object paqueteLadrilo {
  var ladrillos = 5

  method ladrillos(cantidad) {ladrillos = cantidad}
  method peso() = ladrillos * 2
  method peligrosidad() = 2
}

object arena {
  var peso = 10

  method peso(nuevo){peso = nuevo}
  method peso() = peso 
  method peligrosidad() = 1
}

object bateriaAntiaerea {
  var tieneMisiles = true

  method sacarMisiles(){
    tieneMisiles = !tieneMisiles
  }
  method cargarMisiles(){
    tieneMisiles = true
  }
  method peso(){
    if(tieneMisiles){
      return 300
    }else{
      return 200
    }
  }
  method peligrosidad(){
    if(tieneMisiles){
      return 100
    }else{
      return 0
    }
  }
}

object contenedor {
  const objetos = [arena]

  method agregar(unObjeto) {objetos.add(unObjeto)}
  method peso() = 100 + objetos.sum({o => o.peso()})
  method peligrosidad() {
    if(objetos.isEmpty()) 
      return 0 
    else 
      return (objetos.max({o => o.peligrosidad()}).peligrosidad())
  }
  
}

object residuosRadioactivos {
  var peso = 10

  method peso(nuevo) {peso = nuevo}
  method peso() = peso
  method peligrosidad() = 200
}

object embalaje {
  var objeto = null

  method objeto(nuevo){objeto = nuevo}
  method peso() = objeto.peso()
  method peligrosidad() = objeto.peligrosidad() / 2
}