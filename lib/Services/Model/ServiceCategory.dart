

class Categori {
  int id;
  String name;
  Null description;
  String image;
  int sort;
  int hidden;
  String createdAt;
  String updatedAt;
  String slug;
  int enableMoreButton;
  Null seoTitle;
  Null seoDescription;
  Null seoKeywords;
  Null seoText;

  Categori(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.sort,
      this.hidden,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.enableMoreButton,
      this.seoTitle,
      this.seoDescription,
      this.seoKeywords,
      this.seoText});

  Categori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    sort = json['sort'];
    hidden = json['hidden'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    enableMoreButton = json['enable_more_button'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    seoText = json['seo_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['sort'] = this.sort;
    data['hidden'] = this.hidden;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['slug'] = this.slug;
    data['enable_more_button'] = this.enableMoreButton;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['seo_text'] = this.seoText;
    return data;
  }
}