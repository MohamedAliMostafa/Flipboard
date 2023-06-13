import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../StateManagement/Provider/Mypro.dart';

class DropDowm extends StatefulWidget {
  String item1;
  String item2;
  String select;
  ValueChanged<String?>? onchange;


  DropDowm({required this.item1, required this.item2, this.onchange,required this.select});

  @override
  State<DropDowm> createState() => _DropDowmState();
}

class _DropDowmState extends State<DropDowm> {
  @override
  Widget build(BuildContext context) {
    var p=Provider.of<MyPro>(context);
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
              fit: FlexFit.loose
          ),
          items: [widget.item1, widget.item2],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan)
              ),
              border:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),
            ),
            baseStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 14,
            ),
          ),
          onChanged:widget.onchange,
          selectedItem:widget.select
      ),
    );
  }
}