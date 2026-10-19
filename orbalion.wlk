

class Equipos {
    var nombre
    var nivelDeEnergiaBase
    var entrenador
    const tecnologiasComplementarias = []

    method agregarTecnologiaComplementaria(unaTecnologia) {
        tecnologiasComplementarias.add(unaTecnologia)
    }
    method energiaTotal() {
        return nivelDeEnergiaBase +
            tecnologiasComplementarias
                .filter({ tecnologia => tecnologia.estaActiva() })
                .sum({ tecnologia => tecnologia.valorEnergetico() })
    }
}
class Luminico inherits Equipos {
    var nivelDeRadiacion = 0
    const cristalesSolares = []

    method nivelDeRadiacion() {
        return nivelDeRadiacion
    }

    method agregarCristalSolar(unCristal) {
        cristalesSolares.add(unCristal)
    }
}
class Sintetico inherits Equipos {
    var nivelDeProcesamiento = 0
    var cantModulosActivos = 0
    var certificado = true

    method certificarComoUnidadEstable() {
        certificado = true
    }

    method noCertificarComoUnidadEstable() {
        certificado = false
    }
}
class Eterico inherits Equipos {
    var nivelDeFluctuacion = 0
    var cantDePortales = 0
}

//-------------Entrenadores------------//

class Entrenador {
    var cantCiclosSolares = 0
    var estanEnSintonia = true
    var nivelDePrecision = 0
    var rol = estrategaCuantico

    method aumentarCantCiclosSolares() {
        cantCiclosSolares += 1
    }

    method sintonizarAlEquipo() {
        estanEnSintonia = true
    }

    method dessintonizarAlEquipo() {
        estanEnSintonia = false
    }

    method aumentarNivelDePrecision() {
        nivelDePrecision = (nivelDePrecision + 1).min(100)
    }

    method cambiarRol(nuevoRol) {
        if (nuevoRol == estrategaCuantico ||
            nuevoRol == arquitectoDeEnergia ||
            nuevoRol == guiaMental) {
            rol = nuevoRol
        } else {
            throw new Exception(message = "Rol no homologado por la FOZ")
        }
    }
}

object estrategaCuantico {
  
}
object arquitectoDeEnergia {
  
}
object guiaMental {
  
}
class Tecnologia {
    var nombre
    var valorEnergetico
    var activa

    method nombre() {
        return nombre
    }

    method valorEnergetico() {
        return valorEnergetico
    }

    method estaActiva() {
        return activa
    }

    method activar() {
        activa = true
    }

    method desactivar() {
        activa = false
    }
}