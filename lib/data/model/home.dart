class HomeModel {
  Data? data;

  HomeModel({this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Home? home;
  List<Events>? events;
  Categories? categories;

  Data({this.home, this.events, this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    if (json['Events'] != null) {
      events = [];
      json['Events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    categories = json['categories'] != null
        ? Categories.fromJson(json['categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (events != null) {
      data['Events'] = events!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    return data;
  }
}

class Home {
  List<Slider>? slider;
  List<CategoryItem>? categories;

  Home({this.slider, this.categories});

  Home.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(CategoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  String? name;
  String? desc;
  String? imageUrl;

  Slider({this.name, this.desc, this.imageUrl});

  Slider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'desc': desc,
      'imageUrl': imageUrl,
    };
  }
}

class CategoryItem {
  String? name;
  String? imageUrl;

  CategoryItem({this.name, this.imageUrl});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}

class Events {
  String? name;
  String? imageUrl;
  List<Products>? products; // Changed from single object to a list

  Events({this.name, this.imageUrl, this.products});

  Events.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'imageUrl': imageUrl,
    };
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  C1? c1;
  C1? c2;
  Events? c3;
  Events? c4;
  Events? c5;
  Events? c6;

  Categories({this.c1, this.c2, this.c3, this.c4, this.c5, this.c6});

  Categories.fromJson(Map<String, dynamic> json) {
    c1 = json['c1'] != null ? C1.fromJson(json['c1']) : null;
    c2 = json['c2'] != null ? C1.fromJson(json['c2']) : null;
    c3 = json['c3'] != null ? Events.fromJson(json['c3']) : null;
    c4 = json['c4'] != null ? Events.fromJson(json['c4']) : null;
    c5 = json['c5'] != null ? Events.fromJson(json['c5']) : null;
    c6 = json['c6'] != null ? Events.fromJson(json['c6']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (c1 != null) data['c1'] = c1!.toJson();
    if (c2 != null) data['c2'] = c2!.toJson();
    if (c3 != null) data['c3'] = c3!.toJson();
    if (c4 != null) data['c4'] = c4!.toJson();
    if (c5 != null) data['c5'] = c5!.toJson();
    if (c6 != null) data['c6'] = c6!.toJson();
    return data;
  }
}

class C1 {
  String? name;
  String? imageUrl;
  List<Products>? products;

  C1({this.name, this.imageUrl, this.products});

  C1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'products': products?.map((v) => v.toJson()).toList(),
    };
  }
}

class Products {
  String? name;
  String? desc;
  String? imgUrl;
  String? review;
  String? price;
  String? weight;
  String? logo;

  Products(
      {this.name,
      this.desc,
      this.imgUrl,
      this.review,
      this.price,
      this.weight,
      this.logo});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    imgUrl = json['imgUrl'];
    review = json['review'];
    price = json['price'];
    weight = json['weight'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'desc': desc,
      'imgUrl': imgUrl,
      'review': review,
      'price': price,
      'weight': weight,
      'logo': logo,
    };
  }
}
