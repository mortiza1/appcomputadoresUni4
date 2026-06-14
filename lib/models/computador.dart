class Computador {
  String? id;
  String marca;
  String categoria;
  String marcaCpu;
  int velocidadCpu;
  String tecnologiaRam;
  int capacidadRam;
  String tecnologiaDisco;
  int capacidadDisco;
  int numPuertosUSB;
  int numPuertosHDMI;
  String marcaMonitor;
  double pulgadas;
  double precio;

  Computador({
    this.id,
    required this.marca,
    required this.categoria,
    required this.marcaCpu,
    required this.velocidadCpu,
    required this.tecnologiaRam,
    required this.capacidadRam,
    required this.tecnologiaDisco,
    required this.capacidadDisco,
    required this.numPuertosUSB,
    required this.numPuertosHDMI,
    required this.marcaMonitor,
    required this.pulgadas,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      "marca": marca,
      "categoria": categoria,
      "marcaCpu": marcaCpu,
      "velocidadCpu": velocidadCpu,
      "tecnologiaRam": tecnologiaRam,
      "capacidadRam": capacidadRam,
      "tecnologiaDisco": tecnologiaDisco,
      "capacidadDisco": capacidadDisco,
      "numPuertosUSB": numPuertosUSB,
      "numPuertosHDMI": numPuertosHDMI,
      "marcaMonitor": marcaMonitor,
      "pulgadas": pulgadas,
      "precio": precio,
    };
  }

  factory Computador.fromMap(String id, Map<String, dynamic> map) {
    return Computador(
      id: id,
      marca: map["marca"],
      categoria: map["categoria"],
      marcaCpu: map["marcaCpu"],
      velocidadCpu: map["velocidadCpu"],
      tecnologiaRam: map["tecnologiaRam"],
      capacidadRam: map["capacidadRam"],
      tecnologiaDisco: map["tecnologiaDisco"],
      capacidadDisco: map["capacidadDisco"],
      numPuertosUSB: map["numPuertosUSB"],
      numPuertosHDMI: map["numPuertosHDMI"],
      marcaMonitor: map["marcaMonitor"],
      pulgadas: map["pulgadas"],
      precio: map["precio"],
    );
  }
}
