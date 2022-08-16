// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiclelist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehicleListController on VehicleListController_, Store {
  late final _$vehicleListAtom =
      Atom(name: 'VehicleListController_.vehicleList', context: context);

  @override
  ObservableList<VehicleCountController> get vehicleList {
    _$vehicleListAtom.reportRead();
    return super.vehicleList;
  }

  @override
  set vehicleList(ObservableList<VehicleCountController> value) {
    _$vehicleListAtom.reportWrite(value, super.vehicleList, () {
      super.vehicleList = value;
    });
  }

  late final _$VehicleListController_ActionController =
      ActionController(name: 'VehicleListController_', context: context);

  @override
  ObservableList<dynamic> getVehicleList() {
    final _$actionInfo = _$VehicleListController_ActionController.startAction(
        name: 'VehicleListController_.getVehicleList');
    try {
      return super.getVehicleList();
    } finally {
      _$VehicleListController_ActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadVehicles() {
    final _$actionInfo = _$VehicleListController_ActionController.startAction(
        name: 'VehicleListController_.loadVehicles');
    try {
      return super.loadVehicles();
    } finally {
      _$VehicleListController_ActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
vehicleList: ${vehicleList}
    ''';
  }
}
