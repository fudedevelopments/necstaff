import 'package:amplify_flutter/amplify_flutter.dart';

Future<List<String>> fetchUserAttributes() async {
  try {
    final result = await Amplify.Auth.fetchUserAttributes();

    String name = '';
    String email = '';

    for (final element in result) {
      if (element.userAttributeKey.toString() == 'sub') {
        name = element.value;
      } else if (element.userAttributeKey.toString() == 'email') {
        email = element.value;
      }
    }
    return [name, email];
  } catch (e) {
    safePrint(e.toString());
    return ['', ''];
  }
}
