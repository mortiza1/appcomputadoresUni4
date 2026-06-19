import 'package:flutter/material.dart';
import '../models/computador.dart';
import '../services/computador_service.dart';

class ComputadoresPage extends StatefulWidget {
  const ComputadoresPage({super.key});

  @override
  State<ComputadoresPage> createState() => _ComputadoresPageState();
}

class _ComputadoresPageState extends State<ComputadoresPage> {
  final service = ComputadorService();

  void mostrarFormulario({Computador? c}) {
    final marca = TextEditingController(text: c?.marca ?? '');
    final categoria = TextEditingController(text: c?.categoria ?? '');
    final cpu = TextEditingController(text: c?.marcaCpu ?? '');
    final velocidad = TextEditingController(text: c?.velocidadCpu.toString() ?? '');
    final ram = TextEditingController(text: c?.capacidadRam.toString() ?? '');
    final disco = TextEditingController(text: c?.capacidadDisco.toString() ?? '');
    final usb = TextEditingController(text: c?.numPuertosUSB.toString() ?? '');
    final hdmi = TextEditingController(text: c?.numPuertosHDMI.toString() ?? '');
    final monitor = TextEditingController(text: c?.marcaMonitor ?? '');
    final pulgadas = TextEditingController(text: c?.pulgadas.toString() ?? '');
    final precio = TextEditingController(text: c?.precio.toString() ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(c == null ? "Agregar Computador" : "Editar Computador"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: marca, decoration: const InputDecoration(labelText: "Marca")),
              TextField(controller: categoria, decoration: const InputDecoration(labelText: "Categoria")),
              TextField(controller: cpu, decoration: const InputDecoration(labelText: "CPU")),
              TextField(controller: velocidad, decoration: const InputDecoration(labelText: "Velocidad CPU")),
              TextField(controller: ram, decoration: const InputDecoration(labelText: "RAM")),
              TextField(controller: disco, decoration: const InputDecoration(labelText: "Disco")),
              TextField(controller: usb, decoration: const InputDecoration(labelText: "USB")),
              TextField(controller: hdmi, decoration: const InputDecoration(labelText: "HDMI")),
              TextField(controller: monitor, decoration: const InputDecoration(labelText: "Monitor")),
              TextField(controller: pulgadas, decoration: const InputDecoration(labelText: "Pulgadas")),
              TextField(controller: precio, decoration: const InputDecoration(labelText: "Precio")),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final comp = Computador(
                  id: c?.id,
                  marca: marca.text,
                  categoria: categoria.text,
                  marcaCpu: cpu.text,
                  velocidadCpu: int.tryParse(velocidad.text) ?? 0,
                  tecnologiaRam: "DDR4",
                  capacidadRam: int.tryParse(ram.text) ?? 0,
                  tecnologiaDisco: "SSD",
                  capacidadDisco: int.tryParse(disco.text) ?? 0,
                  numPuertosUSB: int.tryParse(usb.text) ?? 0,
                  numPuertosHDMI: int.tryParse(hdmi.text) ?? 0,
                  marcaMonitor: monitor.text,
                  pulgadas: double.tryParse(pulgadas.text) ?? 0,
                  precio: double.tryParse(precio.text) ?? 0,
                );

                if (c == null) {
                  await service.create(comp);
                  } else {
                    await service.update(comp);
                    }

                if (!mounted) return;
                  Navigator.pop(context);

                 } catch (e) {
                  print("ERROR GUARDANDO: $e");
                  }   
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
      appBar: AppBar(
        title: const Text("CRUD Computadores"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => mostrarFormulario(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Computador>>(
        stream: service.read(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')
            );
        }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(),
            );
            
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final c = data[index];

              return Card(
                child: ListTile(
                  title: Text(c.marca),
                  subtitle: Text("CPU: ${c.marcaCpu} - \$${c.precio}"),
                  onTap: () => mostrarFormulario(c: c),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => service.delete(c.id!),
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