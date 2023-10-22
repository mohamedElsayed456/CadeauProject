// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

ProductsModel productsFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    String message;
    Data data;
    Extra extra;

    ProductsModel({
        required this.message,
        required this.data,
        required this.extra,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        extra: Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "extra": extra.toJson(),
    };
}

class Data {
    List<Product> products;

    Data({
        required this.products,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int? id;
    String name;
    AvailableStatusEnum status;
    int? price;
    int? priceAfterDiscount;
    Currency currency;
    bool? isVisible;
    bool? isWrappable;
    bool? inStock;
    int? avgRate;
    int? reviewsCount;
    dynamic dynamicLink;
    String? targetAge;
    String? targetGender;
    int? defaultVariantId;
    String image;
    int? masterVariantId;
    AvailableStatusEnum availableStatus;
    bool? productStatus;
    Store store;
    bool? isFavouritedByCurrentUser;
    IsWishedByCurrentUser isWishedByCurrentUser;

    Product({
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
        required this.masterVariantId,
        required this.availableStatus,
        required this.productStatus,
        required this.store,
        required this.isFavouritedByCurrentUser,
        required this.isWishedByCurrentUser,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        status: availableStatusEnumValues.map[json["status"]]!,
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
        masterVariantId: json["master_variant_id"],
        availableStatus: availableStatusEnumValues.map[json["available_status"]]!,
        productStatus: json["product_status"],
        store: Store.fromJson(json["store"]),
        isFavouritedByCurrentUser: json["is_favourited_by_current_user"],
        isWishedByCurrentUser: IsWishedByCurrentUser.fromJson(json["is_wished_by_current_user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": availableStatusEnumValues.reverse[status],
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
        "master_variant_id": masterVariantId,
        "available_status": availableStatusEnumValues.reverse[availableStatus],
        "product_status": productStatus,
        "store": store.toJson(),
        "is_favourited_by_current_user": isFavouritedByCurrentUser,
        "is_wished_by_current_user": isWishedByCurrentUser.toJson(),
    };
}

enum AvailableStatusEnum {
    AVAILABLE
}

final availableStatusEnumValues = EnumValues({
    "available": AvailableStatusEnum.AVAILABLE
});

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
    SAR
}

final lookupKeyValues = EnumValues({
    "SAR": LookupKey.SAR
});

class IsWishedByCurrentUser {
    bool? any;
    Hadeeny hadeeny;
    Occasion occasion;

    IsWishedByCurrentUser({
        required this.any,
        required this.hadeeny,
        required this.occasion,
    });

    factory IsWishedByCurrentUser.fromJson(Map<String, dynamic> json) => IsWishedByCurrentUser(
        any: json["any"],
        hadeeny: Hadeeny.fromJson(json["hadeeny"]),
        occasion: Occasion.fromJson(json["occasion"]),
    );

    Map<String, dynamic> toJson() => {
        "any": any,
        "hadeeny": hadeeny.toJson(),
        "occasion": occasion.toJson(),
    };
}

class Hadeeny {
    bool? isWished;
    List<int> variantIds;

    Hadeeny({
        required this.isWished,
        required this.variantIds,
    });

    factory Hadeeny.fromJson(Map<String, dynamic> json) => Hadeeny(
        isWished: json["is_wished"],
        variantIds: List<int>.from(json["variant_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "is_wished": isWished,
        "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
    };
}

class Occasion {
    bool? isWished;
    List<int> variantIds;
    List<int> occasionIds;

    Occasion({
        required this.isWished,
        required this.variantIds,
        required this.occasionIds,
    });

    factory Occasion.fromJson(Map<String, dynamic> json) => Occasion(
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
    DetailsStatus? status;
    Email? email;
    dynamic profileStatus;
    String? countryCode;
    String? phoneNumber;
    dynamic rejectionReason;

    Details({
        required this.status,
        required this.email,
        required this.profileStatus,
        required this.countryCode,
        required this.phoneNumber,
        required this.rejectionReason,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        status: detailsStatusValues.map[json["status"]]!,
        email: emailValues.map[json["email"]]!,
        profileStatus: json["profile_status"],
        countryCode: json["country_code"],
        phoneNumber: json["phone_number"],
        rejectionReason: json["rejection_reason"],
    );

    Map<String, dynamic> toJson() => {
        "status": detailsStatusValues.reverse[status],
        "email": emailValues.reverse[email],
        "profile_status": profileStatus,
        "country_code": countryCode,
        "phone_number": phoneNumber,
        "rejection_reason": rejectionReason,
    };
}

enum Email {
    EMPTY,
    NIKE_GMAIL_COM,
    WWW_TEST2165_GMAIL_COM
}

final emailValues = EnumValues({
    "": Email.EMPTY,
    "nike@gmail.com": Email.NIKE_GMAIL_COM,
    "www.test2165@gmail.com": Email.WWW_TEST2165_GMAIL_COM
});

enum DetailsStatus {
    ACTIVE
}

final detailsStatusValues = EnumValues({
    "active": DetailsStatus.ACTIVE
});

enum Name {
    H_M,
    M_M,
    NIKE
}

final nameValues = EnumValues({
    "H&M": Name.H_M,
    "M&M": Name.M_M,
    "Nike": Name.NIKE
});

class Extra {
    int? totalCount;
    int? pageNumber;
    int? pageSize;

    Extra({
        required this.totalCount,
        required this.pageNumber,
        required this.pageSize,
    });

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        totalCount: json["total_count"],
        pageNumber: json["page_number"],
        pageSize: json["page_size"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "page_number": pageNumber,
        "page_size": pageSize,
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
