import 'package:flutter/material.dart';

class DataModel {
  DateTime quitDate;
  TimeOfDay quitTime;
  int cigarettesPerDay;
  int priceOfaPacketOfCigarettes;
  int numberofcigarettesperpack;
  int thelengthoftimeyousmokeonecigarette;
  // Add other fields here

  DataModel({
    required this.quitDate,
    required this.quitTime,
    required this.cigarettesPerDay,
    required this.priceOfaPacketOfCigarettes,
    required this.numberofcigarettesperpack,
    required this.thelengthoftimeyousmokeonecigarette,
    // Add other parameters here
  });
}