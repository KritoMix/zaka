
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';




class Basket extends StatefulWidget 
{
	@override
  	MyBasket createState() => MyBasket();
}
 
class MyBasket extends State<Basket> 
{

	bool bascetVisibility = false;
	bool basketImage = false;
		/*
		void visibilityBasket(int sizeBasket)
		{
			setState(() 
			{
				if(sizeBasket==0)
				{
					bascetVisibility = false;
				}else
				{
					bascetVisibility = true;
				}
			});
		}*/
	@override
  	Widget build(BuildContext context) 
  	{
		final basketService = Injector.get<BasketService>();  
    	//final basketService = Injector.getAsReactive<BasketService>(context: context);
		//visibilityBasket(basketService.state.basket.countProducts);
		
		return Scaffold
		(	
			appBar: AppBar
			(
				title: Text("Корзина",style: TextStyle(color: Colors.white),),
				backgroundColor: Colors.yellow,
			),
			backgroundColor: Colors.black54,
		
			body: 
			StateBuilder
				(
					models: [basketService],
					tag: 'set',
					builder: (context, _) 
					{ 	
						if(basketService.basket.countProducts == 0)
						{
							bascetVisibility = false;
							basketImage = true;
						}else
						{
							bascetVisibility = true;
							basketImage = false;
						}
						return Stack
						(	
						children: <Widget>
						[	
				
					
								Container
								(
									margin: EdgeInsets.only(bottom: 80),
									child: ListView.builder
									(
										itemCount: basketService.basket.countProducts,
										itemBuilder: (context,index)
										{
											return Container
												( 
													margin: EdgeInsets.all(5),
													child: Row
													(
														children: <Widget>
														[
															Flexible
															(	
																child: Image.network(basketService.basket.products[index].urlImages[0]),
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
																			
																			child: Text(basketService.basket.products[index].name,style: TextStyle(color: Colors.white,fontSize: 16,),),
																			margin: EdgeInsets.only(left: 5),
																			alignment: Alignment.bottomLeft,
																		),
																	
																		Container
																		(
																			
																			margin: EdgeInsets.only(left: 5),
																			child: Text("Цена:" + basketService.basket.products[index].price.toString()+" руб.",style: TextStyle(color: Colors.white,fontSize: 18),),
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
								
																								 	basketService.basket.products[index].productInbasket = 1;
																									basketService.removeProduct(basketService.basket.products[index]);
																								
																								
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
																							basketService.basket.products[index].countProduct.toString(),
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
																								basketService.basket.products[index].productInbasket = 1;
																								basketService.setProduct(basketService.basket.products[index]);
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
										
									)		
								)
					
				,Visibility
				(
					visible: bascetVisibility,
					child: Column
					(
						mainAxisAlignment: MainAxisAlignment.end,
						children: <Widget>
						[
							Container
							(   						
								
								alignment: Alignment.bottomCenter,
								child: MaterialButton
								(	height: 50,
									minWidth: 1000,				  
									child: Text('Оформить заказ за '+basketService.basket.summ.toString()+" руб.",style: TextStyle(fontSize: 19),),
									textColor: Colors.black,
									color: Colors.yellow,
									splashColor: Colors.yellow[200],
									onPressed: ()
									{
										if(basketService.prepaymentController)
										{
											Navigator.pushNamed(context,'/nextOrder');
										}
										else
										{
											showGeneralDialog
											(
												barrierColor: Colors.black.withOpacity(0.5),
												transitionBuilder: (context, a1, a2, widget) {
												return Transform.scale(
													scale: a1.value,
													child: Opacity(
													opacity: a1.value,
													child: AlertDialog(
														shape: OutlineInputBorder(
															borderRadius: BorderRadius.circular(16.0)),
														title: Text("Минимальная сумма заказа от 3000 руб"),
														
													),
													),
												);
												},
												transitionDuration: Duration(milliseconds: 200),
												barrierDismissible: true,
												barrierLabel: '',
												context: context,
												pageBuilder: (context, animation1, animation2) {});
											
										}							
									},
								)
							),
							Container
							(   
								alignment: Alignment.bottomCenter,
								child: MaterialButton
								(	height: 50,
									minWidth: 1000,				  
									child: Text('Очистить корзину',style: TextStyle(fontSize: 19),),
									textColor: Colors.white,
									color: Colors.black87,
									splashColor: Colors.yellow[200],
									onPressed: ()
									{	
										basketService.allDelete();
										
										
									},
								)
							),	
						],
					),
				),
				Visibility
				(
					visible: basketImage,
					child: Container
					(
						child: Stack
						(
							children: <Widget>
							[
								Container
								(	alignment: Alignment.center,
									child: Image.asset("images/BasketNull.png"),
								)
								
							],
						)
					)
				)
			]
		);
	}
	)								
					
					
	);		
}

}