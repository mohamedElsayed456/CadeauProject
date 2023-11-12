class OccasionsModel {
   int? id;
   String? name;
   String? icon;
   String? banner;
   String? description; 

    OccasionsModel({
         this.id,
         this.name,
         this.icon,
         this.banner,
         this.description,
    });

  factory OccasionsModel.fromJson(Map<String, dynamic> json){ 
    return OccasionsModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        banner: json["banner"],
        description: json["description"],
    );
  }

   static List<OccasionsModel> occaisonType(dynamic extractedData){
    final List<OccasionsModel> list = [];
     
        for (var i in extractedData) {
          list.add(OccasionsModel.fromJson(i as Map<String, dynamic>));
        }
        return list;

      
  }
}

