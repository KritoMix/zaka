import 'dart:ui';

import 'package:flutter/material.dart';
 
class DropDown extends StatefulWidget {
  //	DropDown() : super();
	
	const DropDown
	(
		{
    		this.cities,
    		
		}
	);
  	final List<Company> cities;


  	@override
  	DropDownState createState() => DropDownState();
}
 
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
 
class DropDownState extends State<DropDown> 
{
  	List<Company> _companies = Company.getCompanies();
  	List<DropdownMenuItem<Company>> _dropdownMenuItems;
  	Company _selectedCompany;
 
  	@override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }
 
  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }
 
  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }
 
  	@override
 	Widget build(BuildContext context) 
  	{
		return  
		Container
		(
			height: 40,
			color: Colors.white24,
			padding: EdgeInsets.only(left: 10,top: 5),
			child: DropdownButton
			(
				style: TextStyle(color: Colors.black54,fontSize: 19),
				isDense: true,
				iconEnabledColor: Colors.yellow,
				isExpanded: true,
				value: _selectedCompany,
				items: _dropdownMenuItems,
				onChanged: onChangeDropdownItem,
			),
			//decoration: BoxDecoration
			//(
			//	border: Border.all(width: 1,color: Colors.white12)
			//)
		);
                
            // Text('Selected: ${_selectedCompany.name}'),
 	}
}