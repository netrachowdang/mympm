import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'health_record.g.dart';

abstract class HealthRecord
    implements Built<HealthRecord, HealthRecordBuilder> {
  static Serializer<HealthRecord> get serializer => _$healthRecordSerializer;

  @nullable
  DocumentReference get name;

  @nullable
  String get healthstatus;

  @nullable
  @BuiltValueField(wireName: 'vaccination_i')
  bool get vaccinationI;

  @nullable
  @BuiltValueField(wireName: 'vaccination_ii')
  bool get vaccinationIi;

  @nullable
  String get remarks;

  @nullable
  DateTime get createdate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HealthRecordBuilder builder) => builder
    ..healthstatus = ''
    ..vaccinationI = false
    ..vaccinationIi = false
    ..remarks = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('health');

  static Stream<HealthRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HealthRecord._();
  factory HealthRecord([void Function(HealthRecordBuilder) updates]) =
      _$HealthRecord;

  static HealthRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createHealthRecordData({
  DocumentReference name,
  String healthstatus,
  bool vaccinationI,
  bool vaccinationIi,
  String remarks,
  DateTime createdate,
}) =>
    serializers.toFirestore(
        HealthRecord.serializer,
        HealthRecord((h) => h
          ..name = name
          ..healthstatus = healthstatus
          ..vaccinationI = vaccinationI
          ..vaccinationIi = vaccinationIi
          ..remarks = remarks
          ..createdate = createdate));
