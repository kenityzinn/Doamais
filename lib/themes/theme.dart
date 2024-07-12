import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Color.fromARGB(255, 214, 200, 200), // cor de fundo
      primary: Color.fromARGB(255, 102, 128, 163), //
      secondary: Color.fromARGB(255, 184, 153, 153), //
      inversePrimary: const Color.fromARGB(255, 0, 0, 0)),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 84, 97, 114),
    primary: Color.fromARGB(255, 206, 128, 128),
    secondary: Color.fromARGB(255, 135, 141, 163),
    inversePrimary: Color.fromARGB(255, 158, 151, 196),
  ),
);
