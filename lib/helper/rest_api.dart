import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/res/constants/base_urls.dart';

class ApiServices {
  static Future<List<dynamic>> getAPi({required String endPointUrl}) async {
    List<dynamic> data = [];
    final http.Response response = await http.get(
      Uri.parse('${BaseUrls.jsonApiUsrl}$endPointUrl'),
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      return data;
    }
  }
}
