import 'dart:io';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://paste.rs/';

Future<String> createPaste({
  required String uploadFile,
  required String downloadFile,
}) async {
  final data = await File(uploadFile).readAsString();
  final response = await http.post(Uri.parse(baseUrl), body: data);

  if (response.statusCode == 201) {
    await File(downloadFile).writeAsString(
      '\n$uploadFile-${response.body}',
      mode: FileMode.append,
    );
    return response.body;
  } else {
    throw 'Failed to create paste. Error: ${response.statusCode}';
  }
}

Future<void> getPaste({
  required String id,
  required String fileName,
}) async {
  final response = await http.get(Uri.parse('$baseUrl$id'));

  if (response.statusCode == 200) {
    final content = response.body;
    await File('./data/$fileName.md').writeAsString(content);
    print('Paste content: $content');
  } else {
    throw 'Failed to get paste. Error: ${response.statusCode}';
  }
}

Future<void> deletePaste({required String id}) async {
  final response = await http.delete(Uri.parse('$baseUrl$id'));

  if (response.statusCode == 200) {
    final file = File('./data/sources.md');
    await file.readAsString().then((value) => file.writeAsString(value.replaceAll(id, '{DELETED}')));
    print('Paste deleted successfully.');
  } else {
    throw 'Failed to delete paste. Error: ${response.statusCode}';
  }
}


// Future<void> updatePaste({required String id, required String fileName}) async {
//   final data = await File('./data/$fileName.md').readAsString();
//   final response = await http.put(Uri.parse('$baseUrl$id'), body: data);
//
//   if (response.statusCode == 200) {
//     print('Paste updated successfully.');
//   } else {
//     throw 'Failed to update paste. Error: ${response.statusCode}';
//   }
// }
