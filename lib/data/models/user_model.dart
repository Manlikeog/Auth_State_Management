class UserModel {
  String? uid;
  String? email;
  String? address;
  String? name;
  int? phone;

  UserModel({this.uid, this.email, this.address, this.name, this.phone});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      address: map['address'],
      name: map['name'],
      phone: map['phone'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'address': address,
      'name': name,
      'phone': phone,
    };
  }
}
