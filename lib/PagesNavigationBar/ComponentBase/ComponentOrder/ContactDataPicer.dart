
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/StateProgect/stateBascet.dart';

class BasicDateTimeField extends StatelessWidget {
  	final format = DateFormat("dd-MM-yyyy HH:mm"); // yyyy-MM-dd
	
  	@override
  	Widget build(BuildContext context) 
  	{
		final basketService = Injector.get<BasketService>();
    	return 
		Container
		(	
			height: 70,
			margin: EdgeInsets.all(10),
			child: Theme
		(   
          	data: new ThemeData
			(	
           		primaryColor: Colors.yellow,
            	//primaryColorDark: Colors.yellow,
          	),
      			child: DateTimeField
				(	
					onSaved: (value)
					{
						basketService.order.data = value.toString();
					},
					validator: validateDate,
					onChanged: (value)
					{
						 basketService.order.data = value.toString();
					},
					style: TextStyle(color: Colors.white),
					decoration: InputDecoration
					(	
						border:  OutlineInputBorder
						( 	 
							borderRadius: BorderRadius.circular(5.0),		
						),
					),
        			format: format,
        			onShowPicker: (context, _currentValue) async 
					{
						var currentData = DateTime.now();
          				final date = await showDatePicker
						(	
              				context: context,
              				firstDate: currentData,
              				initialDate: _currentValue ?? DateTime.now(),
              				lastDate: DateTime(2021)
						);
          				if (date != null) 
						{
            				final time = await showTimePicker
							(
								context: context,
								initialTime: TimeOfDay(hour: 10, minute: 47),
								builder: (BuildContext context, Widget child) {
									return MediaQuery(
									data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
									child: child,
									);
								},
							);
            				return DateTimeField.combine(date, time);
          				} 
						else 
						{
            				return _currentValue;
          				}		
					}
				)
		)
		);
		
  	}

	String validateDate(DateTime value) 
	{	
		DateTime newData = DateTime.now();
		if (value!=null &&value.day >= newData.day && value.hour>9 && value.hour<20)
		{	
			return null;
		}
		else
		{
			return '*';
		}		
  	}
}
