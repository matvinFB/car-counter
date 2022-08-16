import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

abstract class IVehicle{
  String getName();
  String getImagePath();
  int getCount();
  int incrementCount();
  int decrementCount();
}

class Vehicle implements IVehicle{
  String name;
  String imagePath;

  @observable
  int count = 0;


  Vehicle(this.name, this.imagePath);

  @override
  String getName() => name;

  @override
  String getImagePath() => imagePath;

  @override
  int getCount() => count;

  @override
  int incrementCount() => count += 1;

  @override
  int decrementCount() => count -= 1;




}