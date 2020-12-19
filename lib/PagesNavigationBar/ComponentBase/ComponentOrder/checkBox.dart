import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';

class Conditions extends StatelessWidget
{
  	const Conditions
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
					Row
	  				(
          				children: <Widget>
		  				[	
							InkWell 
							(
      							onTap: () 
								{
        							onChanged(!value);
      							},
								child:Checkbox
								(	
									checkColor: Colors.yellow,
									//inactiveTrackColor: Colors.black38,
									//inactiveThumbColor: Colors.yellow,
									//activeTrackColor: Colors.black38,
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
				 			Text("Я согласен c ",style: TextStyle(color: value ? Colors.yellow : Colors.black54, fontSize: 16)),
							InkWell
							(
								onTap: () 
								{
        							
      							},
								child: Text
								(	
									"условиями доставки",
									style: TextStyle(color: value ? Colors.yellow : Colors.black54, fontSize: 16,decoration: TextDecoration.underline)),
							)
          				],
        			),
	  			],
		);	
  	}
}

class CheckhBox extends StatefulWidget {
  CheckhBox() :  super();

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<CheckhBox> 
{
	bool _isSelected = false;
	
  	@override
  	Widget build(BuildContext context) 
	{
		final basketService = Injector.get<BasketService>();
		return Conditions
		(
			value: _isSelected,
			onChanged: (bool newValue) 
			{
				basketService.setMyDelivery(newValue);
				setState(() 
				{
					_isSelected = newValue;
				});
			}, 
		);
  }
}