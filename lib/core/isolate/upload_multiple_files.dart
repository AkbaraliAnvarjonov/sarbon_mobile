import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;

import '../../../../../../constants/constants.dart';

Future<Map<File, String>> uploadMultipleFiles(List<File?> files) async {
  try {
    final Dio dio = Dio();
    final Map<File, String> uploadedUrlsMap = {};

    await Future.wait(
      files.map((file) async {
        if (file == null) return;

        // Check if the file is an image and resize it
        final String type = file.path.split('.').last;
        File processedFile = file;
        if (type == 'jpg' || type == 'png') {
          processedFile = await compute(processImage, file);
        }

        int retryCount = 0;
        const int maxRetries = 10;
        bool uploadSuccess = false;

        while (!uploadSuccess && retryCount < maxRetries) {
          try {
            // Create a new FormData instance for each attempt
            final data = FormData();
            final String fileName = processedFile.path.split('/').last;
            data.files.add(
              MapEntry(
                'file',
                await MultipartFile.fromFile(
                  processedFile.path,
                  filename: fileName,
                  contentType: MediaType(
                    type == 'jpg' || type == 'png' ? 'image' : 'document',
                    type,
                  ),
                ),
              ),
            );

            print(
                'Uploading file ${processedFile.path}, size: ${processedFile.lengthSync() / 1024} KB (Attempt ${retryCount + 1})');

            final result = await dio.fetch<Map<String, dynamic>>(
              Options(
                method: 'POST',
                headers: {
                  'Authorization': 'API-KEY',
                  'X-API-KEY': Constants.apiKey,
                },
              )
                  .compose(
                    dio.options,
                    'upload',
                    queryParameters: {'folder_name': jsonEncode('Media')},
                    data: data,
                  )
                  .copyWith(
                    baseUrl: Constants.uploadUrl,
                  ),
            );

            if (result.statusCode == 200 || result.statusCode == 201) {
              final url = type == 'jpg' || type == 'png'
                  ? (Constants.cdnImage + result.data?['data']['filename'])
                  : (Constants.cdnDocs + result.data?['data']['filename']);
              uploadedUrlsMap[file] = url;
              uploadSuccess = true;
              print('Upload successful for file: ${processedFile.path}');
            } else {
              throw Exception('Failed to upload file: ${result.statusCode}');
            }
          } catch (e) {
            retryCount++;
            if (retryCount >= maxRetries) {
              print('Upload failed for file: ${processedFile.path} after $maxRetries attempts');
              throw Exception('Failed to upload file after $maxRetries attempts: $e');
            }
            print('Retrying upload for file: ${processedFile.path} (Attempt ${retryCount + 1})');
          }
        }
      }),
    );

    return uploadedUrlsMap;
  } on Exception catch (e, s) {
    log('uploadFiles error: $e $s');
    rethrow; // Rethrow the exception to handle it in the caller function
  }
}

Future<File> processImage(File file) async {
  final bytes = await file.readAsBytes();
  final image = img.decodeImage(bytes);

  if (image == null) {
    throw Exception("Unable to decode image");
  }

  int quality = 100; // Start with the highest quality
  File processedFile = file;
  do {
    final resizedImage = img.copyResize(image, width: 1024); // Example: Resize width to 1024px
    final resizedBytes = img.encodeJpg(resizedImage, quality: quality);

    processedFile = File('${file.path}_processed.jpg');
    await processedFile.writeAsBytes(resizedBytes);

    if (processedFile.lengthSync() <= 1 * 400 * 400) {
      break;
    }

    quality -= 10; // Reduce quality by 10% each iteration
  } while (quality > 0);

  if (processedFile.lengthSync() > 1 * 400 * 400) {
    throw Exception("Failed to process image under 400kb");
  }

  return processedFile;
}
