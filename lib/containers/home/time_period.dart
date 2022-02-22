import 'package:crypto_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class TimePeriod extends StatelessWidget {
  final String rangeOfDays;
  final double width;
  final Function(String?) updatePeriod;
  final List<String> dropdownItems;
  final String dropdownValue;
  const TimePeriod(
      {Key? key,
      required this.width,
      required this.rangeOfDays,
      required this.updatePeriod,
      required this.dropdownItems,
      required this.dropdownValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.4,
          child: FittedBox(
              child: Text(
            rangeOfDays,
            style: MyTheme.textStyle.copyWith(
                color: MyTheme.grapeColor, fontWeight: FontWeight.bold),
          )),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: updatePeriod,
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
