import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Repository/Model/category.dart';
import 'package:zaka/Services/Model/cities.dart';

class StateProgect
{
	StateProgect()
	{
		startRoot ='/';
		cities = new List<City>();
		categorys = new List<CategoryM>();
    	selectedIndex = 0;
	}
	
  	int selectedIndex;
	String startRoot;
	List<City> cities;
	List<CategoryM> categorys;
}

class ProgectService extends StatesRebuilder
{
	StateProgect stateProgect = new StateProgect();

	setIndex(int newIndex)
	{
		stateProgect.selectedIndex = newIndex;
		rebuildStates(['Index1']);
	}

	setCategories(List<CategoryM> newCategorys)
	{
		stateProgect.categorys = newCategorys;
	}
	setStartRoot(String root)
	{
		stateProgect.startRoot = root;
	}
	setSities(List<City> newSities)
	{
		stateProgect.cities = newSities;
	}

}