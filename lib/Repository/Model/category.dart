import 'package:zaka/Repository/Model/product.dart';

class CategoryM
{
	CategoryM(int newId,String newName)
	{
		id = newId;
		name = newName;
		products = new List<ProductM>();
	}
	int id;
	String name;
	List<ProductM> products;
}