// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_announcement_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostAnnouncementViewModel on _PostAnnouncementViewModelBase, Store {
  final _$announcementTypeAtom =
      Atom(name: '_PostAnnouncementViewModelBase.announcementType');

  @override
  String get announcementType {
    _$announcementTypeAtom.reportRead();
    return super.announcementType;
  }

  @override
  set announcementType(String value) {
    _$announcementTypeAtom.reportWrite(value, super.announcementType, () {
      super.announcementType = value;
    });
  }

  final _$animalSpeciesAtom =
      Atom(name: '_PostAnnouncementViewModelBase.animalSpecies');

  @override
  String get animalSpecies {
    _$animalSpeciesAtom.reportRead();
    return super.animalSpecies;
  }

  @override
  set animalSpecies(String value) {
    _$animalSpeciesAtom.reportWrite(value, super.animalSpecies, () {
      super.animalSpecies = value;
    });
  }

  final _$genderAtom = Atom(name: '_PostAnnouncementViewModelBase.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$breedAtom = Atom(name: '_PostAnnouncementViewModelBase.breed');

  @override
  String get breed {
    _$breedAtom.reportRead();
    return super.breed;
  }

  @override
  set breed(String value) {
    _$breedAtom.reportWrite(value, super.breed, () {
      super.breed = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_PostAnnouncementViewModelBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$breedListAtom =
      Atom(name: '_PostAnnouncementViewModelBase.breedList');

  @override
  List<String> get breedList {
    _$breedListAtom.reportRead();
    return super.breedList;
  }

  @override
  set breedList(List<String> value) {
    _$breedListAtom.reportWrite(value, super.breedList, () {
      super.breedList = value;
    });
  }

  final _$isFillAtom = Atom(name: '_PostAnnouncementViewModelBase.isFill');

  @override
  ObservableList<bool> get isFill {
    _$isFillAtom.reportRead();
    return super.isFill;
  }

  @override
  set isFill(ObservableList<bool> value) {
    _$isFillAtom.reportWrite(value, super.isFill, () {
      super.isFill = value;
    });
  }

  final _$_PostAnnouncementViewModelBaseActionController =
      ActionController(name: '_PostAnnouncementViewModelBase');

  @override
  void updateFillChecks(int index) {
    final _$actionInfo = _$_PostAnnouncementViewModelBaseActionController
        .startAction(name: '_PostAnnouncementViewModelBase.updateFillChecks');
    try {
      return super.updateFillChecks(index);
    } finally {
      _$_PostAnnouncementViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFirstBreedName(String animal) {
    final _$actionInfo =
        _$_PostAnnouncementViewModelBaseActionController.startAction(
            name: '_PostAnnouncementViewModelBase.changeFirstBreedName');
    try {
      return super.changeFirstBreedName(animal);
    } finally {
      _$_PostAnnouncementViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
announcementType: ${announcementType},
animalSpecies: ${animalSpecies},
gender: ${gender},
breed: ${breed},
description: ${description},
breedList: ${breedList},
isFill: ${isFill}
    ''';
  }
}
