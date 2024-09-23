import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:necstaff/models/EventDetatils.dart';
import 'package:necstaff/utils.dart';

getAllHomefunction() async {
  final request = ModelQueries.list(EventDetatils.classType);
  final response = await Amplify.API.query(request: request).response;
  List res = graphqlResponseHandle(
      response: [response],
      function: () {
        List<EventDetatils?>? events = response.data?.items;
        if (events != null) {
          List<EventDetatils> eventlist = [];
          for (int i = 0; i < events.length; i++) {
            eventlist.add(events[i]!);
          }
          return eventlist;
        } else {
          safePrint('No events found');
        }
      });
  return res;
}
