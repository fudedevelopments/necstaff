import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:necstaff/utils.dart';

class AnnounceList extends StatefulWidget {
  const AnnounceList({super.key});

  @override
  State<AnnounceList> createState() => _AnnounceListState();
}

class _AnnounceListState extends State<AnnounceList> {
    final _formKey = GlobalKey<FormState>();

  TextEditingController _announceNameController = TextEditingController();
  TextEditingController _announceDetailsController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _announceNameController.dispose();
    _announceDetailsController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate; // Set the chosen date
      });
    }
  }

  selectImages() async {
    var result = await pickImages();
    setState(() {
      images = result;
    });
  }

  List<File> images = [];


  @override
   Widget build(BuildContext context) {
    return Column(
      children: [
        images.isNotEmpty
            ? CarouselSlider(
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) => Image.file(
                      i,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(viewportFraction: 2, height: 200),
              )
            : GestureDetector(
                onTap: selectImages,
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          Text(
                            "select Announcement image",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
        const SizedBox(
          height: 20,
        ),

        _buildTextField('Announcement Name', _announceNameController),
        const SizedBox(height: 16.0),

        _buildTextField(
          'Announcement Details',
          _announceDetailsController,
          maxLines: 6,
          minLines: 6,
        ),

        const SizedBox(height: 16.0),

        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(
            labelText: 'Date',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.teal),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.blueAccent),
            ),
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            _selectDate(context);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a date';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),

        _buildTextField('Location', _locationController),
        const SizedBox(height: 16.0),

        const SizedBox(height: 32.0),

        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('announce Name: ${_announceNameController.text}');
                print('announce Details: ${_announceDetailsController.text}');
                print('Date: ${_dateController.text}');
                print('Location: ${_locationController.text}');
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.all(0.0),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.teal, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


Widget _buildTextField(String labelText, TextEditingController controller,
    {int? maxLines, int? minLines}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: Colors.teal),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: Colors.blueAccent),
      ),
    ),
    maxLines: maxLines,
    minLines: minLines,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $labelText';
      }
      return null;
    },
  );
}
