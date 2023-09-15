// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_gallery/photo_gallery.dart';
// import 'package:transparent_image/transparent_image.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // List<Album>? _albums;
//   List<Medium>? _media;
//   bool _loading = false;

//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     initAsync();
//   }

//   Future<void> initAsync() async {
//     if (await _promptPermissionSetting()) {
//       List<Album> albums = await PhotoGallery.listAlbums();
//       List<Medium> allMedia = [];
//       for (var album in albums) {
//         MediaPage mediaPage = await album.listMedia();
//         allMedia.addAll(mediaPage.items);
//       }
//       setState(() {
//         // _albums = albums;
//         _loading = false;
//         _media = allMedia; // Assign _media here
//       });
//     } else {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   Future<bool> _promptPermissionSetting() async {
//     if (Platform.isIOS) {
//       if (await Permission.photos.request().isGranted ||
//           await Permission.storage.request().isGranted) {
//         return true;
//       }
//     }
//     if (Platform.isAndroid) {
//       if (await Permission.storage.request().isGranted ||
//           await Permission.photos.request().isGranted &&
//               await Permission.videos.request().isGranted) {
//         return true;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Photo gallery example'),
//         ),
//         body: _loading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : LayoutBuilder(
//                 builder: (context, constraints) {
//                   double gridWidth = (constraints.maxWidth - 20) / 3;
//                   double gridHeight = gridWidth + 33;
//                   double ratio = gridWidth / gridHeight;
//                   return Container(
//                     padding: const EdgeInsets.all(5),
//                     child: GridView.count(
//                       crossAxisCount: 3,
//                       mainAxisSpacing: 1.0,
//                       crossAxisSpacing: 1.0,
//                       children: <Widget>[
//                         ...?_media?.map(
//                           (medium) => GestureDetector(
//                             onTap: () => Navigator.of(context).push(
//                               MaterialPageRoute(
//                                   builder: (context) => ViewerPage(medium)),
//                             ),
//                             child: Container(
//                               color: Colors.grey[300],
//                               child: FadeInImage(
//                                 fit: BoxFit.cover,
//                                 placeholder: MemoryImage(kTransparentImage),
//                                 image: ThumbnailProvider(
//                                   mediumId: medium.id,
//                                   mediumType: medium.mediumType,
//                                   highQuality: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }

// class ViewerPage extends StatelessWidget {
//   final Medium medium;

//   ViewerPage(Medium medium) : medium = medium;

//   @override
//   Widget build(BuildContext context) {
//     DateTime? date = medium.creationDate ?? medium.modifiedDate;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => Navigator.of(context).pop(),
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           title: date != null ? Text(date.toLocal().toString()) : null,
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           child: medium.mediumType == MediumType.image
//               ? GestureDetector(
//                   onTap: () async {
//                     PhotoGallery.deleteMedium(mediumId: medium.id);
//                   },
//                   child: FadeInImage(
//                     fit: BoxFit.cover,
//                     placeholder: MemoryImage(kTransparentImage),
//                     image: PhotoProvider(mediumId: medium.id),
//                   ),
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }
