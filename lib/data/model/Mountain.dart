import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mountain_guide_app/data/FirestoreModel.dart';

/// nama : ""
/// ket : ""
/// lokasi : ""
/// tinggi : ""
/// image : ""

class Mountain implements FirestoreModel {
  Mountain({
    String? id,
    String? nama,
    String? ket,
    String? lokasi,
    String? tinggi,
    String? image,
  }) {
    _id = id;
    _nama = nama;
    _ket = ket;
    _lokasi = lokasi;
    _tinggi = tinggi;
    _image = image;
  }

  Mountain.fromJson(dynamic json) {
    _id = (json as QueryDocumentSnapshot).id;
    _nama = json['nama'];
    _ket = json['ket'];
    _lokasi = json['lokasi'];
    _tinggi = json['tinggi'];
    _image = json['image'];
  }

  String? _id;
  String? _nama;
  String? _ket;
  String? _lokasi;
  String? _tinggi;
  String? _image;

  Mountain copyWith({
    String? id,
    String? nama,
    String? ket,
    String? lokasi,
    String? tinggi,
    String? image,
  }) =>
      Mountain(
        id: id ?? _id,
        nama: nama ?? _nama,
        ket: ket ?? _ket,
        lokasi: lokasi ?? _lokasi,
        tinggi: tinggi ?? _tinggi,
        image: image ?? _image,
      );

  String? get id => _id;

  String? get nama => _nama;

  String? get ket => _ket;

  String? get lokasi => _lokasi;

  String? get tinggi => _tinggi;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    map['ket'] = _ket;
    map['lokasi'] = _lokasi;
    map['tinggi'] = _tinggi;
    map['image'] = _image;
    return map;
  }

  @override
  String toString() {
    return "Mountain(id : ${id}, nama : ${nama}, ket : ${ket}, lokasi : ${lokasi}, image : ${image}, tinggi : ${tinggi})";
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (nama != null) "nama": nama,
      if (ket != null) "ket": ket,
      if (lokasi != null) "lokasi": lokasi,
      if (image != null) "image": image,
      if (tinggi != null) "tinggi": tinggi,
    };
  }

  factory Mountain.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snap, SnapshotOptions? options) {
    var data = snap.data();
    return Mountain(
      id: data?['id'],
      nama: data?['nama'],
      ket: data?['ket'],
      image: data?['image'],
      tinggi: data?['tinggi'],
      lokasi: data?['lokasi'],
    );
  }

  @override
  fromFirestore(DocumentSnapshot<Map<String, dynamic>> snap, SnapshotOptions? options) {
    throw UnimplementedError();
  }
}
