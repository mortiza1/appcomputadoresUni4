import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/monitor.dart';

class MonitorService {
  final CollectionReference<Map<String, dynamic>> ref =
      FirebaseFirestore.instance.collection('monitores');

  Future<void> create(Monitor m) async {
    try {
      await ref.add(m.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Monitor>> read() {
    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Monitor.fromMap(
          doc.id,
          doc.data(),
        );
      }).toList();
    });
  }

  Future<void> update(Monitor m) async {
    try {
      await ref.doc(m.id).update(m.toMap());
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