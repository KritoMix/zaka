
import 'dart:ui';
import 'package:flat_segmented_control/flat_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/ContactDataPicer.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/checkBox.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/checkBox1.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/contactComment.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/contactMail.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/contactNamber.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/contactName.dart';
import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/switchBox.dart';
import 'package:zaka/StateProgect/stateBascet.dart';
import 'package:zaka/StateProgect/stateProgect.dart';
import 'ComponentOrder/paymentOnline.dart';
import 'ComponentOrder/promocod.dart';



class OrderPanel extends StatefulWidget 
{
	@override
  	MyOrderPanel createState() => MyOrderPanel();
}
 
class MyOrderPanel extends State<OrderPanel> 
{	
	int index = 0;
	//bool isButtonDisabled = true;
	//bool isButtonDisabled = false;
		final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 		 bool _autoValidate = false;
	  	
  	@override
  	Widget build(BuildContext context)
	{ 
		final basketService = Injector.get<BasketService>();
		final progectService = Injector.get<ProgectService>();	
	
		return Scaffold
		(
			backgroundColor: Colors.white24,
			appBar: AppBar
      		(	
				backgroundColor: Colors.white24,
				title: Text
						(
							"Оформление заказа",
							style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
							textAlign: TextAlign.center
						),
			),
			
			body:StateBuilder
			(
					models: [basketService],
					tag: 'set',
					builder: (context, _) 
					{ 	
			
			return Form
			(
				key: _formKey,
              	autovalidate: _autoValidate,
				child: ListView
				(
					children: <Widget>
					[
						Container
						(
							margin: EdgeInsets.only(left: 15,top: 15),
							child: Text
							(
								"Мой заказ",
								style: TextStyle(fontSize: 17,color: Colors.yellow,fontWeight: FontWeight.bold),
								textAlign: TextAlign.left
							),
						),
						Column
						(
							children: <Widget>
							[
								for(int i = 0;i<basketService.basket.countProducts;i++)
									Container
									(
										margin: EdgeInsets.only(left: 10, top: 5), 
										child: Row
										(
											children: <Widget>
											[
												Flexible
												(	
													
													child:Image.network(basketService.basket.products[i].urlImages[0]),
													//padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
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
																padding: EdgeInsets.only(left: 10),
																alignment: Alignment.topLeft,
																child: Text(basketService.basket.products[i].name,style: TextStyle(color: Colors.white70),),
															),
															Container
															(
																padding: EdgeInsets.only(left: 10, top: 5),
																alignment: Alignment.topLeft,
																child: Text("Цена:" + basketService.basket.products[i].price.toString()+" руб.",style: TextStyle(color: Colors.white),),
															),
															Container
															(   
																padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
																//margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 13.0),
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
																					basketService.removeProduct(basketService.basket.products[i]);
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
																				basketService.basket.products[i].countProduct.toString(),
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
																					basketService.setProduct(basketService.basket.products[i]);
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
																)
															)
														],
													),
													flex: 2,
												)
											],
										),
									)
							],
						),
						Container
						(
							margin: EdgeInsets.only(left: 15,top: 15),
							child: Text.rich
							(
								TextSpan
								(
									children: <TextSpan>
									[
										TextSpan(text: 'К оплате: ', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold)),
										TextSpan(text: basketService.basket.summ.toString()+'руб.', style: TextStyle( fontSize: 35,color: Colors.yellow,fontWeight: FontWeight.bold)),
									],
								
								),
								textAlign: TextAlign.left
							),

						),
						Container
						(
							margin: EdgeInsets.only(left: 15,top: 15),
							child: Text.rich
							(
								TextSpan
								(
									children: <TextSpan>
									[
										TextSpan(text: 'Предоплата:', style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold)),
										TextSpan(text: basketService.basket.prepayment.toString()+'руб.', style: TextStyle( fontSize: 25,color: Colors.yellow,fontWeight: FontWeight.bold)),
									],
								
								),
								textAlign: TextAlign.left
							),
							
						),
						Container
						(
							margin: EdgeInsets.only(left: 15,top: 15),
							child: Text
							(
								"*Точная сумма будет известна после формирования заказа",
								style: TextStyle(color: Colors.white24,fontSize: 17),
								textAlign: TextAlign.left
							),
							
						),
						Visibility
						(	
							visible: basketService.prepaymentController,
							child: Column
							(
								children: <Widget>
								[
									SwitchBox(),
									//Выбор города
									Container
									(
										decoration:BoxDecoration
										(
											color: Colors.white24,
											shape: BoxShape.rectangle,
											borderRadius:  BorderRadius.circular(5.0) 
										),
											
												
										
										margin: EdgeInsets.all(10),

										child: InkWell
										(
											onTap: ()
											{
												showDialog
												(
													context: context,
													builder: (context) 
													{
														return SimpleDialog
														(
															title: Column
															(
																children: <Widget>
																[
																	Text('Выберите город'),
																	Divider
																	(	
																		color: Colors.black54,
																	)
																],
															),
															children:  <Widget>
															[
																for(int i = 0;i<progectService.stateProgect.cities.length;i++)
																SimpleDialogOption
																(
																	onPressed: () 
																	{	basketService.setSity(progectService.stateProgect.cities[i]);	
																		Navigator.of(context).pop();
																	},
																	child: Text(progectService.stateProgect.cities[i].name,style: TextStyle(fontSize: 18),),
																
																),
																Divider
																(	
																	indent: 20,
																	endIndent: 20,
																	color: Colors.black54,
																)
															],
														);
													}
												);
											},
											child: Container
											(	
												padding: EdgeInsets.all(10),
												child: Row
												(
													children: <Widget>
													[
														Text(basketService.currentCity.name,style: TextStyle(color: Colors.white,fontSize: 20,),),
														Icon(Icons.arrow_drop_down,color: Colors.white,size: 20,)
													],
												),
											)
											
											
										),
									),
									//Контактные данные
									Container
									(
										child: Column
										(
											children: <Widget>
											[
												Container
												(
													margin: EdgeInsets.all(10),
													alignment: Alignment.centerLeft,
													child: Text("Ваши контактные данные",style: TextStyle(color: Colors.yellow, fontSize: 17),)
												),
												
												ContactName(),
									
												Container
												(
													height: 90,
													child: ContactNamber()
												),
												Container
												(
													height: 90,
													child: ContactEmail()
												),
												Container
												(
													margin: EdgeInsets.all(10),
													alignment: Alignment.centerLeft,
													child: Text("Дата и время мероприятия",style: TextStyle(color: Colors.yellow, fontSize: 17),)
												),
												
												BasicDateTimeField(),
												
												Container
												(
													margin: EdgeInsets.all(10),
													alignment: Alignment.centerLeft,
													child: Text("Комментарий",style: TextStyle(color: Colors.yellow, fontSize: 17),)
												),
												ContactComment(),
												FlatSegmentedControl
												(
													tabChildren: <Widget>
													[
														Container
														(
															height: 50.0,
															child: Center(child: Text("Предоплата онлайн",style: TextStyle(color: Colors.yellow),)),
														),
														Container
														(
															height: 50.0,
															child: Center(child: Text("Безналичный расчёт",style: TextStyle(color: Colors.yellow),)),
														)
														
													
													],
													childrenHeight: 150.0,
													children: <Widget>
													[
														Container
														(
															
															child: PaymentOnline()
														),
														
														//Center(child: Text("View 2")),
														Container
														(
															child: ListView
															(
																children: <Widget>
																[
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'Наименование компании',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'Наименование банка',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'Юридический адрес',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'Расчётный счёт',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'ИНН',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'ОГРН',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'без БИК',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'Кор.счет',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																	Container
																	(	
																		height: 70,
																		margin: EdgeInsets.all(10),
																		child:Theme
																		(
																			data: new ThemeData
																			(
																				primaryColor: Colors.yellow,
																				primaryColorDark: Colors.yellow,
																			),
																			child: TextFormField
																			(	
																				onSaved: (String val) 
																				{
																					basketService.order.namePerson = val;
																				},
																				onChanged: (value)
																				{
																					basketService.order.namePerson = value;
																				},
																				style: TextStyle(fontSize: 20,color: Colors.white),
																				decoration: InputDecoration
																				(	
																					fillColor: Colors.white24,						
																					filled: true,
																					labelText: 'Руководитель/Бухгалтер',
																					labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
																					border:  OutlineInputBorder
																					( 	 
																						borderRadius: BorderRadius.circular(5.0),		
																					),
																				),
																				validator:validateName,
																			),
																		)
																	),
																],
															),
														)
														
														
													],
												),
												Promocod(),
												Row
												(
													children: <Widget>
													[
														Container
														(	margin: EdgeInsets.only(left: 10),
															alignment: Alignment.centerLeft,
															child: Text
															(
																'Сумма к оплате: ',
																style: TextStyle(color: Colors.white,fontSize: 17),
																textAlign: TextAlign.left,
															),
														),
														Container
														(	
															alignment: Alignment.centerLeft,
															child: StateBuilder
															(
																	models: [basketService],
																	tag: 'setSumm',
																	builder: (context, _) 
																	{ 	
																		return Text
																		(
																			basketService.basket.currentSumm.toString()+"руб.",
																			style: TextStyle(color: Colors.yellow,fontSize: 17),
																			textAlign: TextAlign.left,
																		);
																	}
															),
															
														),
													],
												)

												
											],
										),
									),	
									CheckhBox(),
									CheckhBox1(),	
									Container
									(   
										
										margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 13.0),
										child: MaterialButton
										(	
											enableFeedback: true,			  
											child: Text('Перейти к оплате',style: TextStyle(fontSize: 18),),
											textColor: Colors.black,
											color: Colors.yellow,
											splashColor: Colors.black,
											onPressed: ()
											{	
												_validateInputs();
											} 
											
										)
									)
										
								],
							)
						),
						Visibility
						(
							visible: basketService.bascetReverceController,
							child: Column
							(
								children: <Widget>
								[
									Row
									(
										children: <Widget>
										[
											Container
											(
												alignment: Alignment.centerLeft,
												margin: EdgeInsets.only(left: 15,top: 15),
												child: Text("Минимальный заказ от: ",style: TextStyle(color: Colors.white,fontSize: 22),),
											),
											Container
											(
												alignment: Alignment.centerLeft,
												margin: EdgeInsets.only(top: 15),
												child: Text("3000руб",style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.bold),),
											),		
										],
									),
									
									Container
									(
										width: 220,
										height: 50,
										margin: EdgeInsets.only(top: 15, bottom: 15),
										child: OutlineButton
										(
											child: Text('Перейти в меню ',style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.bold),),
											onPressed: ()
											{
												//basketService.setState((state)=>state.removeProduct(basketService.state.basket.products[i]));
											}, 
											splashColor: Colors.yellow[200],
											borderSide: BorderSide
											(
											color: Colors.yellow, 
											style: BorderStyle.solid, 
											width: 1.5, 
											),
										)
									),				
								],
							)
							
						)	
					],
				),
			
			);
			}
			)
			
		);	
	}		 

	String validateName(String value) 
	{
			return null;
	}
	void _validateInputs() 
	{
		final basketService = Injector.get<BasketService>();
		if (_formKey.currentState.validate() && basketService.isOneMyDelivery&&basketService.isMyMemory ) 
		{
			_formKey.currentState.save();
			Navigator.pushNamed(context,'/byOrder');
		} 
		else 
		{ 
			showGeneralDialog
			(
				barrierColor: Colors.black.withOpacity(0.5),
				transitionBuilder: (context, a1, a2, widget) 
				{
					return Transform.scale
					(
						scale: a1.value,
						child: Opacity
						(
							opacity: a1.value,
							child: AlertDialog
							(
								shape: OutlineInputBorder
								(
									borderRadius: BorderRadius.circular(16.0)
								),
								title: Text("Заполните поля"),
							),
						),
					);
				},
				transitionDuration: Duration(milliseconds: 200),
				barrierDismissible: true,
				barrierLabel: '',
				context: context,
				pageBuilder: (context, animation1, animation2) {}
			);
			setState(() 
			{
				_autoValidate = true;
			});
		}														
	}	
}

