import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';

class ContactComment extends StatelessWidget 
{
	
    @override
    Widget build(BuildContext context) 
    {
		final basketService = Injector.get<BasketService>();
        return Container
		(	
			
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
					onSaved: (value)
					{
						basketService.order.descriptionPerson = value;
					},
					validator: validateCommtnt,
					onChanged: (value)
					{
						 basketService.order.descriptionPerson = value;
					},
					keyboardType: TextInputType.multiline,
  					maxLines: 4,
					style: TextStyle(fontSize: 20,color: Colors.white),
					decoration: InputDecoration
					(	
						fillColor: Colors.white24,						
						filled: true,
    					labelText: 'Краткое описание к заказу',
						labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
						border:  OutlineInputBorder
						( 	 
							borderRadius: BorderRadius.circular(5.0),		
						),
					),
				),
			)
		);
  	}
	String validateCommtnt(String value) 
	{		
			return null;		
  	}
}