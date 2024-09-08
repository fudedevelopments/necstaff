import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()async{
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  withData: false,
                  withReadStream: true,
                  allowedExtensions: ['jpg', 'png', 'gif'],
                );
               
                if (result == null) {
                  safePrint('No file selected');
                  return;
                }
                final platformFile = result.files.single;
                try {
                  final result = await Amplify.Storage.uploadFile(
                    localFile: AWSFile.fromStream(
                      platformFile.readStream!,
                      size: platformFile.size,
                    ),
                    path: StoragePath.fromString('myImage/${uuid()}'),
                    onProgress: (progress) {
                      safePrint('Fraction completed: ${progress.fractionCompleted}');
                    },
                  ).result;
                  safePrint('Successfully uploaded file: ${result.uploadedItem.path}');
                } on StorageException catch (e) {
                  safePrint(e.message);
                }
        }, child: const Text
        ("ksd"))
      ),
    );
  }
}