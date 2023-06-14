import 'package:api/api.dart';

void main() async {
  final filePath = './data/tr/006';
  for (var i = 1; i < 4; i++) {
    await createPaste(
      uploadFile: '$filePath/$i.md',
      downloadFile: '$filePath/links.md',
    );
  }

  // await getPaste(id: 'UuHHv', fileName: 'test');
  // await updatePaste(id: 'AaroC', fileName: '002');
  // await deletePaste(id: 'UuHHv');
}
