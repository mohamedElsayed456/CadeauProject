

class ProductsDetailsModel {
    int? id;
    String? name;
    String? status;
    double? price;
    double? priceAfterDiscount;
    bool? isVisible;
    bool? isWrappable;
    bool? inStock;
    double? avgRate;
    dynamic reviewsCount;
    dynamic dynamicLink;
    String? targetAge;
    String? targetGender;
    int? defaultVariantId;
    String? image;
    dynamic thumbnail;
    int? masterVariantId;
    String? approvalStatus;
    bool? productStatus;
    int? totalOnHand;
    String? description;
    bool? isFavouritedByCurrentUser;
    String? categoryNames;
    DateTime? createdAt;
    DateTime? updatedAt;

    ProductsDetailsModel({
         this.id,
         this.name,
         this.status,
         this.price,
         this.priceAfterDiscount,
         this.isVisible,
         this.isWrappable,
         this.inStock,
         this.avgRate,
         this.reviewsCount,
         this.dynamicLink,
         this.targetAge,
         this.targetGender,
         this.defaultVariantId,
         this.image,
         this.thumbnail,
         this.masterVariantId,
         this.approvalStatus,
         this.productStatus,
         this.totalOnHand,
         this.description,
         this.isFavouritedByCurrentUser,
         this.categoryNames,
         this.createdAt,
         this.updatedAt,
    });

    factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) => ProductsDetailsModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        isVisible: json["is_visible"],
        isWrappable: json["is_wrappable"],
        inStock: json["in_stock?"],
        avgRate: json["avg_rate"],
        reviewsCount: json["reviews_count"],
        dynamicLink: json["dynamic_link"],
        targetAge: json["target_age"],
        targetGender: json["target_gender"],
        defaultVariantId: json["default_variant_id"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        masterVariantId: json["master_variant_id"],
        approvalStatus: json["approval_status"],
        productStatus: json["product_status"],
        totalOnHand: json["total_on_hand"],
        description: json["description"],
        isFavouritedByCurrentUser: json["is_favourited_by_current_user"],
        categoryNames: json["category_names"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

}

