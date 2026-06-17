import 'package:flutter/material.dart';
import '../models/monitor.dart';
import '../services/monitor_service.dart';

class MonitoresPage extends StatefulWidget {
  const MonitoresPage({super.key});

  @override
  State<MonitoresPage> createState() => _MonitoresPageState();
}

class _MonitoresPageState extends State<MonitoresPage> {
  final service = MonitorService();

  void form({Monitor? m}) {
    final marca = TextEditingController(text: m?.marca ?? '');
    final modelo = TextEditingController(text: m?.modelo ?? '');
    final tipoPanel = TextEditingController(text: m?.tipoPanel ?? '');
    final frecuenciaHz = TextEditingController(
      text: m?.frecuenciaHz.toString() ?? '',
    );
    final pulgadas = TextEditingController(text: m?.pulgadas.toString() ?? '');
    final resolucion = TextEditingController(text: m?.resolucion ?? '');
    final precio = TextEditingController(text: m?.precio.toString() ?? '');

    showDialog(
      context: context,
          builder: (_) => AlertDialog(
            title: Text(
              m == null ? "Agregar Monitor" : "Editar Monitor",
            ),
            content: SizedBox(
                width: 400,
                height: 450,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: marca,
                      decoration: const InputDecoration(
                        labelText: "Marca",
                      ),
                    ),
                    TextField(
                      controller: modelo,
                      decoration: const InputDecoration(
                        labelText: "Modelo",
                      ),
                    ),
                    TextField(
                      controller: pulgadas,
                      decoration: const InputDecoration(
                        labelText: "Pulgadas",
                      ),
                    ),
                    TextField(
                      controller: tipoPanel,
                      decoration: const InputDecoration(
                        labelText: "Tipo de Panel",
                      ),
                    ),
                    TextField(
                      controller: resolucion,
                      decoration: const InputDecoration(
                        labelText: "Resolución",
                      ),
                    ),
                    TextField(
                      controller: frecuenciaHz,
                      decoration: const InputDecoration(
                        labelText: "Frecuencia (Hz)",
                      ),
                    ),
                    TextField(
                      controller: precio,
                      decoration: const InputDecoration(
                        labelText: "Precio",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () async {
             final monitor = Monitor(
              id: m?.id,
              marca: marca.text,
              modelo: modelo.text,
              pulgadas: double.tryParse(pulgadas.text) ?? 0,
              tipoPanel: tipoPanel.text,
              resolucion: resolucion.text,
              frecuenciaHz: int.tryParse(frecuenciaHz.text) ?? 0,
              precio: double.tryParse(precio.text) ?? 0,
              fechaRegistro:
              m?.fechaRegistro ?? DateTime.now(),
              );

              if (m == null) {
                await service.create(monitor);
              } else {
                await service.update(monitor);
              }

              Navigator.pop(context);
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD Monitores")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => form(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Monitor>>(
        stream: service.read(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              final m = data[i];

              return Card(
                child: ListTile(
                  title: Text(m.marca),
                  subtitle: Text("${m.pulgadas}\" - ${m.resolucion} - \$${m.precio}"),
                  onTap: () => form(m: m),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => service.delete(m.id!),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}