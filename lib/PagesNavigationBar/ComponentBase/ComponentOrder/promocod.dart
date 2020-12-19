import 'package:flutter/material.dart';
class Promocod extends StatelessWidget 
{
	
    @override
    Widget build(BuildContext context) 
    {
        return Container
		(	
			margin: EdgeInsets.only(left: 10, bottom: 10,top: 10),
			child: Column
			(
				children: <Widget>
				[
					Container
					(	
						margin: EdgeInsets.only(bottom: 10),
						alignment: Alignment.centerLeft,
						child: Text
						(
							'Промо-код ',
							style: TextStyle(color: Colors.yellow,fontSize: 19),
							textAlign: TextAlign.left,
						),
					),
					Row
					(
						children: <Widget>
						[
							Flexible
							(
								child:  Container
								(
									height: 35,
									child:Theme
									(
										data: new ThemeData
										(
											primaryColor: Colors.yellow,
											primaryColorDark: Colors.yellow,
										),
										child: TextFormField
										(	
											style: TextStyle(fontSize: 20,color: Colors.white),
											decoration: InputDecoration
											(	
												fillColor: Colors.white24,						
												filled: true,
												border:  OutlineInputBorder
												( 	 
													borderRadius: BorderRadius.circular(5.0),		
												),
											),
											
										),
									)
								),
							flex: 2,
							),
						
							Flexible
							(
								child: Container
							(   
								height: 33,
								
								margin: EdgeInsets.only(left: 2),
								child: MaterialButton
								(						  
									child: Text('Применить'),
									textColor: Colors.red,
									color: Colors.yellow,
									splashColor: Colors.yellow[200],
									onPressed: ()
									{
							
									},
								)
							),
							flex: 1,
							)
						],
					)
					
					
				],
			)
		);
  	}
}