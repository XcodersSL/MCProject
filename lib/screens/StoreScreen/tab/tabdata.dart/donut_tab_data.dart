class DonutsOnSale {
  String? _id;
  String? _flavor;
  String? _price;
  String? _foodtypeId;
  String? _color;

  DonutsOnSale(
      {String? id,
      String? flavor,
      String? price,
      String? foodtypeId,
      String? color}) {
    if (id != null) {
      this._id = id;
    }
    if (flavor != null) {
      this._flavor = flavor;
    }
    if (price != null) {
      this._price = price;
    }
    if (foodtypeId != null) {
      this._foodtypeId = foodtypeId;
    }
    if (color != null) {
      this._color = color;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get flavor => _flavor;
  set flavor(String? flavor) => _flavor = flavor;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get foodtypeId => _foodtypeId;
  set foodtypeId(String? foodtypeId) => _foodtypeId = foodtypeId;
  String? get color => _color;
  set color(String? color) => _color = color;

  DonutsOnSale.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _flavor = json['flavor'];
    _price = json['price'];
    _foodtypeId = json['foodtypeId'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['flavor'] = this._flavor;
    data['price'] = this._price;
    data['foodtypeId'] = this._foodtypeId;
    data['color'] = this._color;
    return data;
  }
}
