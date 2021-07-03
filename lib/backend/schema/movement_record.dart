import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'movement_record.g.dart';

abstract class MovementRecord
    implements Built<MovementRecord, MovementRecordBuilder> {
  static Serializer<MovementRecord> get serializer =>
      _$movementRecordSerializer;

  @nullable
  DocumentReference get name;

  @nullable
  @BuiltValueField(wireName: 'start_plce')
  String get startPlce;

  @nullable
  @BuiltValueField(wireName: 'stop_place')
  String get stopPlace;

  @nullable
  @BuiltValueField(wireName: 'start_km')
  int get startKm;

  @nullable
  @BuiltValueField(wireName: 'stop_km')
  int get stopKm;

  @nullable
  @BuiltValueField(wireName: 'total_km')
  int get totalKm;

  @nullable
  String get remarks;

  @nullable
  String get dateofvisit;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MovementRecordBuilder builder) => builder
    ..startPlce = ''
    ..stopPlace = ''
    ..startKm = 0
    ..stopKm = 0
    ..totalKm = 0
    ..remarks = ''
    ..dateofvisit = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movement');

  static Stream<MovementRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MovementRecord._();
  factory MovementRecord([void Function(MovementRecordBuilder) updates]) =
      _$MovementRecord;

  static MovementRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createMovementRecordData({
  DocumentReference name,
  String startPlce,
  String stopPlace,
  int startKm,
  int stopKm,
  int totalKm,
  String remarks,
  String dateofvisit,
}) =>
    serializers.toFirestore(
        MovementRecord.serializer,
        MovementRecord((m) => m
          ..name = name
          ..startPlce = startPlce
          ..stopPlace = stopPlace
          ..startKm = startKm
          ..stopKm = stopKm
          ..totalKm = totalKm
          ..remarks = remarks
          ..dateofvisit = dateofvisit));
