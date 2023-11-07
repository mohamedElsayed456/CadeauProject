// To parse this JSON data, do
//
//     final productsdetails = productsdetailsFromJson(jsonString);

import 'dart:convert';

ProductsdetailsModel productsdetailsFromJson(String str) => ProductsdetailsModel.fromJson(json.decode(str));

String productsdetailsToJson(ProductsdetailsModel data) => json.encode(data.toJson());

class ProductsdetailsModel {
    String message;
    Data data;

    ProductsdetailsModel({
        required this.message,
        required this.data,
    });

    factory ProductsdetailsModel.fromJson(Map<String, dynamic> json) => ProductsdetailsModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson()=>{
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    DataProduct? product;

    Data({
         this.product,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: json["product"]!=null? DataProduct.fromJson(json["product"]):null,
    );

    Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
    };
}

class DataProduct {
    int id;
    String? name;
    String? status;
    double? price;
    double? priceAfterDiscount;
    Currency currency;
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
    List<Media> media;
    Store store;
    List<OptionType> optionTypes;
    List<OccasionType> occasionTypes;
    bool? isFavouritedByCurrentUser;
    ProductIsWishedByCurrentUser isWishedByCurrentUser;
    List<Variant> variants;
    String categoryNames;
    List<Category> categories;
    DateTime createdAt;
    DateTime updatedAt;

