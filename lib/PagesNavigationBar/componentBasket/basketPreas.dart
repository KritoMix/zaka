import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/StateProgect/stateBascet.dart';



class BasketPrease extends StatefulWidget 
{
	ProductM product;
	BasketPrease(ProductM newProduct)
	{
		product = newProduct;
	}

  	@override
 	MyBasketPrease createState() => MyBasketPrease(product);
}


class MyBasketPrease extends State<BasketPrease>
{	
	
	ProductM product;
	MyBasketPrease(ProductM newProduct)
	{
		product = newProduct;
	}

	@override
  	Widget build(BuildContext context) 
	{	
		final basketService = Injector.get<BasketService>();
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
    											return Container
												( 
													margin: EdgeInsets.all(5),
													child: Row
													(
														children: <Widget>
														[
															Flexible
															(	
																child: Image.network(product.urlImages[0]),
																flex: 1,
															
															),
															Flexible
															(	
																child: Column
																(
																	children: <Widget>
																	[	
																		Container
																		(
																			
																			child: Text(product.name,style: TextStyle(color: Colors.white,fontSize: 16,),),
																			margin: EdgeInsets.only(left: 5),
																			alignment: Alignment.bottomLeft,
																		),
																	
																		Container
																		(
																			
																			margin: EdgeInsets.only(left: 5),
																			child: Text("Цена:" + product.price.toString()+" руб.",style: TextStyle(color: Colors.white,fontSize: 18),),
																			alignment: Alignment.bottomLeft,
																		),
																		
																		Container
																		(   
																			alignment: Alignment.bottomLeft,
																			margin: EdgeInsets.only(left: 10),
																			child: Row
																			(
																				children: <Widget>
																				[	
																					Container
																					(
																						width: 40,
																						child: OutlineButton
																						(
																							
																							child: Text('-',style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.bold),),
																							onPressed: ()
																							{
																								setState(() 
																								{
																								 	product.productInbasket = 1;
																									basketService.removeProduct(product);
																								});
																								
																							}, 
																							splashColor: Colors.yellow[200],
																							borderSide: BorderSide
																							(
																								color: Colors.yellow, 
																								style: BorderStyle.solid, 
																								width: 0.9, 
																							),
																						)
																					),
																					
																					Container
																					(
																						child: Text
																						(
																							product.countProduct.toString(),
																							style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
																						),
																						margin: EdgeInsets.only(right: 8,left: 8),
																					),
																					Container
																					(
																						width: 40,
																						child: OutlineButton
																						(
																							
																							child: Text('+',style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.bold),),
																							onPressed: ()
																							{
																								product.productInbasket = 1;
																								basketService.setProduct(product);
																							}, 
																							splashColor: Colors.yellow[200],
																							borderSide: BorderSide
																							(
																								color: Colors.yellow, 
																								style: BorderStyle.solid, 
																								width: 0.9, 
																							),
																						)
																					),
																				],
																			),
																			
																		)
																	],
																),
																flex: 2,
															)
														],
													),
												);
	}
}	