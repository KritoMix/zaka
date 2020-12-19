import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zaka/BaseNavigator/baseNavigator.dart';
import 'package:zaka/CanfigureService/canfigureService.dart';
import 'package:zaka/StateProgect/stateBascet.dart';
import 'package:zaka/StateProgect/stateProgect.dart';
import 'PagesNavigationBar/homeList.dart';
import 'PagesNavigationBar/catalog.dart';
import 'PagesNavigationBar/basket.dart';
import 'PagesNavigationBar/geoShop.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Repository/Model/category.dart';
import 'Repository/ModelRepository/reposetory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget 
{

    @override
    Widget build(BuildContext context) 
    {
		
        return Injector
						(
							inject: 
							[
								Inject(() => BasketService()),
								Inject(()=> ProgectService()),
								//Inject(() => BaseNavigator()),
							
							],
							
							builder: (context)
							{	
								
								ConfigurApp configApp = new ConfigurApp();
								
								final basketService = Injector.get<BasketService>();
								final progectService = Injector.get<ProgectService>();
								//final ReactiveModel<BasketService> basketService = Injector.getAsReactive<BasketService>();
								//final ReactiveModel<ProgectService> progectService = Injector.getAsReactive<ProgectService>();
								//final basketService = Injector.getAsReactive<BasketService>(context: context);
								//final progectService = Injector.getAsReactive<ProgectService>(context: context);
								//basketService.setState((state)=>state.setSities( getCitiesM()));
								//Запросы в файл
								return FutureBuilder<ConfigurAppModel>
								(
									future: configApp.getConfigApp(),//getCategoriesM(),
									builder: (context, snapshot)
									{   
										if(snapshot.hasData)
										{
											//Добавляем города если запрос успешен
											progectService.setSities(snapshot.data.sities);
											//Добавляем категории с продуктами если запрос успешен
											progectService.setCategories(snapshot.data.categories);
											//Проверяем есть ли Город в кеше
											progectService.stateProgect.cities.forEach((val)
											{
												if(val.id == snapshot.data.idCity)
												basketService.setSity(val);
											});
											//Если города в кеше нет то вызываем панель ввода в город
											if(basketService.currentCity == null)
											{
												progectService.setStartRoot('/setCity');
											}

											return BaseNavigator();

										} else
										{
											return 
													Image.asset("images/juk1.png",fit: BoxFit.cover,);
												//Center(child: CircularProgressIndicator());,	
										} 
									}
								);
							}
						);			
	}
}

class MyStatefulWidget extends StatefulWidget 
{
	MyStatefulWidget({Key key}) : super(key: key);

  	@override
 	_MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> 
{
	
	static Future<List<CategoryM>> categories = getCategoriesM();
	int _selectedIndex = 0;
  
	void _onItemTapped(int index) 
	{
    	setState(() 
		{
      		_selectedIndex = index;
		});
  	}
	List<Widget> widgets = <Widget>[HomeList(),Catalog(),GeoShop(),Basket()];
 	
 

	@override
  	Widget build(BuildContext icontext)
	{	
		//int countProductIcon = 0;
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
		//countProductIcon = basketService.state.basket.countProducts;
		//basketService.setState((state)=>state.setSities( getCitiesM());
    	final basketService = Injector.get<BasketService>();
		final progectService = Injector.get<ProgectService>();
		return StateBuilder
		(
			models: [progectService],
			tag: 'Index1',
			builder: (context, _) 
			{
				return Scaffold
				(   
					backgroundColor: Colors.white38,
					bottomNavigationBar: CurvedNavigationBar
					(	
						height: 50,
						items: <Widget>
						[
							
							Icon(Icons.home),
							Icon(Icons.search),
							Icon(Icons.domain),
							Container
							(
								child: StateBuilder
										(
											models: [basketService],
											tag: 'set',
											builder: (context, _) 
											{
												return Stack
												(	
													alignment: AlignmentDirectional.center,
													children: <Widget>
													[   
														
														Icon(Icons.shopping_cart),
														//if( _selectedIndex != 3)
															Container
															(	
																padding: const EdgeInsets.only(left: 17,top: 17),
																child: 
																
																	CircleAvatar
																	(
																		backgroundColor: Colors.red,maxRadius: 9,
																		child: Text(basketService.basket.products.length.toString(),style: TextStyle(fontSize: 12,color: Colors.white),),
																	),
															)
													],
												);
											},
										),
										
														
							)
							//myWidget(countProductIcon)
							
						],
						index: progectService.stateProgect.selectedIndex,
						onTap: progectService.setIndex,//_onItemTapped,
						backgroundColor: Colors.black54,
					),
					body:  widgets.elementAt(progectService.stateProgect.selectedIndex)	
				);
			}
		);
	}
	Widget myWidget(int countProductIcon)
	{
	
		final basketService = Injector.getAsReactive<BasketService>(context: context);
			return Container
					(
						child: Stack
						(	alignment: AlignmentDirectional.center,
							children: <Widget>
							[
								Icon(Icons.shopping_cart),
								if( _selectedIndex != 3)
								 	Container
									(	
										padding: const EdgeInsets.only(left: 17,top: 17),
										child: 
										
											CircleAvatar
											(
												backgroundColor: Colors.red,maxRadius: 9,
												child: Text(basketService.state.basket.products.length.toString(),style: TextStyle(fontSize: 12,color: Colors.white),),
											),
									)
								
								
								
								
							],
						)
												
					);
		
	}

}






