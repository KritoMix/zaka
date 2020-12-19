import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:zaka/Repository/Model/product.dart';
import 'package:zaka/Services/Model/cities.dart';



class Order
{
	Order()
	{
		products = new List<ProductM>();
		namePerson = "имя не введено";
		namberPerson = "000";
		emaylPerson = "нет Emayla";
		data = "null";
		descriptionPerson = "null";
		prepayment = false;
		summ = 0;	
	}
	String namePerson;
	String namberPerson;
	String emaylPerson;
	String data;
	String descriptionPerson;
	bool prepayment;
	double summ;
	List<ProductM> products;

}

class BasketState 
{
	BasketState()
	{
		products = new List<ProductM>();
		summ = 0;
		prepayment = 0;
		countProducts = 0;
		currentSumm = 0;
	
  	}
  	double summ;
  	double prepayment;
  	List<ProductM> products;
    int countProducts;
	double currentSumm;

}

class BasketService extends StatesRebuilder
{
	
	Order order = new Order();
	BasketState basket = new BasketState();
	City currentCity;
	bool basketPrepayment = false;
	bool prepaymentController = false;
	bool bascetReverceController = true;
	
	bool isOneMyDelivery = false;
	bool isMyMemory = false;

	setMyDelivery(bool value)
	{
		isOneMyDelivery = value;
	}
	setMyMemory(bool value)
	{
		isMyMemory = value;
	}


  	setSity(City newSity)
	{
		currentCity = newSity;
	}
	//Удаление,Добавление товаров в корзину
	allDelete()
	{
		int countProduct = basket.products.length;
		for(int i = 0;i<countProduct;i++)
		{
			this.removeProducts(basket.products[i]);
		}
		basket.products.clear();
	}
	setProduct(ProductM product)
	{
		for(int i = 0;i<product.productInbasket;i++)
		{
			var newProduct = basket.products.any((p)=>p.id==product.id);
			if(newProduct)
			{
				basket.products.forEach
				(
					(p)
					{
						if(p.id==product.id)
						{
							p.countProduct+=1;
							basket.summ+=product.price;
							basket.prepayment=basket.summ/2;
              				setSumm(basketPrepayment);
							verificationPrepayment();
						}
					
					}
				);
			}
			else
			{
				basket.products.add(product);
				basket.summ+=product.price;
				basket.prepayment=basket.summ/2;
    			setSumm(basketPrepayment);
				basket.countProducts+=1;
				verificationPrepayment();
			}
		}	
		rebuildStates(['set']);
	}
	removeProduct(ProductM product)
	{
		basket.products.forEach
		(
			(p)
			{
				if(p.id == product.id)
				{
					if(p.countProduct>1)
					{
						p.countProduct-=1;
						basket.summ-=p.price;
						basket.prepayment=basket.summ/2;
						setSumm(basketPrepayment);
						verificationPrepayment();
					}
					else
					{
						basket.summ-=p.price;
						basket.prepayment=basket.summ/2;
    					setSumm(basketPrepayment);
						basket.products.remove(product);
						basket.countProducts-=1;
						verificationPrepayment();
						rebuildStates(['set']);
					}
				}
			}
		);
  		rebuildStates(['set']);
	}
	removeProducts(ProductM product)
	{
		int countProduct = product.countProduct;
		basket.products.forEach
		(
			(p)
			{
				if(p.id == product.id)
				{
					for(int i = 0;i<countProduct;i++)
					{
						if(p.countProduct>1)
						{
							p.countProduct-=1;
							basket.summ-=p.price;
							basket.prepayment=basket.summ/2;
							setSumm(basketPrepayment);
							verificationPrepayment();
						}
						else
						{
							basket.summ-=p.price;
							basket.prepayment=basket.summ/2;
							setSumm(basketPrepayment);
							//basket.products.remove(product);
							basket.countProducts-=1;
							verificationPrepayment();
						}
					}
					
				}
			}
		);
		rebuildStates(['set']);
	}
	//изменение состояния предоплаты
	setSumm(bool chek)
	{
		basketPrepayment = chek;
		if(chek)
		{
			basket.currentSumm = basket.prepayment;
			rebuildStates(['setSumm']);
		}
		else
		{
			basket.currentSumm = basket.summ;
			rebuildStates(['setSumm']);
		}
	}

	//Изменение состояния по сумме предоплаты
	verificationPrepayment()
	{
		if(basket.summ>currentCity.minCost)
		{
			bascetReverceController = false;
			prepaymentController = true;
		}
		else
		{	
			prepaymentController = false;
			bascetReverceController = true;
		}
	}

}
