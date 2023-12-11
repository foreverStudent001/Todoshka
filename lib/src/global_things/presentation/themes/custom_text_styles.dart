import 'package:clippy/src/global_things/presentation/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

//reusable

TextStyle cartTitles(context) => TextStyle(
    color:UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyLarge!.color
        :Theme.of(context).primaryColor,
    fontSize:18,
    fontWeight: FontWeight.bold
);

const detailText = TextStyle(fontSize: 12);