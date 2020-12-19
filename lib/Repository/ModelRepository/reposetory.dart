
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/Repository/Model/category.dart';
import 'package:zaka/Services/Model/cities.dart';
import 'package:zaka/Services/RestApi/client.dart';



//Получаем Все города с минимальной ценой заказа

Future<List<City>> getCitiesM() async
{
  var cities = await getCities();
  return cities;
}

//Получаем Категории с продуктами и Ингредиентами
Future<List<CategoryM>> getCategoriesM() async
{
	var categoryes = await getCategories();
	var products = await getProducts();
	
	

	List<CategoryM> newCategories = new List<CategoryM>();
	
	categoryes.forEach
	(
		(category)
		{
			newCategories.add(new CategoryM(category.id,category.name));	
		}
	);
		
	List<ProductM> newProducts = new List<ProductM>();
		 
	products.forEach
	(
		(product)
		{	
			
			newProducts.add(new ProductM(
				product.id,
				product.categoryId,
				product.name,
				product.price,
				getAllUrlImages(product.image),
				"null",
				product.description,
				product.count,
				product.weight,
				product.restrictedStart,
				product.restrictedEnd,
				visibleController(product.restrictedStart,product.restrictedEnd),
				visibilityToEnabled(product.enabled)
				));	
		}
	);
	newProducts.forEach
	(
		(product)
		{
			newCategories.forEach
			(
				(category)
				{
					if(category.id == product.categoryId)
					{
						product.categoryName = category.name;
							
						category.products.add(product);
					}
				}
			);
		}
	);
	return newCategories;
}

//Получаем ссылки на Images
List<String> getAllUrlImages(String urls)
{	
	List<String> urlImages = new List<String>();
	RegExp exp = new RegExp(r"uploads([^'\.jpg])+");//"/uploads(a-я)jpg/"
	
  exp.allMatches(urls).forEach((key) => urlImages.add("https://zakajuka.ru/"+ urls.substring(key.start, key.end).toString()+"-400.jpg"));
  //urlImages[0] =	urlImages[0].replaceFirst(RegExp('200'), '400');
  return urlImages;
}

bool visibleController(String start, String end)
{
	bool check = false;

	if(start!=null && end!=null)
	{
		DateTime startData = DateTime.parse(start);
		DateTime endData = DateTime.parse(end);
		DateTime currentData = DateTime.now();
		if(startData.millisecondsSinceEpoch<currentData.millisecondsSinceEpoch &&
		endData.millisecondsSinceEpoch>currentData.millisecondsSinceEpoch)
		{
			check = true;
		}
	}
	return check;
}

bool visibilityToEnabled(int newEnabled)
{
	bool enabled = false;
	if(newEnabled == 1)
	{
		enabled = false;
	}
	else
	{
		enabled = true;
	}
	return enabled;
}
