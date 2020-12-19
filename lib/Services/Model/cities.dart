
class City
{
  	int id;
 	String name;
  	String slug;
  	int enabled;
 	String nameProcessive;
  	int minCost;
	int	newYearCost;
  	
	City
	(
		{
			this.id, 
			this.name, 
			this.slug, 
			this.enabled,
			this.nameProcessive,
			this.minCost,
			this.newYearCost
		}
	);

  	City.fromJson(Map<String, dynamic> json) 
	{
		id = json['id'];
		name = json['name'];
		slug = json['slug'];
		enabled = json['enabled'];
		nameProcessive = json['name_processive'];
		minCost = json['min_cost'];
		newYearCost = json['new_year_cost'];
  	}

	Map<String, dynamic> toJson() 
	{
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['slug'] = this.slug;
		data['enabled'] = this.enabled;
		data['name_processive'] = this.nameProcessive;
		data['min_cost'] = this.minCost;
		data['new_year_cost'] = this.newYearCost;
		return data;
	}
}