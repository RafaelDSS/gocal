import 'package:flutter/material.dart';

TextStyle styleBase = TextStyle(
  height: 1.2,
  fontFamily: 'Poppins1',
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

InputDecoration inputDecorationTextform(String hintText) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      color: Color(0xff969CB2),
    ),
    counterText: "",
    filled: true,
    fillColor: Colors.white,
  );
}

Widget button({String? title, Function? onPressed}) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Color(0xff37B874)),
      elevation: MaterialStateProperty.all(0.6),
    ),
    onPressed: () {
      onPressed!();
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          title!,
          style: styleBase.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

Widget customListTextSpan(List<String> texts) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: "${texts[0]}",
          style: styleBase.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: "${texts[1]}",
          style: styleBase.copyWith(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: "${texts[2]}",
          style: styleBase.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: "${texts[3]}",
          style: styleBase.copyWith(
            fontSize: 18,
            color: Color(0xff37B874),
          ),
        )
      ],
    ),
  );
}
