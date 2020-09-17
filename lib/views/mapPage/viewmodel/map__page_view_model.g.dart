// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map__page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapPageViewModel on _MapPageViewModelBase, Store {
  final _$annotationsAtom = Atom(name: '_MapPageViewModelBase.annotations');

  @override
  ObservableList<MapPageModel> get annotations {
    _$annotationsAtom.reportRead();
    return super.annotations;
  }

  @override
  set annotations(ObservableList<MapPageModel> value) {
    _$annotationsAtom.reportWrite(value, super.annotations, () {
      super.annotations = value;
    });
  }

  final _$annotationsMarkersAtom =
      Atom(name: '_MapPageViewModelBase.annotationsMarkers');

  @override
  Set<Marker> get annotationsMarkers {
    _$annotationsMarkersAtom.reportRead();
    return super.annotationsMarkers;
  }

  @override
  set annotationsMarkers(Set<Marker> value) {
    _$annotationsMarkersAtom.reportWrite(value, super.annotationsMarkers, () {
      super.annotationsMarkers = value;
    });
  }

  final _$_MapPageViewModelBaseActionController =
      ActionController(name: '_MapPageViewModelBase');

  @override
  MapPageModel selectPoint(String uuid) {
    final _$actionInfo = _$_MapPageViewModelBaseActionController.startAction(
        name: '_MapPageViewModelBase.selectPoint');
    try {
      return super.selectPoint(uuid);
    } finally {
      _$_MapPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateStatus(String uuid) {
    final _$actionInfo = _$_MapPageViewModelBaseActionController.startAction(
        name: '_MapPageViewModelBase.updateStatus');
    try {
      return super.updateStatus(uuid);
    } finally {
      _$_MapPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
annotations: ${annotations},
annotationsMarkers: ${annotationsMarkers}
    ''';
  }
}
