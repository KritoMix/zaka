import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Extention/maskedTextInputFormatter.dart';
import 'package:zaka/StateProgect/stateBascet.dart';


class ContactNamber extends StatelessWidget 
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
					onSaved: (String val) 
					{
            			basketService.order.namberPerson = val;
          			},
					inputFormatters: 
					[
						MaskedTextInputFormatter(
							mask: 'x-xxx-xxx-xx-xx',
							separator: '-',
						),
					],
					keyboardType: TextInputType.number,
					onChanged: (value)
					{
						 basketService.order.namberPerson = value;
					},
					style: TextStyle(fontSize: 20,color: Colors.white),
					decoration: InputDecoration
					(	
						fillColor: Colors.white24,						
						filled: true,
    					labelText: 'Введите номер телефона',
						labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
						border:  OutlineInputBorder
						( 	 
							borderRadius: BorderRadius.circular(5.0),		
						),
					),
  					validator:validateMobile,
            
				),
			)
		);
  	}

	String validateMobile(String value) 
	{
    	if (value.length != 15)
		{	
			return '*';
		}
   	 	else
		{	
			return null;
		} 
  	}
}