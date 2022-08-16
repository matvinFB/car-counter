import 'package:car_counter/vehicles_counter/models/vehicle_model.dart';
import 'package:mobx/mobx.dart';

part 'vehicle_controller.g.dart';

class VehicleCountController = VehicleCountController_ with _$VehicleCountController;

abstract class VehicleCountController_ with Store {

  IVehicle vehicle;

  VehicleCountController_(this.vehicle);

  @observable
  int count = 0;

  @action
  String getName() => vehicle.getName();

  @action
  String getImagePath() => vehicle.getImagePath();

  @action
  incrementCount() {
    vehicle.incrementCount();
    count = vehicle.getCount();
  }

  @action
  decrementCount(){
    count == 0 ? {} : vehicle.decrementCount();
    count = vehicle.getCount();
    print(vehicle.getCount());
  }
}