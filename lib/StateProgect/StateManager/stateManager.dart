
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
class CustomCacheManager extends BaseCacheManager 
{
  	static const key = "customCachk";
	
  	static CustomCacheManager _instance;

  	factory CustomCacheManager() 
	{
    	if (_instance == null) {
      	_instance = new CustomCacheManager._();
    }
    return _instance;
  }

  CustomCacheManager._() : super(key,
      maxAgeCacheObject: Duration(days: 7),
      maxNrOfCacheObjects: 20,

      //fileFetcher: _customHttpGetter
	  );


	
 	Future<String> getFilePath() async 
  	{
    	var directory = await getTemporaryDirectory();
   	 	return p.join(directory.path, key);
  	}
	setFile(String key,int data)
	{	
		
		removeFile(data.toString());
		List<int> list = data.toString().codeUnits;
		Uint8List bytes = Uint8List.fromList(list);
		putFile(key, bytes);
	}
	Future<int>  getMyFile(String key) async
	{
		
		var file = await getSingleFile(key);
		if(file!=null)
		{
			var bytes = await file.readAsBytes();	
			return int.parse(String.fromCharCodes(bytes));
		}else return null;	 	
	}
}