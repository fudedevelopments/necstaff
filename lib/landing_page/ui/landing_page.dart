// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necstaff/account/account_screen.dart';
import 'package:necstaff/common/error_unknown.dart';
import 'package:necstaff/home/ui/home.dart';
import 'package:necstaff/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:necstaff/landing_page/userattributesbloc/userattributes_bloc.dart';
import 'package:necstaff/request/request_screen.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.request_page_outlined), label: "Requests"),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserattributesBloc>(context).add(GetUserAttributesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserattributesBloc, UserattributesState>(
      builder: (context, state) {
        if (state is GetUserAttributesSuccessState) {
          List<Widget> bottomnaviScreen = [
             MainScreen(useratributes: state.attributes,),
             RequestsScreen(useratributes: state.attributes),
             AccountScreen(useratributes: state.attributes,),
          ];
          return BlocConsumer<LandingPageBloc, LandingPageState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: Center(
                  child: bottomnaviScreen.elementAt(state.tabindex),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: bottomnavItem,
                  currentIndex: state.tabindex,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  onTap: (index) {
                    BlocProvider.of<LandingPageBloc>(context)
                        .add(TabChangeEvent(tabindex: index));
                  },
                ),
              );
            },
          );
        }
        if (state is GetUserAttributesLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold(body: ErrorUnkown());
        }
      },
    );
  }
}
