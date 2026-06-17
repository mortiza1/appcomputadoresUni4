import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/computador.dart';

class ComputadorService {
  final CollectionReference<Map<String, dynamic>> ref =
      FirebaseFirestore.instance.collection('computadores');

  Future<void> create(Computador c) async {
    try {
      await ref.add(c.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Computador>> read() {
    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Computador.fromMap(
          doc.id,
          doc.data(),
        );
      }).toList();
    });
  }

  Future<void> update(Computador c) async {
    try {
      await ref.doc(c.id).update(c.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await ref.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}