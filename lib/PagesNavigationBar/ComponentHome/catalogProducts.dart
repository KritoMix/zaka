import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zaka/PagesNavigationBar/ComponentHome/containerProduct.dart';
import 'package:zaka/Repository/Model/category.dart';



class CatalogToProduct extends StatelessWidget
{

	CategoryM category;
	List<Product> products = new List<Product>();
	CatalogToProduct(CategoryM newcategory)
	{	
		category = newcategory;
		for (var i = 0; i < category.products.length; i++) 
		{
			products.add(new Product(category.products[i]));
		}	
	}
	@override
		Widget build(BuildContext context) 
	{
			return 
		Container
		(
		
			child:Column
			(
				children: <Widget>
				[
					new Container
							(	
								alignment: Alignment.centerLeft,
								
								margin: EdgeInsets.only(left: 15,top: 5,bottom: 5),
								//padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
								child:Text
								(	
									category.name,
									style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20,)
								),
							),
					CarouselSlider
					(		 
						options: CarouselOptions
						(
							viewportFraction: 0.9,
							initialPage: 0,
							reverse: false,
							autoPlay: false, 
							autoPlayCurve: Curves.fastOutSlowIn,
							height: 120,  
						),
						items: products	
					)
				],
			)
		);   
	}
}