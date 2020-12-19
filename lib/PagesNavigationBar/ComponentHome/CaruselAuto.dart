import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CaruselAuto extends StatelessWidget
{
	@override
  	Widget build(BuildContext context)
	{
		return Container
		(	
			height: 240,
			child: Carousel
			(	
				autoplayDuration: Duration(seconds: 10),
				//autoplay: false,
				dotSize: 4.0,
    			images:
				[  
					Image.asset('images/banners/banner1.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner2.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner3.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner4.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner5.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner6.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner7.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner8.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner9.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner10.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner11.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner12.jpg', fit: BoxFit.cover,),
					Image.asset('images/banners/banner13.jpg', fit: BoxFit.cover,),
    			],
            	
            	indicatorBgPadding: 5.5,
  			),
			
		);
	}
}