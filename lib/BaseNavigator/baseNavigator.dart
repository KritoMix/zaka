import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Drawer/aboutService.dart';
import 'package:zaka/Drawer/contacts.dart';
import 'package:zaka/Drawer/payment.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/bayOrder.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/citiesWijet.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/currentProduct.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/orderPanel.dart';
import 'package:zaka/PagesNavigationBar/ComponentCatalog/ImageProducts.dart';
import 'package:zaka/Repository/Model/category.dart';
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/StateProgect/stateProgect.dart';
import 'package:zaka/main.dart';




class BaseNavigator extends StatelessWidget 
{
	@override
    Widget build(BuildContext context) 
    {
		final progectService = Injector.get<ProgectService>();
		//final progectService = Injector.getAsReactive<ProgectService>(context: context);
		return MaterialApp
        		(    
					

            		initialRoute: progectService.stateProgect.startRoot,
            		routes:
            		{
                		'/':(BuildContext context) => MyStatefulWidget(),
               	 		'/aboutService':(BuildContext context) => AboutService(),
                		'/payment': (BuildContext context) => Payment(),
						'/nextOrder':(BuildContext context) => OrderPanel(),
						'/byOrder':(BuildContext context) => BayOrder(),
						'/setCity':(BuildContext context) => CitiesWiget(),
						'/contacts':(BuildContext context) => Contakts()
						//'/nextPr':(BuildContext context) => CurrentProduct(settings.arguments as String),
						//'/nextImageProducts':(BuildContext context) => ImageProducts()		
											
					},
					onGenerateRoute: (settingsRoot) 
					{
    					final argumentsRoote = settingsRoot.arguments;
    					
						switch (settingsRoot.name) 
						{
      						case '/nextPr':
        			 	
								if (argumentsRoote is ProductM) 
					 			{
          							return new MaterialPageRoute
									(
          								builder: (context) => new CurrentProduct(argumentsRoote)
									);
        						}
       		 					else 
								{
          							return new MaterialPageRoute
									(
          								builder: (context) => new CurrentProduct(new ProductM(0,0,"Нет Продукта",0,new List<String>(),"Категория","Описание",0,0,"null","null",false,false))
									);
        						}
      						break; 
							case '/nextImageProducts':
        			 	
								if (argumentsRoote is CategoryM) 
					 			{
          							return new MaterialPageRoute
									(
          								builder: (context) => new ImageProducts(argumentsRoote)
									);
        						}
       		 					else 
								{
          							return new MaterialPageRoute
									(
          								builder: (context) => new ImageProducts(new CategoryM(0,"нет категории"))
									);
        						}
      						break; 
							default:
        					return null;
    					}
  					},	
        		);
	}
}