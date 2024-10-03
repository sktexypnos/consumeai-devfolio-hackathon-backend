import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getURLnutri(String? nutriScore) {
  // Check if nutriscoreGrade is not null
  if (nutriScore == null) {
    return 'https://www.foodchainid.com/wp-content/uploads/sites/24/2024/02/Cover-Photo-Nutri-Score-1024x1024.png'; // Default URL if nutriscoreGrade is null
  }

  // Define the image URL based on the nutriscore grade
  switch (nutriScore) {
    case 'a':
      return 'https://storage.googleapis.com/consume-wise-static-images/nutriscore/nutriA.png'; // URL for NutriScore grade 'a'
    case 'b':
      return 'https://storage.googleapis.com/consume-wise-static-images/nutriscore/nutriB.png'; // URL for NutriScore grade 'b'
    case 'c':
      return 'https://storage.googleapis.com/consume-wise-static-images/nutriscore/nutriC.png'; // URL for NutriScore grade 'c'
    case 'd':
      return 'https://storage.googleapis.com/consume-wise-static-images/nutriscore/nutriD.png'; // URL for NutriScore grade 'd'
    case 'e':
      return 'https://storage.googleapis.com/consume-wise-static-images/nutriscore/nutriE.png'; // URL for NutriScore grade 'e'
    default:
      return 'https://storage.googleapis.com/consume-wise-static-images/default.png'; // Default URL if no match is found
  }
}
