// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/constants.dart';

Future<String> uploadFiles(File file) async => Isolate.run<String>(
      () async {
        try {
          final Dio dio = Dio();
          final Response result = await dio.post(
            '${Constants.baseUrl}${Urls.fileUpload}',
            options: Constants.requestOptionsWithoutIds,
            queryParameters: {'folder_name': jsonEncode('Media')},
            data: FormData.fromMap(
              {
                'file': await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last,
                ),
              },
            ),
          );
          if (result.statusCode == 200 || result.statusCode == 201) {
            return 'https://cdn.u-code.io/${result.data['data']['link']}';
          } else {
            return 'https://cdn.u-code.io/${result.data['data']['link']}';
          }
        } on Exception catch (e, s) {
          debugPrint('uploadFile error: $e $s');
          return 'FILE_UPLOAD_ERROR';
        }
      },
    );
