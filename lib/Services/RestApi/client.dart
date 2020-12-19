import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zaka/Services/Model/ServiceProduct.dart';
import 'package:zaka/Services/Model/ServiceCategory.dart';
import 'package:zaka/Services/Model/cities.dart';
import 'package:zaka/Services/Model/ingredients.dart';
	
	
	//Получение всех Ингредиентов
	Future<List<Ingredients>> getIngredients() async 
  	{	
		var client = http.Client();
  		final response = await client.get('https://zakajuka.ru/api/ingredients');
 		return compute(getResponseIngridients, response.body);
	}
	List<Ingredients> getResponseIngridients(String responseBody) 
	{
  		final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  		return parsed.map<Ingredients>((json) => Ingredients.fromJson(json)).toList();
	}
	//Получение всех продуктов
	Future<List<Product>> getProducts() async 
  	{	
		var client = http.Client();
  		final response = await client.get('https://zakajuka.ru/api/products');
 		return compute(getResponseProducts, response.body);
	}
	List<Product> getResponseProducts(String responseBody) 
	{
  		final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  		return parsed.map<Product>((json) => Product.fromJson(json)).toList();
	}

	//Получение всех категорий
	Future<List<Categori>> getCategories() async
	{	
		var clients = http.Client();
		final categories = await clients.get('https://zakajuka.ru/api/categories');
    	
		return getResponseCategoryes(categories.body);
	}
	List<Categori> getResponseCategoryes(String responseBody) 
	{
  		final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  		return parsed.map<Categori>((json) => Categori.fromJson(json)).toList();
	}
	
  	//Получение всех городов и минимального заказа
	Future<List<City>> getCities() async
	{	
		var clients = http.Client();
		final cities = await clients.get('https://zakajuka.ru/cities');
    	
		return getResponseCities(cities.body);
	}
	List<City> getResponseCities(String responseBody) 
	{
  		final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  		return parsed.map<City>((json) => City.fromJson(json)).toList();
	}
	
	
	