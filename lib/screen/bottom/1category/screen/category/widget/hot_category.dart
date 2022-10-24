import 'package:flutter/material.dart';

class HotCategoryStoryWidget extends StatelessWidget {
  const HotCategoryStoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Hot tag"),
          Container(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
                Chip(label: Text("your_image")),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 30,
          ),
        ],
      ),
    );
  }
}
