import 'package:flutter/material.dart';

class AboutService extends StatelessWidget 
{
  	@override
  	Widget build(BuildContext context) 
	{
    	return Scaffold
		(
      		appBar: AppBar
			(	
				backgroundColor: Colors.yellow,
        		title: Text("Об Услуге"),
      		),
      		body: ListView
			(
  				padding: const EdgeInsets.all(4),
  				children: <Widget>
				[
					Container
					(	
						margin: EdgeInsets.fromLTRB(0,10,0,30),
						alignment: Alignment.center,
						child: Text
						(
							'OБ УСЛУГЕ',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),
							textAlign: TextAlign.center
						),
					),
					Container
					(	
						margin: EdgeInsets.fromLTRB(10,0,20,0),
						alignment: Alignment.center,
						child: Text
						(
							'"ЗАКАЖУКА"-это новая услуга от компании "MIX точка".Мы готовим и доставляем блюда для вашего праздника.',
							style: TextStyle(color: Colors.black,fontSize: 19),
							textAlign: TextAlign.center
						),
					),
					Container
					(	
						margin: EdgeInsets.fromLTRB(10,0,20,0),
						alignment: Alignment.center,
						child: Text
						(
							'У вас День рождения, корпоратив, свадьба или встреча гостей,но вам негогда готовить?',
							style: TextStyle(color: Colors.black,fontSize: 19),
							textAlign: TextAlign.center,
						),


					),
					Container
					(	
							margin: EdgeInsets.fromLTRB(10,0,20,20),
							alignment: Alignment.center,
							child: Text
							(
								'"Закажука" возьмёт это на себя!',
								style: TextStyle(color: Colors.black,fontSize: 19),
								textAlign: TextAlign.center,
							),

					),
					
					Text
					(	
						'ЦЕННОСТЬ УСЛУГИ',
						style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
						textAlign: TextAlign.center,
					),

						
					Container
					(	
							
							margin: EdgeInsets.fromLTRB(20,30,20,30),
							alignment: Alignment.center,
							child: Image.asset("images/food.png"),

					),
					Text
					(
						'Большой выбор вкусных блюд для вашего стола.',
						style: TextStyle(color: Colors.black,fontSize: 19,),
						textAlign: TextAlign.center,
					),

						
					Container
					(	
							child: Image.asset("images/piggy.png"),
							margin: EdgeInsets.fromLTRB(20,30,20,30),
							alignment: Alignment.center,
							

					),
					Text
					(
						'С нами вы экономите свои силы и время.',
						style: TextStyle(color: Colors.black,fontSize: 19),
						textAlign: TextAlign.center,
						
					),
						
					Container
					(	
							child: Image.asset("images/hand.png"),
							margin: EdgeInsets.fromLTRB(20,30,20,30),
							alignment: Alignment.center,
							

						),
					Text
					(
						'Только качественные продукты и доступные цены.',
						style: TextStyle(color: Colors.black,fontSize: 19),
						textAlign: TextAlign.center,
					),

						
				],
			)
      	);
  	}
}
