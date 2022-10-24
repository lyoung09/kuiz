// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:kuiz/model/user_model.dart';
// import 'package:kuiz/service/camera/my_storage.dart';
// import 'package:kuiz/util/my_color.dart';

// import '../../../../../../../service/camera/camera_service.dart';

// class UpdateUserProfile extends StatefulWidget {
//   final UserModel auth;
//   int a;
//   PickedFile? image;
//   UpdateUserProfile(
//       {Key? key, required this.auth, required this.a, required this.image})
//       : super(key: key);

//   @override
//   State<UpdateUserProfile> createState() => _UpdateUserProfileState();
// }

// class _UpdateUserProfileState extends State<UpdateUserProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: widget.key,
//       child: Center(
//           child: SizedBox(
//         child: widget.image != null
//             ? CircleAvatar(
//                 radius: 55.0,
//                 backgroundImage: Image.file(File(widget.image!.path)).image,
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.grey[400],
//                     radius: 20.0,
//                     child: IconButton(
//                       onPressed: () {
//                         showBottomCameraModal(context);
//                       },
//                       icon: const Icon(
//                         Icons.camera_alt,
//                         size: 20.0,
//                         color: Color(0xFF404040),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             : widget.auth.profile != null && widget.auth.profile!.isNotEmpty
//                 ? CircleAvatar(
//                     radius: 55.0,
//                     backgroundImage: NetworkImage(widget.auth.profile!),
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.grey[400],
//                         radius: 20.0,
//                         child: IconButton(
//                           onPressed: () async {
//                             showBottomCameraModal(context);
//                           },
//                           icon: const Icon(
//                             Icons.camera_alt,
//                             size: 20.0,
//                             color: Color(0xFF404040),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : CircleAvatar(
//                     radius: 55.0,
//                     backgroundColor: Colors.grey[400],
//                     backgroundImage: const AssetImage('assets/icons/my.png'),
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: CircleAvatar(
//                         radius: 20.0,
//                         backgroundColor: MyColor().backgroundColor(),
//                         child: IconButton(
//                           onPressed: () {
//                             showBottomCameraModal(context);
//                           },
//                           icon: Icon(
//                             Icons.camera_alt,
//                             size: 20.0,
//                             // color: Color(0xFF404040),
//                             color: MyColor().backgroundButtonColor(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//       )),
//     );
//   }

//   showBottomCameraModal(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.camera_alt_rounded),
//                     const Padding(padding: EdgeInsets.only(right: 20)),
//                     Text('co_camera'.tr),
//                   ],
//                 ),
//                 onTap: () async {
//                   widget.image = await CameraService().getImageFromCamera();

//                   Get.back();

//                   setState(() {});
//                 },
//               ),
//               ListTile(
//                 //leading: Icon(Icons.alarm_add_rounded),
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.photo),
//                     const Padding(padding: EdgeInsets.only(right: 20)),
//                     Text('co_album'.tr),
//                   ],
//                 ),
//                 onTap: () async {
//                   widget.image = await CameraService().getImageFromGallery();

//                   Get.back();

//                   setState(() {});
//                 },
//               ),
//               ListTile(
//                 title: Center(
//                     child: Text('co_cancel'.tr,
//                         style: TextStyle(color: Colors.grey[600]))),
//                 onTap: () {
//                   Get.back();
//                 },
//               ),
//             ],
//           );
//         });
//   }
// }
