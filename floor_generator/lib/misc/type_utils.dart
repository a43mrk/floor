import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:floor_generator/misc/annotations.dart';
import 'package:source_gen/source_gen.dart';

@nonNull
TypeChecker typeChecker(final Type type) => TypeChecker.fromRuntime(type);

@nonNull
bool isString(final DartType type) {
  return type.isDartCoreString;
}

@nonNull
bool isBool(final DartType type) {
  return type.isDartCoreBool;
}

@nonNull
bool isInt(final DartType type) {
  return type.isDartCoreInt;
}

@nonNull
bool isDouble(final DartType type) {
  return type.isDartCoreDouble;
}

@nonNull
bool isList(final DartType type) {
  return type.name == 'List' && type.element.library.isDartCore;
}

@nonNull
bool isParameterizedList(final DartType type) {
  // print("checking $type...");
  // return _parameterizedTypeChecker.isExactlyType(type);
  return type is ParameterizedType;
}

@nonNull
Iterable<DartType> getGenericTypes(DartType type) {
  return type is ParameterizedType ? type.typeArguments : const [];
}


@nonNull
bool canHaveGenerics(DartType type) {
  final element = type.element;
  if (element is ClassElement) {
    return element.typeParameters.isNotEmpty;
  }
  return false;
}

@nonNull
bool isSupportedType(final DartType type) {
  return TypeChecker.any([
    _stringTypeChecker,
    _boolTypeChecker,
    _intTypeChecker,
    _doubleTypeChecker,
    // _listTypeChecker,
    // _parameterizedTypeChecker,
  ]).isExactlyType(type);
}

@nonNull
bool isStream(final DartType type) {
  return _streamTypeChecker.isExactlyType(type);
}

@nonNull
DartType flattenList(final DartType type) {
  return (type as ParameterizedType).typeArguments.first;
}

@nonNull
DartType flattenStream(final DartType type) {
  return (type as ParameterizedType).typeArguments.first;
}

final _stringTypeChecker = typeChecker(String);

final _boolTypeChecker = typeChecker(bool);

final _intTypeChecker = typeChecker(int);

final _doubleTypeChecker = typeChecker(double);

final _streamTypeChecker = typeChecker(Stream);

final _listTypeChecker = typeChecker(List);

final _parameterizedTypeChecker = typeChecker(ParameterizedType);
