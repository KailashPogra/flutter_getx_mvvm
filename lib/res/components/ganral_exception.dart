import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenralExceptionWidget extends StatefulWidget {
  final VoidCallback onpress;
  const GenralExceptionWidget({super.key, required this.onpress});

  @override
  State<GenralExceptionWidget> createState() => _EnternetExceptionWidgetState();
}

class _EnternetExceptionWidgetState extends State<GenralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        SizedBox(
          height: hight * .15,
        ),
        Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
              child: Text(
            'genral_exception'.tr,
            textAlign: TextAlign.center,
          )),
        ),
        SizedBox(
          height: hight * .15,
        ),
        InkWell(
          onTap: widget.onpress,
          child: Container(
            height: 44,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text('Retry')),
          ),
        )
      ]),
    );
  }
}
