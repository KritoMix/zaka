import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/PagesNavigationBar/ComponentCatalog/ImageProducts.dart';
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/StateProgect/stateProgect.dart';


class CustomSearchDelegate extends SearchDelegate {
 	
	int index = -1;
	
	@override
	ThemeData appBarTheme(BuildContext context) 
	{
    	return ThemeData
		(
			
    		primarySwatch: Colors.yellow,
   			textTheme: Theme.of(context).textTheme.apply
			(	
          		bodyColor: Colors.white,
          		displayColor: Colors.white,
        	),
  		);
  	}
	@override
  	List<Widget> buildActions(BuildContext context) 
  	{
    	return 
		[
      		IconButton
			(
				color: Colors.white,
        		icon: Icon(Icons.clear),
        		onPressed: () 
				{
          			query = '';
        		},
      		),
    	];
  	}

  	@override
  	Widget buildLeading(BuildContext context) 
	{
    	return IconButton
		(
			color: Colors.white,
      		icon: Icon(Icons.arrow_back),
      		onPressed: () 
			{
        		close(context, null);
      		},
    	);
  	}

  	@override
  	Widget buildResults(BuildContext context) 
  	{
		final progectService = Injector.get<ProgectService>();
		//final progectService = Injector.getAsReactive<ProgectService>(context: context);	  
		List<ProductM> names = List<ProductM>();
		progectService.stateProgect.categorys.forEach
		(	
			(cat)
			{
				cat.products.forEach
				(
					(pro)
					{
						index = pro.name.indexOf(query);
						if(index >= 0)
						{
							names.add(pro);
						}
					}
				);
			}
		);
		return Container
		( 	color: Colors.black54,
			margin: EdgeInsets.only(bottom: 30),
			child: ListView
			(
				children: <Widget>
				[
					for(int i = 0;i<names.length;i++)
					Card
					(
						margin: EdgeInsets.all(5),
						elevation: 4.4,
						child: InkWell
						(
							onTap: ()
							{
									Navigator.pushNamed(context,'/nextPr',arguments: names[i]);
							},
							child: Row
							(
								children: <Widget>
								[
									Flexible
									(
										
										child: Container
										(
											child: Image.network(names[i].urlImages[0],height: 40),
											padding: EdgeInsets.all(5),
										),
										flex: 1,
									),
									Flexible
									(
										child: Text(names[i].name),
										flex: 3,
									)
								]	
							),
						),
					)
				],
			),
		);
  	}
  
  	@override
  	Widget buildSuggestions(BuildContext context) 
  	{
		final progectService = Injector.get<ProgectService>();
		//final progectService = Injector.getAsReactive<ProgectService>(context: context);	  
		List<ProductM> names = List<ProductM>();
		progectService.stateProgect.categorys.forEach
		(	
			(cat)
			{
				cat.products.forEach
				(
					(pro)
					{
						index = pro.name.indexOf(query);
						if(index >= 0)
						{
							names.add(pro);
						}
					}
				);
			}
		);
		return Container
		( 	color: Colors.black54,
			margin: EdgeInsets.only(bottom: 30),
			child: ListView
			(
				children: <Widget>
				[
					for(int i = 0;i<names.length;i++)
					Card
					(
						margin: EdgeInsets.all(5),
						elevation: 4.4,
						child: InkWell
						(
							onTap: ()
							{
									Navigator.pushNamed(context,'/nextPr',arguments: names[i]);
							},
							child: Row
							(
								children: <Widget>
								[
									Flexible
									(
										
										child: Container
										(
											child: Image.network(names[i].urlImages[0],height: 40),
											padding: EdgeInsets.all(5),
										),
										flex: 1,
									),
									Flexible
									(
										child: Text(names[i].name),
										flex: 3,
									)
								]	
							),
						),
					)
				],
			),
		);
	
  }
}

/*
  @override
  bool updateShouldNotify(InheritedBlocs oldWidget) {
    return true;
  }
}*/



class Catalog extends StatefulWidget 
{
	@override
  	MyCatalogState createState() => MyCatalogState();
}
 
class MyCatalogState extends State<Catalog> 
{
	void reverceWidget(int newIndex)
	{
		setState(() 
		{
			index = newIndex;
			chekWidget1 = false;
			chekWidget2 = true;
		});
	}
	void reverceWidgetback()
	{
		setState(() 
		{
			chekWidget1 = true;
			chekWidget2 = false;
		});
	}
	
	bool chekWidget1 = true;
	bool chekWidget2 = false;
	int index = 0;
  	@override
    Widget build(BuildContext context) 
    {
		final progectService = Injector.get<ProgectService>();
		//final progectService = Injector.getAsReactive<ProgectService>(context: context);
    	return Scaffold
        (
			appBar: AppBar
			(
				backgroundColor: Colors.yellow,
				title: chekWidget2 ? 
				Row(children: <Widget>[
					IconButton(icon: Icon(Icons.arrow_back),onPressed: (){reverceWidgetback();},),
					Text(progectService.stateProgect.categorys[index].name)])
				:Text("Выберите категорию"),//Text(chekWidget2 ? progectService.state.stateProgect.categorys[index].name : "Выберите категорию" ),
				actions: <Widget>	
				[
					IconButton(
					icon: Icon(Icons.search),
					
					onPressed: () 
					{
						showSearch(
						context: context,
						delegate: CustomSearchDelegate(),
						);
					},
					
					
					),
				],
			),
      		backgroundColor: Colors.black54,
      		
			body: Stack
			(
				children: <Widget>
				[
					Visibility
					(	
						visible: chekWidget1,
    					child:
						ListView
						(	
  							children: <Widget>
							[	
    
								for(int i = 0;i<progectService.stateProgect.categorys.length;i++)
					
								MaterialButton
									(							  
											padding: EdgeInsets.only(left: 10,bottom: 10),		  
											child: Row
											(
												children: <Widget>
												[
													Flexible
													(
														fit: FlexFit.loose,		
														flex: 3,
														child: Container
														(
															
															width: 90,
															child: CircleAvatar
															(
                												radius: 40.0,
                												backgroundImage:
                    											NetworkImage(progectService.stateProgect.categorys[i].products[0].urlImages[0]),
                												backgroundColor: Colors.transparent,
              												),	
														)
														
													
													),
													Flexible
													(
														fit: FlexFit.tight,	
														flex: 7,
														child: Container
														(	margin: EdgeInsets.only(left: 15),
															child: Text(progectService.stateProgect.categorys[i].name,style: TextStyle(fontSize: 18,color: Colors.white))
														),
														
													),
													Flexible
													(
															
														flex: 1,
														child: Container
														(
														
															child: Icon(Icons.arrow_forward_ios,color: Colors.white),
														) 
														
														
														
													)
													
													
												],
											)
                        				,
										onPressed: ()
										{
											reverceWidget(i);
											//Navigator.pushNamed(context,'/nextImageProducts',arguments:progectService.state.stateProgect.categorys[i]);
										},
									)
								
							]
						)
					),
					Visibility
					(
						visible: chekWidget2,
						child: ImageProducts(progectService.stateProgect.categorys[index])
					)

				
				],
			)
					
							 
		);


	}
}
