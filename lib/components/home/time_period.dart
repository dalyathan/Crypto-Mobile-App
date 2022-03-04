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
    Size size = MediaQuery.of(context).size;
    double dropdownHeight = size.height * 0.065;
    double dropdownWidth = width * 0.45;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.45,
          child: FittedBox(
              child: Text(
            rangeOfDays,
            style: MyTheme.textStyle.copyWith(
                color: MyTheme.grapeColor, fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          width: dropdownWidth,
          height: dropdownHeight,
          decoration: BoxDecoration(
              border: Border.all(color: MyTheme.grapeColor),
              borderRadius: BorderRadius.circular(dropdownHeight * 0.2)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: SizedBox(
                width: dropdownWidth * 0.3,
                child: Align(
                  alignment: const Alignment(-0.7, 0),
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyTheme.grapeColor,
                    size: dropdownWidth * 0.25,
                  ),
                ),
              ),
              elevation: 16,
              style: MyTheme.textStyle.copyWith(
                  color: MyTheme.grapeColor, fontWeight: FontWeight.w700),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: updatePeriod,
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                      width: dropdownWidth * 0.6,
                      child: Align(
                          alignment: const Alignment(0.2, 0),
                          child: Text(value))),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
