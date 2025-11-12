import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  const CustomEditText({super.key, required this.hintText, required this.type});
  final String hintText;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: "inter",
              fontSize: 16,
            ),
            maxLines: 1,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              fillColor: Color(0xFF292E38),
              hintStyle: TextStyle(
                color: Color(0xFF9EA6BA),
                fontSize: 16,
                fontFamily: "inter",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
