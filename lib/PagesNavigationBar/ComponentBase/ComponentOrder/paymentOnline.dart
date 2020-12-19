import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';



class PaymentOnline extends StatefulWidget {
  PaymentOnline() :  super();

  @override
  _MyOnlineWidgetState createState() => _MyOnlineWidgetState();
}



class _MyOnlineWidgetState extends State<PaymentOnline> 
{
	
	bool _isSelected = false;
	
  	@override
  	Widget build(BuildContext context) 
	{
		final basketService = Injector.get<BasketService>();
		
		return OnlibeSwich
		(
      		value: _isSelected,
      		onChanged: (bool newValue) 
			{
        		setState(() 
				{
          			_isSelected = newValue;
					
        		});
				basketService.setSumm(newValue);	
				
      		}, 
    	);
  	}
}


class OnlibeSwich extends StatelessWidget
{
  	const OnlibeSwich
	(
		{
    		this.groupValue,
    		this.value,
    		this.onChanged,	
		 }
	);
  	final bool groupValue;
  	final bool value;
  	final Function onChanged;
	
	
  	@override
 	Widget build(BuildContext context) 
	{
		
    	return Column
	  	(
	  			children: <Widget>
	  			[
					Container
					(
						margin: EdgeInsets.all(10),
						child: Column
						(
							children: <Widget>
							[
								Container
								(	
									alignment: Alignment.centerLeft,
									child: Text
									(
										'Вы можете внести предоплату в размере 50% или оплатить заказ полностью',
										style: TextStyle(color: Colors.white,fontSize: 17),
										textAlign: TextAlign.left,
									),
								),
								Row
								(
									children: <Widget>
									[	
										Container
										(
											margin: EdgeInsets.only(left: 10),
											child: Text("100%",style: TextStyle(color: value ? Colors.black54 : Colors.yellow, fontSize: 17)),
										),
										InkWell 
										(
											onTap: () 
											{
												onChanged(!value);
											},
											child: Switch
											(	
												inactiveTrackColor: Colors.black38,
												inactiveThumbColor: Colors.yellow,
												activeTrackColor: Colors.black38,
												//focusColor: Colors.yellow,
												//hoverColor: Colors.yellow,
												activeColor: Colors.yellow,
												value: value,
												onChanged: (bool newValue) 
												{
													onChanged(newValue);
												}
											)
										),
										Text("50%",style: TextStyle(color: value ? Colors.yellow : Colors.black54, fontSize: 17)),
									],
								),
	  							Row
										(
											children: <Widget>
											[
												new Image.network("https://zakajuka.ru/img/footer/mastercard.png"),
												new Image.network("https://zakajuka.ru/img/footer/viza.png"),

											],
										)
							  ],
						)	
					)
				]
		);
	}
}