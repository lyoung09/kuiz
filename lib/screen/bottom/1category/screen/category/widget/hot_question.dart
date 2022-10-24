import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotPageViewWidget extends StatefulWidget {
  const HotPageViewWidget({Key? key}) : super(key: key);

  @override
  State<HotPageViewWidget> createState() => _HotPageViewWidgetState();
}

class _HotPageViewWidgetState extends State<HotPageViewWidget> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.08,
      ),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Android'),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('iOS'),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Desktop'),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Web'),
            ),
          )
        ],
      ),
    );
  }
}
