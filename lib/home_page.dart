import 'package:bloc_pattern_example/employee.dart';
import 'package:bloc_pattern_example/employee_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  final EmployeeBloc employeeBloc = EmployeeBloc();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee data"),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
            stream: employeeBloc.employeeListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
              return ListView.builder(
                itemBuilder: (context1, position) {
                  return GestureDetector(
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      margin: EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${snapshot.data[position].id}. ${snapshot.data[position].name}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  "${"₹"}. ${snapshot.data[position].salary}",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          employeeBloc.employeeSalaryIncrement
                                              .add(snapshot.data[position]);
                                        }),
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          employeeBloc.employeeSalaryDecrement
                                              .add(snapshot.data[position]);
                                        })
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            }),
      ),
    );
  }
}
