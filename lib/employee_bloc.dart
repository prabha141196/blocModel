// imports
//List of employees
//Stream controllers
//Stream sink getters
//constructor-add data,listen
//core functions
//dispose

import 'dart:async';

import 'package:bloc_pattern_example/employee.dart';

class EmployeeBloc {
  List<Employee> _employee = [
    Employee(1, "Employee one", 10000.0),
    Employee(2, "Employee two", 50000.0),
    Employee(3, "Employee three", 80000.0),
    Employee(4, "Employee four", 90000.0),
    Employee(5, "Employee five", 60000.0),
  ];

  final _employeeStreamController = StreamController<List<Employee>>();
  final _incrementStreamController = StreamController<Employee>();
  final _decrementStreamController = StreamController<Employee>();

  Stream<List<Employee>> get employeeListStream =>
      _employeeStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _incrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _decrementStreamController.sink;

  EmployeeBloc() {
    _employeeStreamController.add(_employee);
    _incrementStreamController.stream.listen(_incrementSalary);
    _decrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;
    _employee[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employee);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementsalary = salary * 20 / 100;
    _employee[employee.id - 1].salary = salary - decrementsalary;
    employeeListSink.add(_employee);
  }

  void dispose() {
    _employeeStreamController.close();
    _incrementStreamController.close();
    _decrementStreamController.close();
  }
}
