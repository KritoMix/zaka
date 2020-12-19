
import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/StateProgect/stateBascet.dart';
import 'package:zaka/StateProgect/stateProgect.dart';

class CurrentProduct extends StatefulWidget 
{
	ProductM productM;
	CurrentProduct(ProductM newProduct)
	{
		productM = newProduct;
	}

  	@override
 	ProductWidget createState() => ProductWidget(productM);
}



class ProductWidget extends State<CurrentProduct> 
{
	ProductM productM; 		
	
	ProductWidget(ProductM newProductM)
  	{
		productM = newProductM;
  	}
  	
	@override
  	Widget build(BuildContext context) 
  	{
		final basketService = Injector.get<BasketService>();
		final pogectService = Injector.get<ProgectService>();
		//final basketService = Injector.getAsReactive<BasketService>(context: context);
    	return Scaffold
		(	
			
			backgroundColor: Colors.white12,
      		appBar: AppBar
      		(	
				backgroundColor: Colors.yellow,
				title: Text(productM.categoryName)
			),
			body: 
			Column
			(	
				children: <Widget>
				[
					Container
					(
						child: Flexible
						(	
							child: Carousel
							(	
								autoplay: false,
								dotSize: 6.1,
    							images:
								[ 	
									for(int n = 0;n<productM.urlImages.length;n++)
									Container
									(	
									  	decoration: BoxDecoration
									 	(
											image: DecorationImage
											(
												fit: BoxFit.fill,
												image: NetworkImage(productM.urlImages[n].replaceFirst(RegExp('400'), '2250')),
											),
									  	)
									),
    							],
            					boxFit: BoxFit.fill,
            					indicatorBgPadding: 4.5,
  							),
							flex: 1,
						),
					),
					
					Flexible
					(
						child: Card
						(
							elevation: 10.0,
							color: Colors.white10,
							child: Column
							(
								children: <Widget>
								[
									Container
									(	
										alignment: Alignment.centerLeft,
										padding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
										child:Text
										(	
											productM.name,
											style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20,)
										),
									),
									Container
									(	
										alignment: Alignment.centerLeft,
										padding: EdgeInsets.only(left: 15,bottom: 10),
										child:Text
										(	
											productM.description,
											style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15,)
										),
									),
									Container
									(	
										alignment: Alignment.bottomLeft,
										child: Wrap
										(
											direction: Axis.horizontal,
											children: <Widget>
											[
												Container
												(
													width: 180,
													padding: EdgeInsets.only(left: 15,),
													//alignment: Alignment.bottomLeft,
													child:Text
													(	
														'Цена: '+ productM.price.toString()+' руб.',
														//textAlign: TextAlign.right,
														style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow,fontSize: 22,)
													),
												),
												Container
												(
													width: 165,
													padding: EdgeInsets.only(left: 15,top: 5),
													alignment: Alignment.bottomLeft,
													child:Text
													(	
														'Колличество: '+ productM.count.toString() + " шт.",
														textAlign: TextAlign.right,
														style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15,)
													),
												),
												Container
												(
													width: 100,
													padding: EdgeInsets.only(left: 15,top: 6),
													alignment: Alignment.centerLeft,
													child:Text
													(	
														'Вес: '+ productM.weight.toString() + " гр.",
														textAlign: TextAlign.end,
														style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white38,fontSize: 14,)
													),
												),
												
											],
										)
									),
								],
							),
						),
						flex: 1,	
					),
					Stack
					(
						children: <Widget>
						[
							Container
                    									(   
                        									alignment: Alignment.topCenter,
                        									margin: EdgeInsets.only(left: 15),
         	 												child: Row
															(
																children: <Widget>
																[	
																	Container
																	(
																		height: 40,
																		width: 40,
																		alignment: Alignment.center,
																		child: OutlineButton
																		(
																			
																			child: Text('-',style: TextStyle(fontSize: 17,color: Colors.yellow,fontWeight: FontWeight.bold),),
																			
																			onPressed: () => setState(() 
																			{ 
																				if(productM.productInbasket!=0)
																				productM.productInbasket-=1;
																			
																			}),
																			
																				//basketService.setState((state)=>state.removeProduct(basketService.state.basket.products[i]));
																			
																			splashColor: Colors.yellow[200],
																			borderSide: new BorderSide
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
																			productM.productInbasket.toString(),
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
																			onPressed: () => setState(() => productM.productInbasket+=1),
																		
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
																		
																		child: OutlineButton
																		(
																			child: Container
																			(
																				
																				alignment: Alignment.center,
																				//margin: EdgeInsets.only(right: 5),
																				child: Row
																				(
																					children: <Widget>
																					[
																						 Icon(Icons.shopping_basket,color: Colors.yellow,),
																						 Text(" В корзину",style: TextStyle(color: Colors.yellow),)
																					],
																				),
																				// Icon(Icons.shopping_basket,color: Colors.yellow,)//Text("В корзину",style: TextStyle(color: Colors.yellow,),)
																			),
																			onPressed: ()
																			{
																				basketService.setProduct(productM);
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
																	Flexible
																	(
																		child:Container
																		(
																			margin: EdgeInsets.only(right: 25),
																			alignment: Alignment.centerRight,
																			child: StateBuilder
																			(
																				models: [basketService],
																				tag: 'set',
																				builder: (context, _) 
																				{
																					return  CircleAvatar
																					(
																						backgroundColor: Colors.white10,maxRadius: 20,
																						child: InkWell
																						(
																							borderRadius: BorderRadius.circular(15.15),
																							onTap: ()
																							{
																								Navigator.pop(context);
																								pogectService.setIndex(3);
																							},
																							
																							child: Stack
																							(	
																									alignment: AlignmentDirectional.center,
																									children: <Widget>
																									[
																										Icon(Icons.shopping_cart,color: Colors.white,),
																										Container
																										(	padding: const EdgeInsets.only(left: 17,top: 17),
																											child: CircleAvatar
																											(
																												backgroundColor: Colors.red,maxRadius: 9,
																												child: Text(basketService.basket.countProducts.toString(),style: TextStyle(fontSize: 12,color: Colors.white),),
																											),
																										)
																										
																									],
																							),
																						)
																					);	
																				}
																			)
																		),
																		 
																		flex: 1,
																	)	
																],
															),
                    									 	
														)
						],
					)

				],
			)
    	
		
		);
	}
}