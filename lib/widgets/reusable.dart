import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 100,
    height: 200,
  );
}

TextFormField reusableTextField(String text, IconData icon, bool password,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: password,
    // validator: validator,
    enableSuggestions: !password,
    autocorrect: !password,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(1.0)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.15),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType:
        password ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container signInsignUpButton(BuildContext context, bool login, Function onTap) {
  return Container(
    width: 200,

    //width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        login ? "LOG IN" : "SIGN UP",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      ),
    ),
  );
}

Widget ourButton({required BuildContext context, required String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Color(0xFFAC66CC), borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
   width: buttonWidth ?? MediaQuery.of(context).size.width-48,
    child: Text(
      label,
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
