import 'package:api/api.dart';

void main() async {
  final langs = [
    'en',
    'ky',
    'ru',
    'tr',
  ];

  final lessons = [
    '001',
    '002',
    '003',
    '004',
    '005',
    '006',
    '007',
    '008',
    '009',
    '010',
    '011',
    '012',
    '013',
    '014',
  ];

  for (var lan in langs) {
    for (var lesson in lessons) {
      final filePath = './data/$lan/$lesson';
      for (var i = 1; i < 6; i++) {
        await createPaste(
          uploadFile: '$filePath/$i.md',
          downloadFile: '$filePath/links.md',
        );
      }
    }
  }
}
