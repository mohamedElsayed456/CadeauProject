import 'dart:convert';
import 'package:demo_project/models/occasion_model.dart';
import 'package:demo_project/services/occasion_service.dart';

class OccasionRepo {
  final occasionService = OccasionService();

  Future<List<OccasionsModel>?>occasion()async{
   
   final response = await occasionService.occasion();
    if (response.statusCode == 200) {

        final Map<String, dynamic> extractedData = json.decode(response.body);
        final occasionData = extractedData['data']['occasion_types'];

        final List<OccasionsModel> occasionType = OccasionsModel.occaisonType(occasionData);
     
        return occasionType;
        }
        else{
        return null;
       }
    }
}