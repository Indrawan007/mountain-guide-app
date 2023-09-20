import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? uid;
  String? nama;
  String? alamat;
  String? nomor;
  String? email;
  String? password;
  String? confirmPassword;

  User(
      {this.uid,
      this.nama,
      this.alamat,
      this.nomor,
      this.email,
      this.password,
      this.confirmPassword});

  factory User.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snap, SnapshotOptions? options) {
    var data = snap.data();
    return User(
      nama: data?['nama'],
      alamat: data?['alamat'],
      email: data?['email'],
      nomor: data?['nomor'],
      uid: data?['uid'],
    );
  }

  factory User.fromJson(QueryDocumentSnapshot? snapshot) {
    var data = snapshot;
    return User(
      nama: data?['nama'],
      alamat: data?['alamat'],
      email: data?['email'],
      nomor: data?['nomor'],
      uid: data?['uid'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nama != null) "nama": nama,
      if (alamat != null) "alamat": alamat,
      if (email != null) "email": email,
      if (nomor != null) "nomor": nomor,
      if (uid != null) "uid": uid,
    };
  }

  User copyWith({
    String? uid,
    String? nama,
    String? alamat,
    String? nomor,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return User(
        uid: uid ?? this.uid,
        nama: nama ?? this.nama,
        alamat: alamat ?? this.alamat,
        nomor: nomor ?? this.nomor,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "User({uid = $uid, nama = $nama, alamat = $alamat, nomor = $nomor, email = $email, password = $password, confirmPassword = $confirmPassword})";
  }
}
