class Car {
  int? _cid;
  String? _make;
  String? _model;
  int? _year;
  String? _mpg;
  String? _transmission;
  int? _doors;
  String? _submodel;
  int? _msrp;
  double? _paidRating;
  double? _reliableRating;
  String? _photo;

  int? get cid => _cid;

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

  String? get mpg => _mpg;

  set mpg(String? mpg) {
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

  int? get msrp => _msrp;

  set msrp(int? msrp) {
    _msrp = msrp;
  }

  double? get paidRating => _paidRating;

  set paidRating(double? paidRating) {
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

  Car(
      this._cid,
      this._make,
      this._year,
      this._mpg,
      this._transmission,
      this._doors,
      this._submodel,
      this._msrp,
      this._paidRating,
      this._reliableRating,
      this._photo);


}
