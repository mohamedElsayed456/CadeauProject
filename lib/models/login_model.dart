class LoginModel {
  final int? id;
  String? userType;
  String? name;
  String? avatar;
  String? countryCode;
  String? phoneNumber;
  String? gender;

  //named constructor
  LoginModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phoneNumber = json['phone_number'],
        countryCode = json['country_code'],
        gender = json['gender'],
        avatar = json['avatar'];



  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "country_code": countryCode,
      "phone_number": phoneNumber,
      "avatar": avatar,
      "gender": gender,
    };
  }
}
