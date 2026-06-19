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
      marca: map["marca"] ?? "",
      categoria: map["categoria"] ?? "",
      marcaCpu: map["marcaCpu"] ?? "",
      velocidadCpu: map["velocidadCpu"] ?? 0,
      tecnologiaRam: map["tecnologiaRam"] ?? "",
      capacidadRam: map["capacidadRam"] ?? 0,
      tecnologiaDisco: map["tecnologiaDisco"] ?? "",
      capacidadDisco: map["capacidadDisco"] ?? 0,
      numPuertosUSB: map["numPuertosUSB"] ?? 0,
      numPuertosHDMI: map["numPuertosHDMI"] ?? 0,
      marcaMonitor: map["marcaMonitor"] ?? "",
      pulgadas: (map["pulgadas"] ?? 0).toDouble(),
      precio: (map["precio"] ?? 0).toDouble(),
    );
  }
}

