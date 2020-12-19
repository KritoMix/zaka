

class Product {
  int id;
  String name;
  String description;
  int price;
  String image;
  String createdAt;
  String updatedAt;
  String slug;
  int categoryId;
  int count;
  int weight;
  int weightTypeId;
  int countTypeId;
  Null stickerId;
  int enabled;
  String restrictedStart;
  String restrictedEnd;
  Null seoTitle;
  Null seoDescription;
  Null seoKeywords;
  int departmentId;
  int retailPrice;
  int departmentPrice;
  String comment;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.categoryId,
      this.count,
      this.weight,
      this.weightTypeId,
      this.countTypeId,
      this.stickerId,
      this.enabled,
      this.restrictedStart,
      this.restrictedEnd,
      this.seoTitle,
      this.seoDescription,
      this.seoKeywords,
      this.departmentId,
      this.retailPrice,
      this.departmentPrice,
      this.comment});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    categoryId = json['category_id'];
    count = json['count'];
    weight = json['weight'];
    weightTypeId = json['weight_type_id'];
    countTypeId = json['count_type_id'];
    stickerId = json['sticker_id'];
    enabled = json['enabled'];
    restrictedStart = json['restricted_start'];
    restrictedEnd = json['restricted_end'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    departmentId = json['department_id'];
    retailPrice = json['retail_price'];
    departmentPrice = json['department_price'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['count'] = this.count;
    data['weight'] = this.weight;
    data['weight_type_id'] = this.weightTypeId;
    data['count_type_id'] = this.countTypeId;
    data['sticker_id'] = this.stickerId;
    data['enabled'] = this.enabled;
    data['restricted_start'] = this.restrictedStart;
    data['restricted_end'] = this.restrictedEnd;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['department_id'] = this.departmentId;
    data['retail_price'] = this.retailPrice;
    data['department_price'] = this.departmentPrice;
    data['comment'] = this.comment;
    return data;
  }
}