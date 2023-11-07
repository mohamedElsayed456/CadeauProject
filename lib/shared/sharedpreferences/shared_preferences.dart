import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  Future<bool>saveuser(loginModel)async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();

    prefs.setInt('id',loginModel!.id!);
    prefs.setString('name', loginModel.name!);
    prefs.setString('country_code', loginModel.country_code!);
    prefs.setString('phone_number', loginModel.phone_number!);
    prefs.setString('user_type', loginModel.user_type!);
    prefs.setString('token', loginModel.token!);
    prefs.setString('gender', loginModel.gender!);

    // ignore: deprecated_member_use
    return prefs.commit();

  }
  
   void removeuser ()async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('country_code');
    prefs.remove('phone_number');
    prefs.remove('user_type');
    prefs.remove('token');
    prefs.remove('gender');
  
   }

   Future<String>getToken()async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;
    return token;

   }


}