import 'package:cloud_firestore/cloud_firestore.dart';

class Monitor {
  String? id;
  String marca;
  String modelo;
  double pulgadas;
  String tipoPanel;
  String resolucion;
  int frecuenciaHz;
  double precio;
  DateTime fechaRegistro;

  Monitor({
    this.id,
    required this.marca,
    required this.modelo,
    required this.pulgadas,
    required this.tipoPanel,
    required this.resolucion,
    required this.frecuenciaHz,
    required this.precio,
    required this.fechaRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      "marca": marca,
      "modelo": modelo,
      "pulgadas": pulgadas,
      "tipoPanel": tipoPanel,
      "resolucion": resolucion,
      "frecuenciaHz": frecuenciaHz,
      "precio": precio,
      "fechaRegistro": Timestamp.fromDate(fechaRegistro),    
      };
    }

  factory Monitor.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return Monitor(
      id: id,
      marca: map["marca"] ?? "",
      modelo: map["modelo"] ?? "",
      pulgadas: (map["pulgadas"] ?? 0).toDouble(),
      tipoPanel: map["tipoPanel"] ?? "",
      resolucion: map["resolucion"] ?? "",
      frecuenciaHz: (map["frecuenciaHz"] ?? 0),
      precio: (map["precio"] ?? 0).toDouble(),
      fechaRegistro: (map["fechaRegistro"]?.toDate() ?? DateTime.now()),
    );
  }
}