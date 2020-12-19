import 'package:flutter/material.dart';

class Payment extends StatelessWidget 
{
  	@override
  	Widget build(BuildContext context) 
	{
    	return Scaffold
		(
      		appBar: AppBar
			(	
				backgroundColor: Colors.yellow,
        		title: Text("Доставка и оплата"),
      		),
      		body: ListView
			(
  				padding: const EdgeInsets.all(4),
  				children: <Widget>
				[
					Container
					(	
						alignment: Alignment.center,
						child: Row
						(
							children: <Widget>
							[
								Container
								(	
									width: 80,
									height: 310,
									margin: EdgeInsets.fromLTRB(10,10,20,10),
									alignment: Alignment.center,
									child: Image.asset("images/car.png"),
								),
								Container
								(	
									width: 230,
									height: 320,
									child: ListView
									(
										children: <Widget>
										[	Container
											(
												margin: EdgeInsets.only(bottom: 10),
												child: Text
												(
													'ДОСТАВКА И САМОВЫВОЗ',
													style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
												),
											),
											
											Text('Доставка заказов осуществляется в Пн-Пт с 9.00 до 21.00, в выходные с 9.00 до 20.00.',style: TextStyle(color: Colors.black,fontSize: 15)),
											Text('По Коломне и Коломенскому району доставляем бесплатно.',style: TextStyle(color: Colors.black,fontSize: 15)),
											Text('Возможность доставки в другие города обсуждается с персональным менеджером 8(925) 444-73-00.Заказ, поступивший после 15:00 принимается в обработку в 09:00 следующего дня.',style: TextStyle(color: Colors.black,fontSize: 15)),
											Text('Так же вы можете забрать заказ сами по адресу: г. Коломна, ул. Ленина, д. 80а',style: TextStyle(color: Colors.red,fontSize: 15)),
										],
									)								
								)
							],
						),		
					),
					Container
					(	
						alignment: Alignment.center,
						child: Row
						(
							children: <Widget>
							[
								Container
								(	
									width: 80,
									height: 160,
									margin: EdgeInsets.fromLTRB(10,10,20,10),
									alignment: Alignment.center,
									child: Image.asset("images/payment.png"),
								),
								Container
								(	
									width: 230,
									height: 130,
									child: ListView
									(
										children: <Widget>
										[
											Text('ВАРИАНТЫ ПРЕДОПЛАТЫ И ОПЛАТЫ',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
											Text('Вы можете внести предоплату банковской картой на сайте или по безналичному расчету.',style: TextStyle(color: Colors.black,fontSize: 15)),
											Text('Возможна постоплата по карте курьеру.',style: TextStyle(color: Colors.black,fontSize: 15)),
										],
									)								
								)
							],
						)
							
					),
					
					Row
					(
						children: <Widget>
						[
							Container
							(	
								
								height: 70,
								margin: EdgeInsets.fromLTRB(10,10,20,10),
								alignment: Alignment.center,
								child: Image.network("https://zakajuka.ru/img/delivery/mastercard.png"),
							),
							Container
							(	
								
								height: 70,
								margin: EdgeInsets.fromLTRB(10,10,20,10),
								alignment: Alignment.center,
								child: Image.network("https://zakajuka.ru/img/delivery/viza.png"),
							),
						],
					),
					
					Container
					(	
						margin: EdgeInsets.fromLTRB(10,10,20,10),
						width: 230,
						height: 230,
						child: ListView
						(
							children: <Widget>
							[
								Text('1. После заполнения данных и перехода к оплате в появившемся окне произведите оплату банковской картой Visa или Mastercard.',style: TextStyle(color: Colors.black12,fontSize: 16)),
								Text('2. После произведения оплаты вы получите SMS-сообщение или электронное письмо с информацией о подтверждении заказа.',style: TextStyle(color: Colors.black12,fontSize: 15)),
								Text('3. Не позднее, чем за час до времени доставки, мы дополнительно проинформируем вас о доставке с помощью SMS.',style: TextStyle(color: Colors.black12,fontSize: 15)),
							],
						)								
					),
					Container
					(	
						width: 230,
						height: 160,
						margin: EdgeInsets.fromLTRB(10,10,20,10),
						alignment: Alignment.center,
						
						child: new Image.network('https://zakajuka.ru/img/delivery/juk.png'),
					),
				],
			)
      	);
  	}
}