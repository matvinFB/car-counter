// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehicleCountController on VehicleCountController_, Store {
  late final _$countAtom =
      Atom(name: 'VehicleCountController_.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$VehicleCountController_ActionController =
      ActionController(name: 'VehicleCountController_', context: context);

  @override
  String getName() {
    final _$actionInfo = _$VehicleCountController_ActionController.startAction(
        name: 'VehicleCountController_.getName');
    try {
      return super.getName();
    } finally {
      _$VehicleCountController_ActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getImagePath() {
    final _$actionInfo = _$VehicleCountController_ActionController.startAction(
        name: 'VehicleCountController_.getImagePath');
    try {
      return super.getImagePath();
    } finally {
      _$VehicleCountController_ActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementCount() {
    final _$actionInfo = _$VehicleCountController_ActionController.startAction(
        name: 'VehicleCountController_.incrementCount');
    try {
      return super.incrementCount();
    } finally {
      _$VehicleCountController_ActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementCount() {
    final _$actionInfo = _$VehicleCountController_ActionController.startAction(
        name: 'VehicleCountController_.decrementCount');
    try {
      return super.decrementCount();
    } finally {
      _$VehicleCountController_ActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
