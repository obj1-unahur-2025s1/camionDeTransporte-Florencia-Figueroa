object camion {

    const peso = 1000
    const cosas = []
    const superanPeligrosidad =  []
    var nivelDePeligrosidad = 0 


    method cargar(algo){
        cosas.add(algo)
    }
    method descargar(algo){
        cosas.remove(algo)
    }
    method pesoTotal(){return peso + cosas.sum({p => p.peso()})}

    method esPesoParDeCosas() = cosas.all({p => p.peso().even()})

    method cosaQuePese(unPeso) = 
        cosas.any({c => c.peso() == unPeso})

    method controlDePeligrosidad(){
        nivelDePeligrosidad = cosas.first().peligrosidad()
        return nivelDePeligrosidad
    }
    method cosasQueSuperanElControl() = 
        cosas.filter({c => c.peligrosidad() >= nivelDePeligrosidad})

    method superanEnPeligrosidadA(unaCosa) = 
        superanPeligrosidad.addAll({cosas.filter({c => c.peligrosidad() >= unaCosa.peligrosidad()})})

    method estaExedidoDePeso() = self.pesoTotal() >= 2500

    method puedeCircular(nivelPeligrosidad) = 
        not self.estaExedidoDePeso() and cosas.all({c => c.peligrosidad() < nivelPeligrosidad})     

    method cosaConPesoEntre(unPeso, otroPeso) = 
        cosas.any({c => c.peso().between(unPeso, otroPeso)}) 

    method cosaConMayorPeso()= cosas.max({c => c.peso()})
}