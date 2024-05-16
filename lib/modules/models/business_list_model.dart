class BusinessListModel {
  BusinessListModel({
    this.businesses,
    this.total,
    this.region,
  });

  BusinessListModel.fromJson(dynamic json) {
    if (json['businesses'] != null) {
      businesses = [];
      json['businesses'].forEach((v) {
        businesses?.add(Businesses.fromJson(v));
      });
    }
    total = json['total'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  List<Businesses>? businesses;
  int? total;
  Region? region;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (businesses != null) {
      map['businesses'] = businesses?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    if (region != null) {
      map['region'] = region?.toJson();
    }
    return map;
  }
}

class Region {
  Region({
    this.center,
  });

  Region.fromJson(dynamic json) {
    center = json['center'] != null ? Center.fromJson(json['center']) : null;
  }

  Center? center;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (center != null) {
      map['center'] = center?.toJson();
    }
    return map;
  }
}

class Center {
  Center({
    this.longitude,
    this.latitude,
  });

  Center.fromJson(dynamic json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  double? longitude;
  double? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }
}

class Businesses {
  Businesses({
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClosed,
    this.url,
    this.reviewCount,
    this.categories,
    this.rating,
    this.coordinates,
    this.transactions,
    this.price,
    this.location,
    this.phone,
    this.displayPhone,
    this.distance,
  });

  Businesses.fromJson(dynamic json) {
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    imageUrl = json['image_url'];
    isClosed = json['is_closed'];
    url = json['url'];
    reviewCount = json['review_count'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    rating = json['rating'];
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    transactions =
        json['transactions'] != null ? json['transactions'].cast<String>() : [];
    price = json['price'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    phone = json['phone'];
    displayPhone = json['display_phone'];
    distance = json['distance'];
  }

  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Categories>? categories;
  double? rating;
  Coordinates? coordinates;
  List<String>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;
  double? distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['alias'] = alias;
    map['name'] = name;
    map['image_url'] = imageUrl;
    map['is_closed'] = isClosed;
    map['url'] = url;
    map['review_count'] = reviewCount;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    map['rating'] = rating;
    if (coordinates != null) {
      map['coordinates'] = coordinates?.toJson();
    }
    map['transactions'] = transactions;
    map['price'] = price;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['phone'] = phone;
    map['display_phone'] = displayPhone;
    map['distance'] = distance;
    return map;
  }
}

class Location {
  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
  });

  Location.fromJson(dynamic json) {
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    city = json['city'];
    zipCode = json['zip_code'];
    country = json['country'];
    state = json['state'];
    displayAddress = json['display_address'] != null
        ? json['display_address'].cast<String>()
        : [];
  }

  String? address1;
  dynamic address2;
  String? address3;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address1'] = address1;
    map['address2'] = address2;
    map['address3'] = address3;
    map['city'] = city;
    map['zip_code'] = zipCode;
    map['country'] = country;
    map['state'] = state;
    map['display_address'] = displayAddress;
    return map;
  }
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  Coordinates.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}

class Categories {
  Categories({
    this.alias,
    this.title,
  });

  Categories.fromJson(dynamic json) {
    alias = json['alias'];
    title = json['title'];
  }

  String? alias;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alias'] = alias;
    map['title'] = title;
    return map;
  }
}
