import 'package:car_counter/vehicles_counter/models/vehicle_model.dart';
import 'package:car_counter/vehicles_counter/vehicle_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:yaml/yaml.dart';
import 'dart:io';

import '../service/csv_persistence_service.dart';

part 'vehiclelist_controller.g.dart';

class VehicleListController = VehicleListController_ with _$VehicleListController;

abstract class VehicleListController_ with Store{

  @observable
  var vehicleList = ObservableList<VehicleCountController>();

  void _addVehicle(vehicle) => vehicleList.add(vehicle);

  @observable
  int positionOnList = 0;

  @action
  ObservableList getVehicleList() => vehicleList;

  @action
  loadVehicles(){
    File file = File('lib/vehicles_counter/config.yaml');
    String yamlString = file.readAsStringSync();
    var vehiclesMap = loadYaml(yamlString);
    for(var i = 0 ; i <vehiclesMap.length ; i++){
      var vehicle = Vehicle(vehiclesMap[i]["name"], vehiclesMap[i]["image"]);
      _addVehicle(VehicleCountController(vehicle));
    }
  }

  @action
  saveList(){
    var countList = <int>[];
    for(var vehicleController in vehicleList){
      countList.add(vehicleController.count);
    }
    CSVService test = CSVService();
    test.writeCSV(countList, positionOnList);
  }



}