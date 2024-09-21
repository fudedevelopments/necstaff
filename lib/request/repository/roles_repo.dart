import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necstaff/models/ModelProvider.dart';
import 'package:necstaff/utils.dart';

getallStaffDetailsfunction(String email) async {
  final reqproctor =
      ModelQueries.list(Proctor.classType, where: Proctor.EMAIL.eq(email));
  final response = await Amplify.API.query(request: reqproctor).response;
  final proctorResponse = response.data?.items;
  List res = graphqlresponsehandle(
    response: response,
    function: () {
      List<Proctor> proctordatalist = [];
      if (proctorResponse != null) {
        for (int i = 0; i < proctorResponse.length; i++) {
          proctordatalist.add(proctorResponse[i]!);
        }
        return proctordatalist;
      } 
    },
  );
  return res;
}
