import 'package:flutter/material.dart';

// Constants
const urlBase = 'https://api.api-ninjas.com/v1/motorcycles?';
const apiKeyLabel = 'X-Api-Key';
const apiKeyValue = 'nhdh4ha5/iLIQck86mQ6ig==UsArecIAYgt89sx1';


// widgits styling functions

TextStyle searchTextFieldStyle(context) {
  return TextStyle(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      fontSize: 18.0,
      fontWeight: FontWeight.w600);
}

TextStyle searchPlaceholderStyle(context) {
  return TextStyle(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      fontSize: 18.0,
      fontWeight: FontWeight.w100
  );
}