import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http ;

import '../../constances/strings.dart';
import '../../constances/token.dart';

class RadiographApi {
  static Future getRadiograph() async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/examinations/radiograph"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getRadiographNotification() async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/notification/radio"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future readNot(int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/notification/radio/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future addResponse(int id , PlatformFile image , PlatformFile pdf) async {
    var headers = {
      'token': Token.token,
      "Accept": "application/json",
      'Content-Type': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse('${Strings.api}/examinations/radiograph/response/$id'));
    request.files.add(http.MultipartFile.fromBytes('pdf', pdf.bytes! , filename: pdf.name));
    request.files.add(http.MultipartFile.fromBytes('image', image.bytes! , filename: image.name));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString() ;
    }
    else {
      print(response.reasonPhrase);
    }


  }
  //
  // static Future<Uint8List> _readFileBytes(html.File file, html.FileReader reader) {
  //   final completer = Completer<Uint8List>();
  //   reader.readAsArrayBuffer(file);
  //   reader.onLoadEnd.listen((_) {
  //     if (reader.result != null) {
  //       // Convert ArrayBuffer to Uint8List
  //       final buffer = reader.result as Uint8List;
  //       completer.complete(buffer);
  //     } else {
  //       completer.completeError('Failed to read file');
  //     }
  //   });
  //   reader.onError.listen((error) {
  //     // Handle error
  //     completer.completeError(error);
  //   });
  //   return completer.future;
  // }
}