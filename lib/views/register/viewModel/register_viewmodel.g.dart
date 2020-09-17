// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$nameSurnameAtom = Atom(name: '_RegisterViewModelBase.nameSurname');

  @override
  String get nameSurname {
    _$nameSurnameAtom.reportRead();
    return super.nameSurname;
  }

  @override
  set nameSurname(String value) {
    _$nameSurnameAtom.reportWrite(value, super.nameSurname, () {
      super.nameSurname = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_RegisterViewModelBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$dateOfBirthAtom = Atom(name: '_RegisterViewModelBase.dateOfBirth');

  @override
  String get dateOfBirth {
    _$dateOfBirthAtom.reportRead();
    return super.dateOfBirth;
  }

  @override
  set dateOfBirth(String value) {
    _$dateOfBirthAtom.reportWrite(value, super.dateOfBirth, () {
      super.dateOfBirth = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
nameSurname: ${nameSurname},
email: ${email},
phone: ${phone},
dateOfBirth: ${dateOfBirth},
password: ${password}
    ''';
  }
}
