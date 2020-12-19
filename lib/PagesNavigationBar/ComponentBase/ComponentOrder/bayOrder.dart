
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';
class BayOrder extends StatelessWidget 
{
	
    @override
    Widget build(BuildContext context) 
    {
		final basketService = Injector.get<BasketService>();
        return Scaffold
		(
			appBar: AppBar
			(
				backgroundColor: Colors.tealAccent[400],
				title: Text("Данные заказа",style: TextStyle(color: Colors.white,fontSize: 18),),
			),
			backgroundColor: Colors.white24,
			body: Column
			(
				children: <Widget>
				[	
					
					Row
					(
						children: <Widget>
						[
							Text("ФИО: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text(basketService.order.namePerson,style: TextStyle(color: Colors.yellow,fontSize: 18),),
					
						],
					),
					
					Row
					(
						children: <Widget>
						[
							Text("Даа и время: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text(basketService.order.data,style: TextStyle(color: Colors.yellow,fontSize: 18),),
						],
					),
					Row
					(
						children: <Widget>
						[
							Text("Описание: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text(basketService.order.descriptionPerson,style: TextStyle(color: Colors.yellow,fontSize: 18),),
						],
					),
					Row
					(
						children: <Widget>
						[
							Text("Email: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text(basketService.order.emaylPerson,style: TextStyle(color: Colors.yellow,fontSize: 18),),
						],
					),
					Row
					(
						children: <Widget>
						[
							Text("Номер телефона: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text(basketService.order.namberPerson,style: TextStyle(color: Colors.yellow,fontSize: 18),),
						],
					),
					Container
					(//basketService.state.order.namePerson
						child: Row
						(
							children: <Widget>
							[
								Text("Сумма: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
								Text(basketService.basket.summ.toString(),style: TextStyle(color: Colors.yellow,fontSize: 18),),
							],
						)	
					),
					Container
					(//basketService.state.order.namePerson
						child: Row
						(
							children: <Widget>
							[
								Text("К оплате: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
								Text(basketService.basket.currentSumm.toString(),style: TextStyle(color: Colors.yellow,fontSize: 18),),
							],
						)	
					),
					Text("Id Продуктов: ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
					for(int i = 0;i<basketService.basket.products.length;i++)
					Row
					(
						children: <Widget>
						[
							Text("Id Категории: "+ basketService.basket.products[i].categoryId.toString()+"  ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text("Id: "+ basketService.basket.products[i].id.toString()+"  ",style: TextStyle(color: Colors.yellow,fontSize: 18),),
							Text("Колличество: "+ basketService.basket.products[i].countProduct.toString(),style: TextStyle(color: Colors.yellow,fontSize: 18),),
						],
					)
				],
			),
		);
  	}
}