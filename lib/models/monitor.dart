class Monitor {
  String? id;
  String marca;
  double pulgadas;
  String resolucion;
  double precio;

  Monitor({
    this.id,
    required this.marca,
    required this.pulgadas,
    required this.resolucion,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      "marca": marca,
      "pulgadas": pulgadas,
      "resolucion": resolucion,
      "precio": precio,
    };
  }

  factory Monitor.fromMap(String id, Map<String, dynamic> map) {
    return Monitor(
      id: id,
      marca: map["marca"],
      pulgadas: map["pulgadas"],
      resolucion: map["resolucion"],
      precio: map["precio"],
    );
  }
}