// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necstaff/common/error_unknown.dart';
import 'package:necstaff/common/errorscreen.dart';
import 'package:necstaff/request/rolebloc/roles_bloc.dart';
import 'package:necstaff/request/ui/pages/ac_page.dart';
import 'package:necstaff/request/ui/pages/hod_page.dart';
import 'package:necstaff/request/ui/pages/proctor_page.dart';

class RequestsScreen extends StatefulWidget {
  final List<String> useratributes;
  const RequestsScreen({
    super.key,
    required this.useratributes,
  });

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RolesBloc>(context)
        .add(GetAllStaffDetailsEvent(email: widget.useratributes[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Roles'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Color.fromARGB(255, 212, 197, 61)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BlocBuilder<RolesBloc, RolesState>(
        builder: (context, state) {
          if (state is GetAllStaffDetailsSuccessState) {
            final List<Widget> pages = [
              ProctorPage(
                proctorslist: state.proctordatalist,
              ),
               AcademicCoordinatorPage(
                acdatalist: state.acdatalist,
              ),
              HodPage(
                hoddatalist: state.hodlist,
              ),
            ];
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Color.fromARGB(255, 212, 197, 61)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSelectionButton(0, 'Proctor'),
                      _buildSelectionButton(1, 'Academic Coordinator'),
                      _buildSelectionButton(2, 'HOD'),
                    ],
                  ),
                ),
                Expanded(
                  child: pages[_selectedIndex],
                ),
              ],
            );
          }
          if (state is GetAllStaffDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is GetAllStaffDetailsFailureState){
            return const ErrorScreen();
          }
           else {
            return const ErrorUnkown();
          }
        },
      ),
    );
  }

  Widget _buildSelectionButton(int index, String title) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: _selectedIndex == index ? Colors.orange[300] : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
