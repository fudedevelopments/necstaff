import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:necstaff/add_events/bloc/addevent_bloc.dart';
import 'package:necstaff/home/ui/home.dart';
import 'package:necstaff/landing_page/ui/landing_page.dart';
import 'package:necstaff/utils.dart';

class EventAddlist extends StatefulWidget {
  const EventAddlist({super.key});

  @override
  State<EventAddlist> createState() => _EventAddlistState();
}

class _EventAddlistState extends State<EventAddlist> {
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _eventDetailsController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _registerUrlController = TextEditingController();

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDetailsController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _registerUrlController.dispose();
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
        _dateController.text = formattedDate;
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
                            "select Event",
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
        _buildTextField('Event Name', _eventNameController),
        const SizedBox(height: 16.0),
        _buildTextField(
          'Event Details',
          _eventDetailsController,
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
        _buildTextField('Register URL', _registerUrlController),
        const SizedBox(height: 32.0),
        SizedBox(
          width: double.infinity,
          height: 50.0,
          child: BlocConsumer<AddeventBloc, AddeventState>(
            listener: (context, state) {
              if (state is AddEventSuccesstate) {
                showsnakbar(context, "Event Added SuccessFully");
                navigatorpushandremove(context, const LandingPage());
              }
              if (state is AddEventFailurestate) {
                showsnakbar(context, "Failed in Add Event");
              }
            },
            builder: (context, state) {
              if (state is AddEventLoadingstate) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AddeventBloc>(context).add(
                        AddeventEventDetails(
                            eventimages: images,
                            eventname: _eventNameController.text,
                            details: _eventDetailsController.text,
                            date: _dateController.text,
                            location: _locationController.text,
                            registerurl: _registerUrlController.text));
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
                );
              }
            },
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
