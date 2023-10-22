class LoginModel{
  bool? status;
  String? message;
  userData? data;

  LoginModel.fromJson(Map<String,dynamic>json)
  {
     status=json['status'];
     message=json['message'];
     data=json['data'] != null? userData.fromJson(json['data']['user']):null;
  }
}

class userData{
  int? id;
  String? user_type;
  String? name;
  String? avatar;
  String? country_code;
  String? phone_number;
  String? gender;
  String? token;

  //named constructor
  userData.fromJson(Map<String,dynamic>json)
  {
     id=json['id'];
     name=json['name'];
     phone_number=json['phone_number'];
     country_code=json['country_code'];
     gender=json['gender'];
     avatar=json['avatar'];
     token=json['token'];
  }
}