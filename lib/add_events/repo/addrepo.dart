import 'dart:io' show File;
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_common/vm.dart';
import 'package:necstaff/models/ModelProvider.dart';
import 'package:necstaff/utils.dart';

addevent(
    {required List<File> images,
    required String eventname,
    required String eventdetails,
    required String date,
    required String location,
    required String registerurl}) async {
  List<String> imagesres = await uploadFile(images);
  final eventmodel = EventDetatils(
      images: imagesres,
      eventname: eventname,
      eventdetails: eventdetails,
      date: date,
      location: location,
      registerurl: registerurl);
  final request = ModelMutations.create(eventmodel);
  final response = await Amplify.API.mutate(request: request).response;
  List res = graphqlResponseHandle(
      response: [response],
      function: () {
        null;
      });
  return res;
}

uploadFile(List<File> images) async {
  List<String> imageslist = [];
  for (int i = 0; i < images.length; i++) {
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFilePlatform.fromFile(images[i]),
      path: StoragePath.fromString('myImage/${uuid()}'),
    ).result;
    imageslist.add(result.uploadedItem.path);
  }
  return imageslist;
}
