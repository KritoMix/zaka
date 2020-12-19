

import 'package:zaka/Repository/Model/category.dart';
import 'package:zaka/Repository/ModelRepository/reposetory.dart';
import 'package:zaka/Services/Model/cities.dart';
import 'package:zaka/StateProgect/StateManager/stateManager.dart';

class ConfigurAppModel
{
	List<CategoryM> categories = new List<CategoryM>();
  	List<City> sities = new List<City>();
	int idCity;
}
class ConfigurApp
{
	Future<ConfigurAppModel> getConfigApp() async 
	{
		CustomCacheManager cache = new CustomCacheManager();
		ConfigurAppModel config = new ConfigurAppModel();
		//cacheManager.setFile("city", 1);
		config.categories = await getCategoriesM();
		config.sities = await  getCitiesM();
		config.idCity = await cache.getMyFile("cityId");
		return config;
	}
}