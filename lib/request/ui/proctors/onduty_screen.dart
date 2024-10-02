import 'package:flutter/material.dart';

class OnDutyRequestScreen extends StatefulWidget {
  const OnDutyRequestScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnDutyRequestScreenState createState() => _OnDutyRequestScreenState();
}

class _OnDutyRequestScreenState extends State<OnDutyRequestScreen> {
  String selectedStatus = 'Pending';
  List<String> proctorStatus = ['Approved', 'Rejected', 'Pending'];

  List<String> documents = ['Document1.pdf', 'Document2.pdf'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onduty Request'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildElevatedField('Student Name :'),
            _buildElevatedField('Email : '),
            _buildElevatedField('Location :'),
            _buildElevatedField('Date'),
            _buildElevatedField('Register URL'),
            const SizedBox(height: 20),
            const Text(
              'Uploaded Documents',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDocumentList(),
            const SizedBox(height: 20),
            const Text(
              'Proctor Approval',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildProctorApproval(),
            const Spacer(),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedField(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade100, Colors.grey.shade300],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDocumentList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: documents.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade200, Colors.grey.shade300],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  documents[index],
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const Spacer(),
                const Icon(Icons.download)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProctorApproval() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade300, Colors.grey.shade500],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: selectedStatus,
        onChanged: (newValue) {
          setState(() {
            selectedStatus = newValue!;
          });
        },
        items: proctorStatus.map((status) {
          return DropdownMenuItem<String>(
            value: status,
            child: Text(status),
          );
        }).toList(),
        isExpanded: true,
        dropdownColor: Colors.grey.shade200,
        iconEnabledColor: Colors.white,
        underline: const SizedBox(),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow.shade600, Colors.orange.shade600],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade600,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // Handle confirmation action
          print("Confirm button pressed");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          'Confirm',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
