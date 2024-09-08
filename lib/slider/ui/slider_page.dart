// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});

//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }

// class _SliderPageState extends State<SliderPage> {
//   List<File> slide1 = [];
//   List<File> slide2 = [];
//   List<File> slide3 = [];
//   List<File> slide4 = [];
//   List<File> slide5 = [];
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SliderBloc, SliderState>(
//       listener: (context, state) {
//         if (state is SliderAddLoadingState) {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               });
//         }
//         if (state is SliderAddSuccessState) {
//           showsnakbar(context, "Slider added Successfully");
//           Navigator.pop(context);
//         }
//       },
//       child: Scaffold(
//           body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             const Divider(
//               thickness: 5,
//             ),
//             const Text(
//               "All Slides",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.grey.shade200,
//                 title: const Text(
//                   "slide 1",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(slide1.isNotEmpty ? Icons.check : Icons.add),
//                       color: Colors.blue,
//                       onPressed: () async {
//                         var result = await sliderpickImages();
//                         setState(() {
//                           slide1 = result;
//                         });
//                       },
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           if (slide1.isNotEmpty) {
//                             BlocProvider.of<SliderBloc>(context).add(
//                                 AddSlider(sliderno: 1, sliderimages: slide1));
//                           }
//                           if (slide1.isEmpty) {
//                             showsnakbar(
//                                 context, "No image is added please add image");
//                           }
//                         },
//                         color: Colors.blue,
//                         tooltip: "Addimage",
//                         icon: const Icon(Icons.upload))
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.grey.shade200,
//                 title: const Text(
//                   "slide 2",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(slide2.isNotEmpty ? Icons.check : Icons.add),
//                       color: Colors.blue,
//                       onPressed: () async {
//                         var result = await sliderpickImages();
//                         setState(() {
//                           slide2 = result;
//                         });
//                       },
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           if (slide2.isNotEmpty) {
//                             BlocProvider.of<SliderBloc>(context).add(
//                                 AddSlider(sliderno: 2, sliderimages: slide2));
//                           }
//                           if (slide2.isEmpty) {
//                             showsnakbar(
//                                 context, "No image is added please add image");
//                           }
//                         },
//                         color: Colors.blue,
//                         tooltip: "Addimage",
//                         icon: const Icon(Icons.upload)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.grey.shade200,
//                 title: const Text(
//                   "slide 3",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(slide3.isNotEmpty ? Icons.check : Icons.add),
//                       color: Colors.blue,
//                       onPressed: () async {
//                         var result = await sliderpickImages();
//                         setState(() {
//                           slide3 = result;
//                         });
//                       },
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           if (slide3.isNotEmpty) {
//                             BlocProvider.of<SliderBloc>(context).add(
//                                 AddSlider(sliderno: 3, sliderimages: slide3));
//                           }
//                           if (slide3.isEmpty) {
//                             showsnakbar(
//                                 context, "No image is added please add image");
//                           }
//                         },
//                         color: Colors.blue,
//                         tooltip: "Addimage",
//                         icon: const Icon(Icons.upload)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.grey.shade200,
//                 title: const Text(
//                   "slide 4",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(slide4.isNotEmpty ? Icons.check : Icons.add),
//                       color: Colors.blue,
//                       onPressed: () async {
//                         var result = await sliderpickImages();
//                         setState(() {
//                           slide4 = result;
//                         });
//                       },
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           if (slide4.isNotEmpty) {
//                             BlocProvider.of<SliderBloc>(context).add(
//                                 AddSlider(sliderno: 4, sliderimages: slide4));
//                           }
//                           if (slide4.isEmpty) {
//                             showsnakbar(
//                                 context, "No image is added please add image");
//                           }
//                         },
//                         color: Colors.blue,
//                         tooltip: "Addimage",
//                         icon: const Icon(Icons.upload)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.grey.shade200,
//                 title: const Text(
//                   "slide 5",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(slide5.isNotEmpty ? Icons.check : Icons.add),
//                       color: Colors.blue,
//                       onPressed: () async {
//                         var result = await sliderpickImages();
//                         setState(() {
//                           slide5 = result;
//                         });
//                       },
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           if (slide5.isNotEmpty) {
//                             BlocProvider.of<SliderBloc>(context).add(
//                                 AddSlider(sliderno: 5, sliderimages: slide5));
//                           }
//                           if (slide5.isEmpty) {
//                             showsnakbar(
//                                 context, "No image is added please add image");
//                           }
//                         },
//                         color: Colors.blue,
//                         tooltip: "Addimage",
//                         icon: const Icon(Icons.upload)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
