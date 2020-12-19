import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';

class ContactEmail extends StatelessWidget 
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
					
					onChanged: (value)
					{
						 basketService.order.emaylPerson = value;
					},
					style: TextStyle(fontSize: 20,color: Colors.white),
					decoration: InputDecoration
					(	
						fillColor: Colors.white24,						
						filled: true,
    					labelText: 'Введите Email',
						labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
						border:  OutlineInputBorder
						( 	 
							borderRadius: BorderRadius.circular(5.0),		
						),
					),
  					validator:validateEmail,
					keyboardType: TextInputType.emailAddress,
					onSaved: (String val) 
					{
            			basketService.order.emaylPerson = val;
          			},
				),
			)
		);
  	}
	String validateEmail(String value) 
	{
    	Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
   	 	RegExp regex = new RegExp(pattern);
    	if (!regex.hasMatch(value))
		{
			return '*';
		}
    	else
		{
			return null;
		}	
  	}
}