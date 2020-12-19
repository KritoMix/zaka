import 'package:flutter/material.dart';
//import 'package:zaka/PagesNavigationBar/ComponentBase/ComponentOrder/dropDownBox.dart';




class Company {
  int id;
  String name;
 
  Company(this.id, this.name);
 
  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Коломна'),
      Company(2, 'Москва'),
      Company(3, 'Рязань'),
      Company(4, 'Егорьевск'),
      Company(5, 'Королёв'),
    ];
  }
}

class LabeledSwitch extends StatelessWidget
{
  	const LabeledSwitch
	(
		{
    		this.groupValue,
    		this.value,
    		this.onChanged,
			this.companies,
			this.dropdownMenuItems,
			this.selectedCompany,
			this.onChangeDropdownItem,
			
		 }
	);
  	final bool groupValue;
  	final bool value;
  	final Function onChanged;
	final List<String> companies;
	final List<DropdownMenuItem<String>> dropdownMenuItems;
	final String selectedCompany;
	final Function onChangeDropdownItem;
	
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
							Container
							(
								margin: EdgeInsets.only(left: 10),
								child: Text("Самовывоз",style: TextStyle(color: value ? Colors.black54 : Colors.yellow, fontSize: 17)),
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
				 			Text("Доставка",style: TextStyle(color: value ? Colors.yellow : Colors.black54, fontSize: 17)),
          				],
        			),
					Visibility
					(	
						visible: value,
						
						child: Column
						(
							children: <Widget>
							[
								Container
								(
									margin: EdgeInsets.all(10),
									alignment: Alignment.centerLeft,
									child: Text("Адрес доставки",style: TextStyle(color: Colors.yellow, fontSize: 17),)
								),
								/*
								Container
								(
									margin: EdgeInsets.all(10),
									child: DropDown(),
								),*/
								Container
								(
									height: 50,
									margin: EdgeInsets.all(10),
									child:Theme
									(
          								data: new ThemeData
										(
           									primaryColor: Colors.yellow,
            								primaryColorDark: Colors.yellow,
          								),
         								child: TextFormField
										(	style: TextStyle(fontSize: 20,color: Colors.white),
											decoration: InputDecoration
											(	
												fillColor: Colors.white24,
												
												filled: true,
    											labelText: 'Введите адрес',
												labelStyle: TextStyle(fontSize: 18,color: Colors.yellow),
  											
												border:  OutlineInputBorder
												( 	 
													borderRadius: BorderRadius.circular(5.0),
											
												),
										  	),
  											validator: (value) 
											{
    											if (value.isEmpty) 
												{
      												return 'Please enter some text';
    											}
    											return null;
  											},
										),
									)
								)
							],
						)
					), 
	  			],
		);
    	
  	}
}

class SwitchBox extends StatefulWidget {
  SwitchBox() :  super();

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SwitchBox> {
  	
	List<String> cities = ["Коломна","Москва","Луховици"];
	List<DropdownMenuItem<String>> dropdownMenuItems;
	String selectedCity;
	@override
  	void initState() 
	{
    	dropdownMenuItems = buildDropdownMenuItems(cities);
    	selectedCity = dropdownMenuItems[0].value;
    	super.initState();
  	}
	List<DropdownMenuItem<String>> buildDropdownMenuItems(List cities) 
	{
    	List<DropdownMenuItem<String>> items = List();
    	for (String company in cities) 
		{
      		items.add
			(
        		DropdownMenuItem
				(
          			value: company,
          			child: Text(company,style: TextStyle(color: Colors.white),),
        		),
      		);
    	}
    	return items;
  	}
	onChangeDropdownItem(String selectedCompany) 
	{
    	setState
		(	
			() 
			{
      			selectedCity = selectedCompany;
    		}
		);
  	}
	  
	bool _isSelected = false;

  	@override
  	Widget build(BuildContext context) 
	{
	return LabeledSwitch
	(
      	value: _isSelected,
      	onChanged: (bool newValue) 
		{
        	setState(() 
			{
          		_isSelected = newValue;
        	});
      	}, 
		dropdownMenuItems: dropdownMenuItems,
		selectedCompany: selectedCity,
		onChangeDropdownItem: onChangeDropdownItem
    );
  }
}