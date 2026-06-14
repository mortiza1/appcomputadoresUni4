import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/computador.dart';

class ComputadorService {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('computadores');

  Future<void> create(Computador c) async {
    await ref.add(c.toMap());
  }

  Stream<List<Computador>> read() {
    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Computador.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }

  Future<void> update(Computador c) async {
    await ref.doc(c.id).update(c.toMap());
  }

  Future<void> delete(String id) async {
    await ref.doc(id).delete();
  }
}