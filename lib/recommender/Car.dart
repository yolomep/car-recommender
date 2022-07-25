import "package:car_recommender/recommender/Mpg.dart";
import 'package:flutter/src/material/slider_theme.dart';
import "dart:math";

class Car {
  int? _cid;
  String? _make;
  String? _model;
  String? _year;
  Mpg? _mpg;
  String? _transmission;
  int? _doors;
  String? _submodel;
  String? _paidRating;
  double? _reliableRating;
  String? _photo;
  int? _price;
  String? _name;
  RangeValues _priceRange = RangeValues(100, 1000);

  String? get name => _name;

  int? get cid => _cid;

  RangeValues get priceRange => _priceRange;

  set cid(int? cid) {
    _cid = cid;
  }

  String? get make => _make;

  set make(String? make) {
    _make = make;
  }

  String? get model => _model;

  set model(String? model) {
    _model = model;
  }

  String? get year => _year;

  set year(String? year) {
    _year = year;
  }

  Mpg? get mpg => _mpg;

  set mpg(Mpg? mpg) {
    _mpg = mpg;
  }

  String? get transmission => _transmission;

  set transmission(String? transmission) {
    _transmission = transmission;
  }

  int? get doors => _doors;

  set doors(int? doors) {
    _doors = doors;
  }

  String? get submodel => _submodel;

  set submodel(String? submodel) {
    _submodel = submodel;
  }

  String? get paidRating => _paidRating;

  set paidRating(String? paidRating) {
    _paidRating = paidRating;
  } //rated by paid critics

  double? get reliableRating => _reliableRating;

  set reliableRating(double? reliableRating) {
    _reliableRating = reliableRating;
  } //rated by consumers

  String? get photo => _photo;

  set photo(String? photo) {
    _photo = photo;
  }

  int? get price => _price;

  set price(int? price) {
    _price = price;
  }

  Car(
      this._cid,
      this._make,
      this._model,
      this._year,
      this._mpg,
      this._transmission,
      this._doors,
      this._submodel,
      this._paidRating,
      this._reliableRating,
      this._photo);

  Car.fromCSV(List<String> vals) {
    //cid, name, make, model, year, mpg, transmission, doors, submodel, msrp, rating, con r, photo
    cid = int.parse(vals[0]);
    _name = vals[1].replaceAll("\"", "");
    make = vals[2];
    model = vals[3];
    year = vals[4];
    String tempVals = vals[5].replaceAll(RegExp(r'["A-Za-z:]+'),'');
    List<String> mpgs = tempVals.split(";");
    if(mpgs[0] != "") {
      mpg = Mpg(int.parse(mpgs[0]), int.parse(mpgs[1]));
    }
    else {
      mpg = Mpg(10, 10);
    }
    transmission = vals[6];
    doors = int.parse(vals[7]);
    submodel = vals[8];
    price = int.parse(vals[9]);
    paidRating = vals[10];
    //don't need to use reliable rating
    photo = vals[12];
  }

  Car.fromData({
    make="Acura", model="no preference", year="any year", mpgHighway=const RangeValues(10, 40), mpgCity=const RangeValues(10, 30), transmission="Auto", price=100, priceRange=const RangeValues(0, 100),
    rating="F-"
  }){
    _cid = 0;
    _make = make;
    _model = model;
    _year = year;
    _mpg = Mpg.fromRange(mpgHighway, mpgCity);
    _transmission = transmission;
    _paidRating = rating;
    _priceRange = priceRange;
    _price = price;

  }

  int getScore(Car target) {
    return 10;
    //higher scores means a closer match?
    int score = 0;
    if(target.make != "no preference" && _make == target.make) score += 100;
    if(target.model != "no preference" && _model == target.model) score += 200;
    score -= ((min((price! - target.priceRange.start.round()).abs(), (price! - target.priceRange.end.round()).abs()))/1000).round();
    if(_transmission == target._transmission) score += 150;
    score -= min((_mpg!.highway - target.mpg!.highwayRange.start.round()).abs(), (_mpg!.highway - target.mpg!.highwayRange.end.round()).abs());
    score -= min((_mpg!.city - target.mpg!.cityRange.start.round()).abs(), (_mpg!.city - target.mpg!.cityRange.end.round()).abs());
    if(_paidRating == target.paidRating) score += 100;
    if(target.year != "any year" && _year == target.year) score += 50;
    return score;
  }

  String toString() {
    return "$_make ${_model!}";
  }


}
