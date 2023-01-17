class UserModel {
  String? email;
  String? name;
  String? password;
  String? passwordConfirmation;
  String? token;

  UserModel({
    this.email,
    this.name,
    this.password,
    this.passwordConfirmation,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        name: json["name"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "token": token,
      };
}
