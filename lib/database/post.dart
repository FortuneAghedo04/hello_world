class Product{
  String? _user;
  int? _type;
  late List<ProductModel> _products;
  List<ProductModel> get product=>_products;
  Product({required user, required type, required product}){
    this._user= user;
    this._type=type;
    this._products=product;
  }
  Product.fromJson(Map<String, dynamic>json){
    _user=json['user'];
    _type=json['type'];
    if(json['product']!=null){
      _products=<ProductModel>[];
      json['product'].forEach((v){
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}
class ProductModel{
  int? id;
  String? name;
  String? description;
  int? price;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? typeId;
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.typeId});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }


}