class Employee {
  int _id;
  String _name;
  double _salary;

  int get id => _id;

  set id(int value) {
    this._id = value;
  }

  String get name => _name;

  set name(String value) {
    this._name = value;
  }

  double get salary => _salary;

  set salary(double value) {
    this._salary = value;
  }

  Employee(this._id, this._name, this._salary);
}
