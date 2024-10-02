import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necstaff/models/ModelProvider.dart';
import 'package:necstaff/utils.dart';

getallStaffDetailsfunction(String email) async {
//req proc
  final reqProctor =
      ModelQueries.list(Proctor.classType, where: Proctor.EMAIL.eq(email));
  final proctorResponse = await Amplify.API.query(request: reqProctor).response;
//ac query
  final reqAc = ModelQueries.list(Ac.classType, where: Ac.EMAIL.eq(email));
  final acResponse = await Amplify.API.query(request: reqAc).response;
//hod query
  final reqHod = ModelQueries.list(Hod.classType, where: Hod.EMAIL.eq(email));
  final hodResponse = await Amplify.API.query(request: reqHod).response;

  List res = graphqlResponseHandle(
      response: [proctorResponse, acResponse, hodResponse],
      function: () {
        // Proctor list handle
        List<Proctor> proctorlist = [];
        final proctorResitems = proctorResponse.data?.items;
        if (proctorResitems != null) {
          for (int i = 0; i < proctorResitems.length; i++) {
            proctorlist.add(proctorResitems[i]!);
          }
        }
        // AC list handle
        List<Ac> aclist = [];
        final acResitems = acResponse.data?.items;
        if (acResitems != null) {
          for (int i = 0; i < acResitems.length; i++) {
            aclist.add(acResitems[i]!);
          }
        }
        // Hod list handle
        List<Hod> hodlist = [];
        final hodResitems = hodResponse.data?.items;
        if (hodResitems != null) {
          for (int i = 0; i < hodResitems.length; i++) {
            hodlist.add(hodResitems[i]!);
          }
        }
        return [proctorlist, aclist, hodlist];
      });
  return res;
}

getallclassRoomDetailByProctorFunction(String proctorid) async {
  final proctorclassroomrequest = ModelQueries.list(Student.classType,
      where: Student.PROCTOR.eq(proctorid));
  final proctorstudentresponse =
      await Amplify.API.query(request: proctorclassroomrequest).response;
  safePrint(proctorstudentresponse);
}

getllOndutyrequestByProctorFunction(String proctorid) async {
  final proctorondutyrequest = ModelQueries.list<Ondutyrequest>(
      Ondutyrequest.classType,
      where: Ondutyrequest.PROCTOR.eq(proctorid));
  final response =
      await Amplify.API.query(request: proctorondutyrequest).response;
  List res = graphqlResponseHandle(
      response: [response],
      function: () {
        final ondutylist = response.data?.items ?? [];
        return ondutylist;
      });
  return res;
}
