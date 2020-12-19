import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Services/Model/cities.dart';
import 'package:zaka/StateProgect/StateManager/stateManager.dart';
import 'package:zaka/StateProgect/stateBascet.dart';
import 'package:zaka/StateProgect/stateProgect.dart';
class CitiesWiget extends StatefulWidget 
{
	@override
  	MyPageState createState() => MyPageState();
}
 
class MyPageState extends State<CitiesWiget> 
{
  	
  
  	@override
    Widget build(BuildContext context) 
    {
		CustomCacheManager cache = new CustomCacheManager();
		final basketService = Injector.get<BasketService>();
		final progectService = Injector.get<ProgectService>();
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
		//final progectService = Injector.getAsReactive<ProgectService>(context: context);
        return Scaffold
		(
			appBar: AppBar
			(//FlexibleSpaceBar
				
				automaticallyImplyLeading: false,
				backgroundColor: Colors.yellow,
				title: Text("Выберите город"),
			),
			body: Container
			(
				child: ListView
				(   
					children: <Widget>
					[
						for (City item in progectService.stateProgect.cities)
						Card
						(	
							elevation: 5.5,
							margin: EdgeInsets.all(10),
							child: InkWell
							(
								
								child: Container
								(
									padding: EdgeInsets.all(10),
									child: Text(item.name,style: TextStyle(fontSize: 19),),
								),
								
								onTap: ()
								{
									cache.setFile("cityId",item.id);
									basketService.setSity(item);
									progectService.setStartRoot('/');
									Navigator.pop(context);
									//Navigator.pushNamed(context,'/');
								},
							),
						)
						
					],
				),
			),
		);		
  	}
}