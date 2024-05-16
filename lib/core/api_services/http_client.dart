import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'apis.dart';
import 'logging_interceptor.dart';

abstract class ApiServices {
  Future<http.Response> getRequest(
      {required String urlEndpoint,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters});

  Future<String> postRequest(
      {required String urlEndpoint,
      required Map<String, dynamic> body,
      Map<String, String>? headers});

  Future<http.Response> patchRequest(
      {required String urlEndpoint,
      required Map<String, dynamic> body,
      Map<String, String>? headers});

  Future<http.Response> multipartRequest({
    required String urlEndpoint,
    Map<String, String>? headers,
    required Map<String, String> formData,
    List<String>? imagesList,
    String? fileKey,
    List<Map<String, String>>? multipartData,
  });

  retryTimeOutWhenDataIsNotFetched();
}

class ApiServicesImpl implements ApiServices {

  ApiServicesImpl();

  Map<String, String> createHeaders(Map<String, String>? headers) {
    Map<String, String> commonHeaders = {
      'Content-Type': 'application/json',
      'x-api-secret': 'test',
      'x-api-key': 'test',
      'Accept': '*/*',
    'Authorization': 'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'
    };
    if (headers != null) commonHeaders.addAll(headers);
    return commonHeaders;
  }

  Map<String, String> createMultipartHeaders(Map<String, String>? headers) {
    Map<String, String> commonHeaders = {
      'content-type': 'application/json',
      'User-Hash': '',
      'Api-Key': ''
    };
    commonHeaders.addAll(
        {'Authorization': 'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'});


    if (headers != null) commonHeaders.addAll(headers);
    return commonHeaders;
  }

  Uri parseURI(String urlEndpoint) {
    return Uri.parse('${Urls.baseUrl}${Urls.apiVersion}$urlEndpoint');
  }

  Map<String, dynamic> parseQueryParameters(
      Map<String, dynamic> queryParameters) {
    Map<String, dynamic> parsedQueryParameters = {};
    queryParameters.forEach((key, value) {
      if (value is List) {
        parsedQueryParameters
            .addAll({key: value.map((e) => e.toString()).toList()});
      } else {
        parsedQueryParameters.addAll({key: value.toString()});
      }
    });
    return parsedQueryParameters;
  }

  @override
  Future<http.Response> getRequest({required String urlEndpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await http.get(parseURI(urlEndpoint),
          headers: createHeaders(headers));
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Login Required");
      } else {
        throw Exception('Status Code Mismatch ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> postRequest({required String urlEndpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers}) async {
    try {
      final dio = Dio();
      debugPrint(jsonEncode(body));
      final response =
      await dio.post('${Urls.baseUrl}${Urls.apiVersion}$urlEndpoint',
          // queryParameters: body,
          data: jsonEncode(body),
          options: Options(headers: {
            'Content-Type': 'application/json',
            "Accept": "*/*",
            'x-api-key': 'test',
            'x-api-secret': 'test',
          }, validateStatus: (status) {
            return status! <= 500;
          }));
      debugPrint('${response.data}');
      if (response.statusCode == 200 || response.statusCode == 422) {
        return jsonEncode(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Login Required");
      } else {
        throw Exception(jsonDecode(response.data.body)['message'] ?? '');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<http.MultipartFile>> _getMultipartFile(List<String> photos,
      String? key) async {
    List<http.MultipartFile> newList = <http.MultipartFile>[];
    for (var img in photos) {
      if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath(
          '$key',
          File(img).path,
          filename: img
              .split('/')
              .last,
        );
        newList.add(multipartFile);
      }
    }
    return newList;
  }



  @override
  Future<http.Response> multipartRequest({
    required String urlEndpoint,
    Map<String, String>? headers,
    required Map<String, String> formData,
    List<String>? imagesList,
    String? fileKey,
    List<Map<String, String>>? multipartData,
  }) async {
    try {
      var request = http.MultipartRequest('POST', parseURI(urlEndpoint));
      request.headers.addAll(createMultipartHeaders(headers));
      if (imagesList != null) {
        var listImages = _getMultipartFile(imagesList, fileKey);
        request.files.addAll(await listImages);
      }
      if (multipartData != null) {
        for (var e in multipartData) {
          request.files.add(
            await http.MultipartFile.fromPath(
                e.keys.toList()[0], e.values.toList()[0],
                filename: e.values.toList()[0].split('/').last),
          );
        }
      }

      if (formData.containsKey("bridge_doc")) {
        var multipartFile = await http.MultipartFile.fromPath(
          'bridge_doc',
          File(formData['bridge_doc']!).path,
          filename: formData['bridge_doc']!.split('/').last,
        );
        request.files.add(multipartFile);
        formData.remove('bridge_doc');
      }

      if (formData.containsKey("lr_doc")) {
        var multipartFile = await http.MultipartFile.fromPath(
          'lr_doc',
          File(formData['lr_doc']!).path,
          filename: formData['lr_doc']!.split('/').last,
        );
        request.files.add(multipartFile);
        formData.remove('lr_doc');
      }

      request.fields.addAll(formData);
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200 || response.statusCode == 422) {
        return responsed;
      } else if (response.statusCode == 401) {
        throw Exception("Login Required");
      } else {
        throw Exception(
            'Status Code Mismatch ${response.statusCode} ${(responsed).body}');
      }
    } catch (e) {
      e.printError();
      throw Exception(e.toString());
    }
  }

  @override
  Future<http.Response> patchRequest(
      {required String urlEndpoint,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    try {
      Client client =
          InterceptedClient.build(interceptors: [LoggingInterceptor()]);

      final response = await client.patch(parseURI(urlEndpoint),
          headers: createHeaders(headers), body: jsonEncode(body));
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Login Required");
      } else {
        throw Exception('Status Code Mismatch ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  retryTimeOutWhenDataIsNotFetched() {

  }
}
