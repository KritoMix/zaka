class ProductM
{
	ProductM(
    int newId,
    int newCategoryId,
    String newName,
    int newPrice,
    List<String> newUrlImages,
    String newCategoryName,
    String newDescription,
    int newCount,
    int newWeight,
    String newRestrictedStart,
    String newRestrictedEnd,
    bool newVisibleDate,
    bool newEnabled)
	{
		id = newId;
		categoryId = newCategoryId;
		name = newName;
		price = newPrice;
		urlImages = newUrlImages;
		categoryName = newCategoryName;
		description = newDescription;
		count = newCount;
		weight = newWeight;
    restrictedStart = newRestrictedStart;
    restrictedEnd = newRestrictedEnd;
    visibleDate = newVisibleDate;
    enabled = newEnabled;
	}
	int productInbasket = 1;
  int countProduct = 1;
	int id;
	int categoryId;
	String name;
	int price;
	List<String> urlImages;
	String categoryName;
	String description;
	int count;
	int weight;
  String restrictedStart;
  String restrictedEnd;
  bool visibleDate;
  bool enabled;
}