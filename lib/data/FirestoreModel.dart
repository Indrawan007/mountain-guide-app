
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreModel<T> {

   T fromFirestore(DocumentSnapshot<Map<String, dynamic>> snap, SnapshotOptions? options){
    throw UnimplementedError('Subclasses must implement fromFirestore');
  }

   Map<String, dynamic> toFirestore() {
     throw UnimplementedError('Subclasses must implement toFirestore');
   }
}