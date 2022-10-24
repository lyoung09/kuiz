import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DetailImage extends StatelessWidget {
  String? image;
  DetailImage({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: image == null || image!.isEmpty
          ? Center(
              child: PhotoView(
                imageProvider: const AssetImage("assets/icons/my.png"),
                maxScale: PhotoViewComputedScale.covered * 2,
                // Set the background color to the "classic white"
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            )
          : Center(
              child: PhotoView(
                imageProvider: NetworkImage(image!),
                minScale: PhotoViewComputedScale.contained * 0.8,
                // Covered = the smallest possible size to fit the whole screen
                maxScale: PhotoViewComputedScale.covered * 2,
                // Set the background color to the "classic white"
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black,
                ),
                // image!,
                // fit: BoxFit.cover,
                // height: MediaQuery.of(context).size.height / 2,
                // width: MediaQuery.of(context).size.width / 2,
                // alignment: Alignment.center,
              ),
            ),
    );
  }
}

class DetailImages extends StatelessWidget {
  List<String> images;
  DetailImages({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: Container(
          child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
          );
        },
        itemCount: images.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),

        // Set the background color to the "classic white"
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        // pageController: widget.pageController,
        // onPageChanged: onPageChanged,
      )),
    );
  }
}
