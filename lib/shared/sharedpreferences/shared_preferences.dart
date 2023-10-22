import 'package:demo_project/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  Future<bool>saveuser(userData? userData)async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();

    prefs.setInt('id',userData!.id!);
    prefs.setString('name', userData.name!);
    prefs.setString('country_code', userData.country_code!);
    prefs.setString('phone_number', userData.phone_number!);
    prefs.setString('user_type', userData.user_type!);
    prefs.setString('token', userData.token!);
    prefs.setString('gender', userData.gender!);

    return prefs.commit();

  }

  //  Future<LoginModel>getUser()async{
  //   final SharedPreferences prefs =await SharedPreferences.getInstance();

  //   int? id = prefs.getInt('id');
  //   String? name =prefs.getString('name');
  //   String? country_code= prefs.getString('country_code');
  //   String? phone_number=prefs.getString('phone_number');
  //   String? user_type=prefs.getString('user_type');
  //   String? token=prefs.getString('token');
  //   String? gender=prefs.getString('gender');

  //   return LoginModel(
  //     id:id,
  //     name:name,
  //     country_code:country_code,
  //     phone_number:phone_number,
  //     user_type:user_type,
  //     token:token,
  //     gender:gender,
  //   );
    
  //  }
  
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