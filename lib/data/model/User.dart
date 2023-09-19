class User {
  String? nama;
  String? alamat;
  String? nomor;
  String? email;
  String? password;
  String? confirmPassword;

  User(
      {this.nama, this.alamat, this.nomor, this.email, this.password, this.confirmPassword});

  User copyWith({
    String? nama,
    String? alamat,
    String? nomor,
    String? email,
    String? password,
    String? confirmPassword,
  }){
    return User(
      nama: nama?? this.nama,
      alamat: alamat?? this.alamat,
      nomor: nomor?? this.nomor,
      email: email?? this.email,
      password:  password?? this.password,
      confirmPassword:  confirmPassword?? this.confirmPassword
    );
  }
}