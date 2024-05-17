import '../../constants/constants.dart';
import 'package:http/http.dart' as http;

class HttpHelper{


  static Future<http.Response> getData(
      {required String url,
        Map<String,dynamic>? query,
        String lang ='en',
        dynamic token
      }
      )async{


    var uri=buildUrl(url, query);

    return await http.get(uri,headers: {
      'Content-Type' : 'application/json',
      'lang': lang,
      'Authorization': token??''
    });
  }

  static Future postData(
      {
        required String url ,
        required dynamic data,
        dynamic query,
        String lang ='en',
        dynamic token
      }
      )async{

    var uri=buildUrl(url, query);

    return await http.post(uri,headers: {
      'lang': lang,
      'Authorization': token??''
    },body:
        data
    );
  }


  static Uri buildUrl(String path, Map<String, dynamic>? queryParameters) {
    var uri = Uri.parse(baseUrl);
    uri = uri.replace(path: uri.path + path);

    if (queryParameters !=null) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return uri;
  }




}