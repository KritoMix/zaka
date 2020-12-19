import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';
import 'package:zaka/StateProgect/stateProgect.dart';
import 'ComponentHome/CaruselAuto.dart';
import 'ComponentHome/catalogProducts.dart';


class HomeList extends StatefulWidget 
{
	@override
  	MyHomeList createState() => MyHomeList();
}
 
class MyHomeList extends State<HomeList> 
{
  	@override
  	Widget build(BuildContext context)
	{ 
		final basketService = Injector.get<BasketService>();
		final progectService = Injector.get<ProgectService>();
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
		//final progectService = Injector.getAsReactive<ProgectService>(context: context);
		return Scaffold
		(	
			appBar: AppBar
			(	
				backgroundColor: Colors.yellow,
            	title: MaterialButton
				(						  
					child: Row
					(
						children: <Widget>
						[
							Text
							(	
								basketService.currentCity.name,
								style: TextStyle(fontSize: 22,),
								textAlign: TextAlign.left,
							),
							Icon(Icons.arrow_drop_down)
						],
					),
					textColor: Colors.white,
					color: Colors.blueAccent[900],
					splashColor: Colors.yellow[200],
					onPressed: () 
					{
						Navigator.pushNamed(context, '/setCity');
					} //_onButtonPressed(stateCategory)	
				),
				actions: <Widget>
				[
        			new	IconButton
					(	
          				icon: const Icon(Icons.add_alert),
          				tooltip: 'Show Snackbar',
        			),
        			new IconButton
					(
          				icon: const Icon(Icons.assignment_ind),
          				tooltip: 'Next page',
        			),
      			],
        	),
        	drawer: Drawer
			(
        		child: ListView
				(
          			padding: EdgeInsets.zero,
          			children: <Widget>
					[
            			UserAccountsDrawerHeader
						(
              				accountName: Text('Имя ',style: TextStyle(color: Colors.black)),
							accountEmail: Text('Ник или Личный номер',style: TextStyle(color: Colors.black),),
							currentAccountPicture: CircleAvatar
							(
                				radius: 40.0,
                				child: Icon(Icons.person,color: Colors.white,size: 35,),
                				backgroundColor: Colors.grey,
              				),
              				decoration: BoxDecoration
							(
               					color: Colors.yellow,
              				),
            			),
            			ListTile
						(
							
			  				title: Text('Об Услуге',style: TextStyle(color: Colors.black,fontSize: 15)),
			  				onTap: () 
							{	
								Navigator.pop(context);
			    				Navigator.pushNamed(context,'/aboutService');    
              				},
            			),
            			ListTile
						(
              				title: Text('Доставка и оплата',style: TextStyle(color: Colors.black,fontSize: 15)),
              				onTap: ()
							{
               					Navigator.pop(context);
			    				Navigator.pushNamed(context,'/payment');  
              				},
            			),
						ListTile
						(
              				title: Text('Контакты',style: TextStyle(color: Colors.black,fontSize: 15)),
              				onTap: ()
							{
               					Navigator.pop(context);
								Navigator.pushNamed(context,'/contacts');  
              				},
            			),
         			],
        		),
      		),
			backgroundColor: Colors.black54,
			body: 
					Container
					(	
    					child:
						ListView
						(	
  							children: <Widget>
							[	Stack
								(
									children: <Widget>
									[
										
										
										CaruselAuto(), 
										Container
										(
											margin: EdgeInsets.only(top: 40,left: 10,right: 10),
											child: Text
											(
												"МЫ ГОТОВИМ И ДОСТАВЛЯЕМ ЕДУ ДЛЯ ВАШЕГО ПРАЗДНИКА",
												style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
											),
											
										),
										Container
										(
											
											child: Container
										(
											margin: EdgeInsets.only(top: 100,left: 15,right: 15),
											child: Text
											(
												"Минимальная сумма заказа от 3000 руб.Предоплата 50%.Заказ будет готов через 48 часов.",
												style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
											),
											
										),
										)
									],

								),
                				
								for(int i = 0;i<progectService.stateProgect.categorys.length;i++)
								new CatalogToProduct(progectService.stateProgect.categorys[i]),
							]
						)
					)		 		
		);	
	}
}