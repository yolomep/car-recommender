import "package:car_recommender/recommender/Mpg.dart";
import 'package:flutter/src/material/slider_theme.dart';

class Car {
  int? _cid;
  String? _make;
  String? _model;
  int? _year;
  Mpg? _mpg;
  String? _transmission;
  int? _doors;
  String? _submodel;
  String? _paidRating;
  double? _reliableRating;
  String? _photo;
  int? _price;
  RangeValues _priceRange = RangeValues(100, 1000);

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

  int? get year => _year;

  set year(int? year) {
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

  Car.fromCSV(List<dynamic> vals) {
    List<String> mpgs = (vals[3] as String).replaceAll(RegExp(r'[A-Za-z]+'),'').split(";");
    cid = vals[0];
    make = vals[1];
    model = vals[2];
    year = vals[2];
    mpg = Mpg(int.parse(mpgs[0]), int.parse(mpgs[1]));
    transmission = vals[4];
    doors = vals[5];
    submodel = vals[6];
    paidRating = vals[7];
    reliableRating = vals[8];
    photo = vals[9];
  }

  Car.fromData({
    make="Acura", model="no preference", year=2020, mpgHighway=const RangeValues(10, 40), mpgCity=const RangeValues(10, 30), transmission="Auto", price=100, priceRange=const RangeValues(0, 100),
    rating="F-"
  }){
    _cid = 0;
    _make = make;
    _model = model;
    if(year == "any year"){
      _year = 2020; //idk
    }
    else {
      _year = year;
    }
    _mpg = Mpg(mpgHighway, mpgCity);
    _transmission = transmission;
    _paidRating = rating;
    _priceRange = priceRange;
    _price = price;
    }

  }
}
