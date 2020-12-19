
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';


class ContactName extends StatelessWidget
{	
    @override
    Widget build(BuildContext context) 
    {
		final basketService = Injector.get<BasketService>();
        return Container
		(	height: 70,
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
    					labelText: 'ФИО',
						labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
						border:  OutlineInputBorder
						( 	 
							borderRadius: BorderRadius.circular(5.0),		
						),
					),
  					validator:validateName,
				),
			)
		);
  	}
	String validateName(String value) 
	{
		if (value.length < 3)
		{
			return '*';
		}
		else
		{
			return null;
		}		

	}
}