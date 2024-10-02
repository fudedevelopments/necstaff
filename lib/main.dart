import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necstaff/add_events/bloc/addevent_bloc.dart';
import 'package:necstaff/amplify_outputs.dart';
import 'package:necstaff/firebase/firebase_api.dart';
import 'package:necstaff/home/bloc/home_bloc.dart';
import 'package:necstaff/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:necstaff/landing_page/ui/landing_page.dart';
import 'package:necstaff/landing_page/userattributesbloc/userattributes_bloc.dart';
import 'package:necstaff/models/ModelProvider.dart';
import 'package:necstaff/request/bloc/staff_bloc.dart';
import 'package:necstaff/request/rolebloc/roles_bloc.dart';

Future<void> _configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    final api = AmplifyAPI(
        options: APIPluginOptions(modelProvider: ModelProvider.instance));
    final storage = AmplifyStorageS3();
    final analyticsPinPoint = AmplifyAnalyticsPinpoint();
    await Amplify.addPlugins([auth, api, storage, analyticsPinPoint]);
    await Amplify.configure(amplifyConfig);
  } on AmplifyException catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LandingPageBloc(),
        ),
        BlocProvider(
          create: (context) => AddeventBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => UserattributesBloc(),
        ),
        BlocProvider(
          create: (context) => RolesBloc(),
        ),
        BlocProvider(
          create: (context) => StaffBloc(),
        )
      ],
      child: const MyApp(),
    ));
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: Authenticator.builder(),
          home: const LandingPage()),
    );
  }
}
