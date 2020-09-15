import 'package:delilo/models/seller_model.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class MainSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final List<Seller> list;
  MainSearchBar({@required this.searchController, @required this.list});

  @override
  _MainSearchBarState createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  List<Seller> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: displayWidth(context) * .8,
                child: Material(
                  elevation: 5,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        filteredList = widget.list
                            .where((element) => element.shopName
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    controller: widget.searchController,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(
                            Icons.search,
                            size: 35,
                            color: Colors.green.withOpacity(.75),
                          ),
                        ),
                        hintText: "Search from Products, Shops"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
