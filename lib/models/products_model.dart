
class ProductsModel {
    int? id;
    String? name;
    double? price;
    double? priceAfterDiscount;
    String? image;
    int? masterVariantId;
    bool? productStatus;

      static List<ProductsModel> productList(dynamic extracteddata){
       final List<ProductsModel> productlist = [];
     
        for (var i in extracteddata) {
          productlist.add(ProductsModel.fromJson(i as Map<String, dynamic>));
        }
        return productlist;
      }

    ProductsModel({
         this.id,
         this.name,
         this.price,
         this.priceAfterDiscount,
         this.image,
         this.masterVariantId,
         this.productStatus,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        image: json["image"],
        masterVariantId: json["master_variant_id"],
        productStatus: json["product_status"],
    );

}