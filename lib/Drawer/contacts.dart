import 'dart:ui';
import 'package:flutter/material.dart';

class Contakts extends StatelessWidget 
{
  	@override
  	Widget build(BuildContext context) 
	{
    	return Scaffold
		(
      		appBar: AppBar
			(	
				backgroundColor: Colors.yellow,
        		title: Text("Контакты"),
      		),
      		body: ListView
			(
				children: <Widget>
				[
					Container
					(	
						margin: EdgeInsets.all(10),
						child: Card
						(	
							elevation: 10.10,
							child: Column
							(
								children: <Widget>
								[	
									Container
									(
										padding: EdgeInsets.only(top:10,bottom: 5),
										alignment: Alignment.center,
										color: Colors.yellow,
										child: Text("8(800)550-36-54",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
									),		
									Container
									(
										color: Colors.yellow,
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										padding: EdgeInsets.only(bottom: 5),
										alignment: Alignment.center,
										color: Colors.yellow,
										child: Text("+7(925)444-73-00",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
									),
									Container
									(
										
										alignment: Alignment.center,
										color: Colors.yellow,
										child: Text("Ваш личный менеджер",style: TextStyle(fontSize: 15)),
									),
									Container
									(
										color: Colors.yellow,
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										padding: EdgeInsets.only(bottom: 5),
										alignment: Alignment.center,
										color: Colors.yellow,
										child: Text("Прием заказов",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
									),
									Container
									(
										padding: EdgeInsets.only(bottom: 10),
										alignment: Alignment.center,
										color: Colors.yellow,
										child: Text("Пн-Сб с 9:00 до 21:00 / Вс с 9:00 до 20:00",style: TextStyle(fontSize: 15)),
									),
								],
							),
						),
					),
					Container
					(	
						margin: EdgeInsets.all(10),
						child: Card
						(	
							elevation: 10.10,
							child: Column
							(
								children: <Widget>
								[	
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("ОБЪЕДКОВ МАКСИМ АЛЕКСАНДРОВИЧ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("Индивидуальный предприниматель",style: TextStyle(fontSize: 15,color: Colors.black87)),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("Юридический адрес",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("140408, Московская обл., г.Коломна, Спартаковская,д.23а",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("Почтовый адрес",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("140408, Московская обл., г.Коломна, Спартаковская,д.23а",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("Фактический адрес",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("140415, г. Коломна, ул. Колхозная, д. 12а",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("ИНН",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("502210126092",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("ОГРНИП",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("318502200021006",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("ОКВЭД",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("47.11 53.20.3",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("ОКАТО",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("46438000000",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("ФИЛИАЛ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("ФИЛИАЛ №7701 Банка ВТБ (ПАО) Г.МОСКВА",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("Расчетный счет",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("40802810520270000003",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("Корреспондентский",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										alignment: Alignment.center,
										child: Text("30101810345250000745",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
									Container
									(
										child: Divider
										(	
											color: Colors.black54,
										),
									),
									Container
									(
										margin: EdgeInsets.all(10),
										alignment: Alignment.center,
										child: Text("БИК",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
									),
									Container
									(
										padding: EdgeInsets.only(bottom:10),
										alignment: Alignment.center,
										child: Text("044525745",style: TextStyle(fontSize: 15,color: Colors.black87,),textAlign: TextAlign.center,),
									),
								]
							)
						)
					),
				],
			)
			  
			
		);
	}	
}