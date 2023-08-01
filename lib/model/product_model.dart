class Product {
  int? id;
  String? name;
  String? cover;
  String? desc;
  int? price;

  Product({this.id, this.name, this.cover, this.desc, this.price});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    desc = json['desc'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['cover'] = cover;
    map['desc'] = desc;
    map['price'] = price;
    return map;
  }
}
