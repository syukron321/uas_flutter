import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class SplitWidget extends StatelessWidget {
  final TextEditingController controller;

  const SplitWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 50,
            child: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.blue,
            ),
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Split (People)",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                TextInputFormatter.withFunction((oldValue, newValue) =>
                    RegExp(r'(^\-?\d*\.?\d*)$').hasMatch(newValue.text)
                        ? newValue
                        : oldValue)
              ],
              controller: controller,
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 50,
            child: FlatButton(
              onPressed: () {
                if (int.parse(controller.text) > 0) {
                  controller.text = (int.parse(controller.text) - 1).toString();
                } else {
                  controller.text = '0';
                }
              },
              child: FaIcon(
                FontAwesomeIcons.minus,
                size: 16,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 50,
            child: FlatButton(
              onPressed: () {
                controller.text = (int.parse(controller.text) + 1).toString();
              },
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: 16,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