    DataProduct({
        required this.id,
        required this.name,
        required this.status,
        required this.price,
        required this.priceAfterDiscount,
        required this.currency,
        required this.isVisible,
        required this.isWrappable,
        required this.inStock,
        required this.avgRate,
        required this.reviewsCount,
        required this.dynamicLink,
        required this.targetAge,
        required this.targetGender,
        required this.defaultVariantId,
        required this.image,
        required this.thumbnail,
        required this.masterVariantId,
        required this.approvalStatus,
        required this.productStatus,
        required this.totalOnHand,
        required this.description,
        required this.media,
        required this.store,
        required this.optionTypes,
        required this.occasionTypes,
        required this.isFavouritedByCurrentUser,
        required this.isWishedByCurrentUser,
        required this.variants,
        required this.categoryNames,
        required this.categories,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        currency: Currency.fromJson(json["currency"]),
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
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        store: Store.fromJson(json["store"]),
        optionTypes: List<OptionType>.from(json["option_types"].map((x) => OptionType.fromJson(x))),
        occasionTypes: List<OccasionType>.from(json["occasion_types"].map((x) => OccasionType.fromJson(x))),
        isFavouritedByCurrentUser: json["is_favourited_by_current_user"],
        isWishedByCurrentUser: ProductIsWishedByCurrentUser.fromJson(json["is_wished_by_current_user"]),
        variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
        categoryNames: json["category_names"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "price": price,
        "price_after_discount": priceAfterDiscount,
        "currency": currency.toJson(),
        "is_visible": isVisible,
        "is_wrappable": isWrappable,
        "in_stock?": inStock,
        "avg_rate": avgRate,
        "reviews_count": reviewsCount,
        "dynamic_link": dynamicLink,
        "target_age": targetAge,
        "target_gender": targetGender,
        "default_variant_id": defaultVariantId,
        "image": image,
        "thumbnail": thumbnail,
        "master_variant_id": masterVariantId,
        "approval_status": approvalStatus,
        "product_status": productStatus,
        "total_on_hand": totalOnHand,
        "description": description,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "store": store.toJson(),
        "option_types": List<dynamic>.from(optionTypes.map((x) => x.toJson())),
        "occasion_types": List<dynamic>.from(occasionTypes.map((x) => x.toJson())),
        "is_favourited_by_current_user": isFavouritedByCurrentUser,
        "is_wished_by_current_user": isWishedByCurrentUser.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "category_names": categoryNames,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Category {
    int? id;
    String? name;

    Category({
        required this.id,
        required this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Currency {
    int? id;
    LookupKey? name;
    LookupKey? lookupKey;

    Currency({
        required this.id,
        required this.name,
        required this.lookupKey,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: lookupKeyValues.map[json["name"]]!,
        lookupKey: lookupKeyValues.map[json["lookup_key"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": lookupKeyValues.reverse[name],
        "lookup_key": lookupKeyValues.reverse[lookupKey],
    };
}

enum LookupKey {
    // ignore: constant_identifier_names
    SAR
}

final lookupKeyValues = EnumValues({
    "SAR": LookupKey.SAR
});

class ProductIsWishedByCurrentUser {
    bool? any;
    PurpleHadeeny hadeeny;
    PurpleOccasion occasion;

    ProductIsWishedByCurrentUser({
        required this.any,
        required this.hadeeny,
        required this.occasion,
    });

    factory ProductIsWishedByCurrentUser.fromJson(Map<String, dynamic> json) => ProductIsWishedByCurrentUser(
        any: json["any"],
        hadeeny: PurpleHadeeny.fromJson(json["hadeeny"]),
        occasion: PurpleOccasion.fromJson(json["occasion"]),
    );

    Map<String, dynamic> toJson() => {
        "any": any,
        "hadeeny": hadeeny.toJson(),
        "occasion": occasion.toJson(),
    };
}

class PurpleHadeeny {
    bool? isWished;
    List<dynamic> variantIds;

    PurpleHadeeny({
        required this.isWished,
        required this.variantIds,
    });

    factory PurpleHadeeny.fromJson(Map<String, dynamic> json) => PurpleHadeeny(
        isWished: json["is_wished"],
        variantIds: List<dynamic>.from(json["variant_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "is_wished": isWished,
        "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
    };
}

class PurpleOccasion {
    bool? isWished;
    List<int> variantIds;
    List<int> occasionIds;

    PurpleOccasion({
        required this.isWished,
        required this.variantIds,
        required this.occasionIds,
    });

    factory PurpleOccasion.fromJson(Map<String, dynamic> json) => PurpleOccasion(
        isWished: json["is_wished"],
        variantIds: List<int>.from(json["variant_ids"].map((x) => x)),
        occasionIds: List<int>.from(json["occasion_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "is_wished": isWished,
        "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
        "occasion_ids": List<dynamic>.from(occasionIds.map((x) => x)),
    };
}

class Media {
    int? id;
    String mediableType;
    int? mediableId;
    String? mediaType;
    String? fileName;
    String? url;
    String? mediaOption;

    Media({
        required this.id,
        required this.mediableType,
        required this.mediableId,
        required this.mediaType,
        required this.fileName,
        required this.url,
        required this.mediaOption,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        mediableType: json["mediable_type"],
        mediableId: json["mediable_id"],
        mediaType: json["media_type"],
        fileName: json["file_name"],
        url: json["url"],
        mediaOption: json["media_option"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mediable_type": mediableType,
        "mediable_id": mediableId,
        "media_type": mediaType,
        "file_name": fileName,
        "url": url,
        "media_option": mediaOption,
    };
}

class OccasionType {
    int? id;
    String? name;
    String? icon;
    String? banner;
    String? description;

    OccasionType({
        required this.id,
        required this.name,
        required this.icon,
        required this.banner,
        required this.description,
    });

    factory OccasionType.fromJson(Map<String, dynamic> json) => OccasionType(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        banner: json["banner"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "banner": banner,
        "description": description,
    };
}

class OptionType {
    int? id;
    String? name;
    List<OptionValue> optionValues;

    OptionType({
        required this.id,
        required this.name,
        required this.optionValues,
    });

    factory OptionType.fromJson(Map<String, dynamic> json) => OptionType(
        id: json["id"],
        name: json["name"],
        optionValues: List<OptionValue>.from(json["option_values"].map((x) => OptionValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "option_values": List<dynamic>.from(optionValues.map((x) => x.toJson())),
    };
}

class OptionValue {
    int? id;
    String? name;
    String? presentation;
    int? optionTypeId;

    OptionValue({
        required this.id,
        required this.name,
        required this.presentation,
        required this.optionTypeId,
    });

    factory OptionValue.fromJson(Map<String, dynamic> json) => OptionValue(
        id: json["id"],
        name: json["name"],
        presentation: json["presentation"],
        optionTypeId: json["option_type_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "presentation": presentation,
        "option_type_id": optionTypeId,
    };
}

class Store {
    int? id;
    Name? name;
    Details details;
    String? logo;
    String? tags;

    Store({
        required this.id,
        required this.name,
        required this.details,
        required this.logo,
        required this.tags,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        details: Details.fromJson(json["details"]),
        logo: json["logo"],
        tags: json["tags"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "details": details.toJson(),
        "logo": logo,
        "tags": tags,
    };
}

class Details {
    Status? status;
    Email? email;
    ProfileStatus? profileStatus;
    String? countryCode;
    String? phoneNumber;
    dynamic rejectionReason;
    bool? isVerified;

    Details({
        required this.status,
        required this.email,
        required this.profileStatus,
        required this.countryCode,
        required this.phoneNumber,
        required this.rejectionReason,
        required this.isVerified,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        status: statusValues.map[json["status"]]!,
        email: emailValues.map[json["email"]]!,
        profileStatus: profileStatusValues.map[json["profile_status"]]!,
        countryCode: json["country_code"],
        phoneNumber: json["phone_number"],
        rejectionReason: json["rejection_reason"],
        isVerified: json["is_verified"],
    );

    Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "email": emailValues.reverse[email],
        "profile_status": profileStatusValues.reverse[profileStatus],
        "country_code": countryCode,
        "phone_number": phoneNumber,
        "rejection_reason": rejectionReason,
        "is_verified": isVerified,
    };
}

enum Email {
    // ignore: constant_identifier_names
    NIKE_GMAIL_COM
}

final emailValues = EnumValues({
    "nike@gmail.com": Email.NIKE_GMAIL_COM
});

enum ProfileStatus {
    // ignore: constant_identifier_names
    APPROVED
}

final profileStatusValues = EnumValues({
    "approved": ProfileStatus.APPROVED
});

enum Status {
    // ignore: constant_identifier_names
    ACTIVE
}

final statusValues = EnumValues({
    "active": Status.ACTIVE
});

enum Name {
    // ignore: constant_identifier_names
    NIKE
}

final nameValues = EnumValues({
    "Nike": Name.NIKE
});

class Variant {
    int? id;
    String? name;
    int? productId;
    String? sku;
    String? status;
    bool? isMaster;
    int? price;
    int? priceAfterDiscount;
    double? weight;
    double? width;
    double? height;
    double? length;
    double? volume;
    Currency currency;
    String? targetAge;
    String? targetGender;
    int? position;
    String? image;
    Store store;
    bool? isFavouritedByCurrentUser;
    VariantIsWishedByCurrentUser isWishedByCurrentUser;
    List<Media> media;
    VariantProduct product;
    List<OptionValue> optionValues;
    List<CityVariant> cityVariant;

    Variant({
        required this.id,
        required this.name,
        required this.productId,
        required this.sku,
        required this.status,
        required this.isMaster,
        required this.price,
        required this.priceAfterDiscount,
        required this.weight,
        required this.width,
        required this.height,
        required this.length,
        required this.volume,
        required this.currency,
        required this.targetAge,
        required this.targetGender,
        required this.position,
        required this.image,
        required this.store,
        required this.isFavouritedByCurrentUser,
        required this.isWishedByCurrentUser,
        required this.media,
        required this.product,
        required this.optionValues,
        required this.cityVariant,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        sku: json["sku"],
        status: json["status"],
        isMaster: json["is_master"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        weight: json["weight"]?.toDouble(),
        width: json["width"],
        height: json["height"],
        length: json["length"],
        volume: json["volume"],
        currency: Currency.fromJson(json["currency"]),
        targetAge: json["target_age"],
        targetGender: json["target_gender"],
        position: json["position"],
        image: json["image"],
        store: Store.fromJson(json["store"]),
        isFavouritedByCurrentUser: json["is_favourited_by_current_user"],
        isWishedByCurrentUser: VariantIsWishedByCurrentUser.fromJson(json["is_wished_by_current_user"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        product: VariantProduct.fromJson(json["product"]),
        optionValues: List<OptionValue>.from(json["option_values"].map((x) => OptionValue.fromJson(x))),
        cityVariant: List<CityVariant>.from(json["city_variant"].map((x) => CityVariant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "sku": sku,
        "status": status,
        "is_master": isMaster,
        "price": price,
        "price_after_discount": priceAfterDiscount,
        "weight": weight,
        "width": width,
        "height": height,
        "length": length,
        "volume": volume,
        "currency": currency.toJson(),
        "target_age": targetAge,
        "target_gender": targetGender,
        "position": position,
        "image": image,
        "store": store.toJson(),
        "is_favourited_by_current_user": isFavouritedByCurrentUser,
        "is_wished_by_current_user": isWishedByCurrentUser.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "product": product.toJson(),
        "option_values": List<dynamic>.from(optionValues.map((x) => x.toJson())),
        "city_variant": List<dynamic>.from(cityVariant.map((x) => x.toJson())),
    };
}

class CityVariant {
    int? id;
    int? countOnHand;
    bool? trackInventory;
    bool? purchasable;
    City city;

    CityVariant({
        required this.id,
        required this.countOnHand,
        required this.trackInventory,
        required this.purchasable,
        required this.city,
    });

    factory CityVariant.fromJson(Map<String, dynamic> json) => CityVariant(
        id: json["id"],
        countOnHand: json["count_on_hand"],
        trackInventory: json["track_inventory"],
        purchasable: json["purchasable"],
        city: City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "count_on_hand": countOnHand,
        "track_inventory": trackInventory,
        "purchasable": purchasable,
        "city": city.toJson(),
    };
}

class City {
    int? id;
    String? name;
    String? lat;
    String? long;
    String? deliveryFees;
    bool? isFulfillmentCenter;
    int? fulfillmentCenterId;
    DateTime createdAt;
    DateTime updatedAt;

    City({
        required this.id,
        required this.name,
        required this.lat,
        required this.long,
        required this.deliveryFees,
        required this.isFulfillmentCenter,
        required this.fulfillmentCenterId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        lat: json["lat"],
        long: json["long"],
        deliveryFees: json["delivery_fees"],
        isFulfillmentCenter: json["is_fulfillment_center"],
        fulfillmentCenterId: json["fulfillment_center_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "long": long,
        "delivery_fees": deliveryFees,
        "is_fulfillment_center": isFulfillmentCenter,
        "fulfillment_center_id": fulfillmentCenterId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class VariantIsWishedByCurrentUser {
    bool? any;
    FluffyHadeeny hadeeny;
    FluffyOccasion occasion;

    VariantIsWishedByCurrentUser({
        required this.any,
        required this.hadeeny,
        required this.occasion,
    });

    factory VariantIsWishedByCurrentUser.fromJson(Map<String, dynamic> json) => VariantIsWishedByCurrentUser(
        any: json["any"],
        hadeeny: FluffyHadeeny.fromJson(json["hadeeny"]),
        occasion: FluffyOccasion.fromJson(json["occasion"]),
    );

    Map<String, dynamic> toJson() => {
        "any": any,
        "hadeeny": hadeeny.toJson(),
        "occasion": occasion.toJson(),
    };
}

class FluffyHadeeny {
    bool? isWished;

    FluffyHadeeny({
        required this.isWished,
    });

    factory FluffyHadeeny.fromJson(Map<String, dynamic> json) => FluffyHadeeny(
        isWished: json["is_wished"],
    );

    Map<String, dynamic> toJson() => {
        "is_wished": isWished,
    };
}

class FluffyOccasion {
    bool? isWished;
    List<int>? occasionIds;

    FluffyOccasion({
        required this.isWished,
        required this.occasionIds,
    });

    factory FluffyOccasion.fromJson(Map<String, dynamic> json) => FluffyOccasion(
        isWished: json["is_wished"],
        occasionIds: json["occasion_ids"] == null ? [] : List<int>.from(json["occasion_ids"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "is_wished": isWished,
        "occasion_ids": occasionIds == null ? [] : List<dynamic>.from(occasionIds!.map((x) => x)),
    };
}

class VariantProduct {
    int? id;
    String? name;
    String? status;
    double? price;
    double? priceAfterDiscount;
    Currency currency;
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
    Store store;

    VariantProduct({
        required this.id,
        required this.name,
        required this.status,
        required this.price,
        required this.priceAfterDiscount,
        required this.currency,
        required this.isVisible,
        required this.isWrappable,
        required this.inStock,
        required this.avgRate,
        required this.reviewsCount,
        required this.dynamicLink,
        required this.targetAge,
        required this.targetGender,
        required this.defaultVariantId,
        required this.image,
        required this.thumbnail,
        required this.masterVariantId,
        required this.approvalStatus,
        required this.productStatus,
        required this.store,
    });

    factory VariantProduct.fromJson(Map<String, dynamic> json) => VariantProduct(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        currency: Currency.fromJson(json["currency"]),
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
        store: Store.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "price": price,
        "price_after_discount": priceAfterDiscount,
        "currency": currency.toJson(),
        "is_visible": isVisible,
        "is_wrappable": isWrappable,
        "in_stock?": inStock,
        "avg_rate": avgRate,
        "reviews_count": reviewsCount,
        "dynamic_link": dynamicLink,
        "target_age": targetAge,
        "target_gender": targetGender,
        "default_variant_id": defaultVariantId,
        "image": image,
        "thumbnail": thumbnail,
        "master_variant_id": masterVariantId,
        "approval_status": approvalStatus,
        "product_status": productStatus,
        "store": store.toJson(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
