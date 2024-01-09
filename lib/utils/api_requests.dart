import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:microcoils/utils/ApiUrls.dart';

class ApiRequest<ReqModel, ResModel> {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': '<Your token>'
  };
  Future<ResModel?> postLogin({
    required String url,
    required ReqModel request,
    required Function(String) reponseFromJson,
    required Function(ReqModel) requestToJson,
  }) async {
    // try {
    var uri = Uri.parse(ApiUrls.baseUrl + url);
    log("ApiRequest POST : $uri");
    log("ApiRequest Body : ${requestToJson(request)}");
    var response = await http.post(
      uri,
      body: requestToJson(request),
      headers: requestHeaders,
    );

    log("ApiRequest Response ${response.statusCode} : ${response.body}");
    if (response.statusCode == 202 || response.statusCode == 200) {
      try {
        ResModel responseModel = reponseFromJson(response.body);
        return responseModel;
        log(response.body);
        Map<String, dynamic> parsedData = json.decode(response.body);
        if (parsedData["statusCode"] == 200) {
          ResModel responseModel = reponseFromJson(response.body);
          return responseModel;
        }
        if (parsedData["statusCode"] == 202) {
          ResModel responseModel = reponseFromJson(response.body);
          return responseModel;
        }
      } catch (e) {
        return null;
      }
    }
    return null;
    // } catch (e) {
    //   return null;
    // }
  }

  Future<ResModel?> post({
    required String url,
    required ReqModel request,
    required Function(String) reponseFromJson,
    required Function(ReqModel) requestToJson,
  }) async {
    // try {
    var uri = Uri.parse(ApiUrls.baseUrl + url);
    log("ApiRequest POST : $uri");
    log("ApiRequest Body : ${requestToJson(request)}");
    var response = await http.post(
      uri,
      body: requestToJson(request),
      headers: requestHeaders,
    );
    log("ApiRequest Response ${response.statusCode} : ${response.body}");
    if (response.statusCode == 202 || response.statusCode == 200) {
      try {
        ResModel responseModel = reponseFromJson(response.body);
        return responseModel;
      } catch (e) {
        return null;
      }
    }
    return null;
    // } catch (e) {
    //   return null;
    // }
  }
}
