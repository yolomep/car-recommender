import 'package:flutter/material.dart';

class Mpg {
  RangeValues highwayRange = const RangeValues(10, 40), cityRange = const RangeValues(10, 30);
  late int highway, city;
  Mpg(this.highway, this.city);

  Mpg.fromRange(this.highwayRange, this.cityRange);
}