class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullname,
    required this.phoneNo,
  });

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }
}
