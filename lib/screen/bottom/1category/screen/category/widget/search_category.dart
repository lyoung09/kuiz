import 'package:flutter/material.dart';
import 'package:kuiz/model/category_model.dart';

class SearchCateogyWidget extends StatefulWidget {
  final CategoryModel category;
  const SearchCateogyWidget({Key? key, required this.category})
      : super(key: key);

  @override
  State<SearchCateogyWidget> createState() => _SearchCateogyWidgetState();
}

class _SearchCateogyWidgetState extends State<SearchCateogyWidget> {
  TextEditingController _filter = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      alignment: Alignment.bottomCenter,
      constraints: BoxConstraints.expand(height: 50),
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 1,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.grey[600]),
                onPressed: () {
                  _filter.clear();
                  setState(() {});
                }),
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: _filter,
                style: TextStyle(color: Colors.grey[600], fontSize: 18),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '${widget.category.name}',
                  hintStyle: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
