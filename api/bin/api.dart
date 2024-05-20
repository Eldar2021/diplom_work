import 'package:api/api.dart';

void main() async {
  final filePath = './data/tr/014';
  for (var i = 1; i < 6; i++) {
    await createPaste(
      uploadFile: '$filePath/$i.md',
      downloadFile: '$filePath/links.md',
    );
  }
}
