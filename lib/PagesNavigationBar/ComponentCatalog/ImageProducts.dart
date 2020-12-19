import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Repository/Model/category.dart';
import 'package:zaka/StateProgect/stateBascet.dart';


class ImageProducts extends StatefulWidget 
{
	CategoryM categoryM;
	ImageProducts(CategoryM newCategoryM)
	{
		categoryM = newCategoryM;
	}

  	@override
 	ImageWidget createState() => ImageWidget(categoryM);
}

class ImageWidget extends State<ImageProducts>
{
	CategoryM categoryM;
	ImageWidget(CategoryM newCategoryM)
	{
		categoryM = newCategoryM;
	}
  	@override
  	Widget build(BuildContext context) 
	{
		final basketService = Injector.get<BasketService>();
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
    	return Scaffold
		(	
			backgroundColor: Colors.black54,
    
			body: ListView
			(	
				children: <Widget>
				[
					for(var i = 0;i<categoryM.products.length; i++)
					Card
					(
						elevation: 15.0,
						color: Colors.white10,
						child: Stack
						(
							children: <Widget>
							[
									Row
									(
										children: <Widget>
										[
											Flexible
											(
												child: InkWell
												(
													child: Container
													(   
													
														//margin: EdgeInsets.symmetric(horizontal: 1.0,vertical: 8.0),
														child: new Image.network(categoryM.products[i].urlImages[0]),
													),
													onTap: () 
													{  
														Navigator.pushNamed(context,'/nextPr',arguments: categoryM.products[i]);
													},
												),
												flex: 1, 
												fit: FlexFit.tight,	
											),	
											Flexible
											(
												child: Column
												(
													children: <Widget>
													[
													Container
													(   
														alignment: Alignment.topLeft,
														margin: EdgeInsets.only(top: 15,left: 10),
														child: Text
														(
															categoryM.products[i].name,
															textAlign: TextAlign.left,
															style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),
														)
													),
													Row
													(
														children: <Widget>
														[
															Container
															(   
																alignment: Alignment.topLeft,
																margin: EdgeInsets.only(top: 5,left: 7),
																
																child: Text
																(
																	" Цена: " + categoryM.products[i].price.toString() + " руб.",
																	textAlign: TextAlign.left,
																	style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16),
																)
															),
															Container
															(   
																margin: EdgeInsets.only(top: 8,left: 7),
																//margin: EdgeInsets.symmetric(horizontal: 2.0),
																child: Text
																(
																	categoryM.products[i].weight.toString() + " гр.",
																	textAlign: TextAlign.left,
																	style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white54,fontSize: 14),
																)
															),
														],
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
																								height: 35,
																								width: 35,
																								alignment: Alignment.center,
																								child: OutlineButton
																								(
																									
																									child: Text('-',style: TextStyle(fontSize: 17,color: Colors.yellow,fontWeight: FontWeight.bold),),
																									onPressed: () => setState(() 
																									{ 
																										if(categoryM.products[i].productInbasket!=0)
																										categoryM.products[i].productInbasket-=1;
																									
																									}),
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
																								width: 35,
																								height: 35,
																								alignment: Alignment.center,
																								decoration: BoxDecoration
																								(
																									border: Border.all(width: 1,color: Colors.white12)
																									
																										
																								
																								),
																								child: Text
																								(
																									categoryM.products[i].productInbasket.toString(),
																									//basketService.state.basket.products[i].countProduct.toString(),
																									style: TextStyle(color: Colors.white70,fontSize: 17,fontWeight: FontWeight.bold),
																								),
																								margin: EdgeInsets.only(right: 8,left: 8),
																							),
																							Container
																							(
																								height: 35,
																								width: 35,
																								alignment: Alignment.center,
																								child: OutlineButton
																								(
																									
																									child: Text('+',style: TextStyle(fontSize: 13,color: Colors.yellow,fontWeight: FontWeight.bold),),
																									onPressed: () => setState(() => categoryM.products[i].productInbasket+=1),
																								
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
																								margin: EdgeInsets.only(left: 5),
																								
																								child: OutlineButton
																								(
																									child: Container
																									(
																										alignment: Alignment.centerLeft,
																										//margin: EdgeInsets.only(right: 5),
																										child: Text(" В корзину",style: TextStyle(color: Colors.yellow,),)
																									),
																									onPressed: ()
																									{
																										basketService.setProduct(categoryM.products[i]);
																										//basketService.setState((state)=>state.setProduct(basketService.state.basket.products[i]));
																									},
																									splashColor: Colors.yellow[200],
																									borderSide: BorderSide
																									(
																										color: Colors.yellow, 
																										style: BorderStyle.solid, 
																										width: 0.9, 
																									), 
																								),
																							)
																							
																						],
																					),
																					
																				)
												
													
												],
											),
											flex: 2,
											)	
										],
									),
								
								Visibility
								(
									visible: categoryM.products[i].visibleDate,
									child: Container
									(
										margin: EdgeInsets.all(3),
										alignment: Alignment.bottomCenter,
										color: Colors.red,
										height: 40,
										child: Column
										(
											children: <Widget>
											[
												Text("Недоступно в заказах с выдачей с"),
												Text(categoryM.products[i].restrictedStart.toString()+" по "+ categoryM.products[i].restrictedEnd.toString())
											],
										)
									),
								),
								
								Visibility
								(
									visible: categoryM.products[i].enabled,
									child: Transform
									(
										alignment: Alignment.bottomCenter,
										transform: Matrix4.skewY(3.0),
										child: Container
										(
											
											alignment: Alignment.bottomCenter,
											height: 40,
											margin: EdgeInsets.only(left: 5, right:5, top: 30),
											
											color: Colors.red[400],
											child: Column
											(
												children: <Widget>
												[
													Text("Временно",style: TextStyle(fontSize: 15,color: Colors.white),),
													Text("Недоступен к заказу",style: TextStyle(fontSize: 15,color: Colors.white),)
												],
											)
										),	
									)
								),
								Visibility
								(
									visible: categoryM.products[i].enabled,
									child: Opacity
									(
										opacity: 0.3,
										child: Container(color: Colors.white,),
									),
								),
								
							],
						)
						,
					)
					
					
				],
			)
		);
  	}
}
