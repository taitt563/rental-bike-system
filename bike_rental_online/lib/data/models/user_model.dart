class UserModel {
  final String id;
  final String name;
  final String password;
  final String email;
  final String phoneNumber;
  final String address;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'avatarUrl': avatarUrl,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      password: map['password'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      avatarUrl: map['avatarUrl'],
    );
  }
}
