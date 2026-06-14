import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/monitor.dart';

class MonitorService {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('monitores');

  Future<void> create(Monitor m) async {
    await ref.add(m.toMap());
  }

  Stream<List<Monitor>> read() {
    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Monitor.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }

  Future<void> update(Monitor m) async {
    await ref.doc(m.id).update(m.toMap());
  }

  Future<void> delete(String id) async {
    await ref.doc(id).delete();
  }
}