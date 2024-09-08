// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necstaff/account/account_screen.dart';
import 'package:necstaff/home/ui/home.dart';
import 'package:necstaff/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:necstaff/request/request_screen.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.request_page_outlined), label: "Requests"),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
];

List<Widget> bottomnaviScreen = [
  const MainScreen(),
  const RequestsScreen(),
  const AccountScreen(),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
}
