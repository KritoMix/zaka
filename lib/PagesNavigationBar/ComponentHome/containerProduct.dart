
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/StateProgect/stateBascet.dart';


class Product extends StatefulWidget 
{
	ProductM product;
	Product(ProductM newProduct)
	{
		product = newProduct;
	}

  	@override
 	ProductWidget createState() => ProductWidget(product);
}


class ProductWidget extends State<Product>
{	
	
	ProductM product;
	ProductWidget(ProductM newProduct)
	{
		product = newProduct;
	}

@override
  	Widget build(BuildContext context) 
	{	
		final basketService = Injector.get<BasketService>();
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
    	return Card
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
									margin: EdgeInsets.only(left: 5),
										//margin: EdgeInsets.symmetric(horizontal: 1.0,vertical: 8.0),
										child: new Image.network(product.urlImages[0]),
									),

									
									onTap: () 
									{  
									Navigator.pushNamed(context,'/nextPr',arguments: product);
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
										margin: EdgeInsets.only(top: 5,left: 10),
										child: Text
										(
											product.name,
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
													" Цена: " + product.price.toString() + " руб.",
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
													product.weight.toString() + " гр.",
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
																						if(product.productInbasket!=0)
																						product.productInbasket-=1;
																					
																					}),
																					
																						//basketService.setState((state)=>state.removeProduct(basketService.state.basket.products[i]));
																					
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
																				width: 40,
																				height: 40,
																				alignment: Alignment.center,
																				decoration: BoxDecoration
																				(
																					border: Border.all(width: 1,color: Colors.white12)
																					
																						
																				
																				),
																				child: Text
																				(
																					product.productInbasket.toString(),
																					//basketService.state.basket.products[i].countProduct.toString(),
																					style: TextStyle(color: Colors.white70,fontSize: 17,fontWeight: FontWeight.bold),
																				),
																				margin: EdgeInsets.only(right: 8,left: 8),
																			),
																			Container
																			(
																				height: 40,
																				width: 40,
																				alignment: Alignment.center,
																				child: OutlineButton
																				(
																					
																					child: Text('+',style: TextStyle(fontSize: 13,color: Colors.yellow,fontWeight: FontWeight.bold),),
																					onPressed: () => setState(() => product.productInbasket+=1),
																					
																						//basketService.setState((state)=>state.setProduct(basketService.state.basket.products[i]));
																					
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
																				margin: EdgeInsets.only(left: 10),
																				width: 60,
																				child: OutlineButton
																				(
																					child: Container
																					(
																						
																						alignment: Alignment.center,
																						//margin: EdgeInsets.only(right: 5),
																						child: Icon(Icons.shopping_basket,color: Colors.yellow,)//Text("В корзину",style: TextStyle(color: Colors.yellow,),)
																					),
																					onPressed: ()
																					{
																						basketService.setProduct(product);
                                            
																					},
																					splashColor: Colors.yellow[200],
																					borderSide: BorderSide
																					(
																						color: Colors.yellow, 
																						style: BorderStyle.solid, 
																						width: 0.9, 
																					), 
																				),
																			),
																			
																		],
																	),
																	
																)
									
									
								],
							),
							flex: 2,
							),
							
						],
					),
					Visibility
					(
						visible: product.visibleDate,
						child: Container
						(
							margin: EdgeInsets.all(10),
							alignment: Alignment.bottomCenter,
							color: Colors.red[200],
							height: 40,
							child: Column
							(
								children: <Widget>
								[
									Text("Недоступно в заказах с выдачей с"),
									Text(product.restrictedStart.toString()+" по "+ product.restrictedEnd.toString())
								],
							)
						),
					),
					Visibility
					(
						visible: product.enabled,
						child: Opacity
						(
							opacity: 0.3,
							child: Container(color: Colors.black,),
						),
					),
					Visibility
					(
						visible: product.enabled,
						child: Transform
						(
							alignment: Alignment.bottomCenter,
							transform: Matrix4.skewY(3.0),
							child: Container
							(
								
								alignment: Alignment.bottomCenter,
								 height: 50,
								margin: EdgeInsets.only(left: 5, right:5, top: 30),
								
								color: Colors.red[400],
								child: Column
								(
									children: <Widget>
									[
										Text("Временно",style: TextStyle(fontSize: 17,color: Colors.white),),
										Text("Недоступен к заказу",style: TextStyle(fontSize: 17,color: Colors.white),)
									],
								)
							),	
						)
					),
				],
			)	
		);
	}
}