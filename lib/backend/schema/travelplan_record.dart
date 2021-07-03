import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'travelplan_record.g.dart';

abstract class TravelplanRecord
    implements Built<TravelplanRecord, TravelplanRecordBuilder> {
  static Serializer<TravelplanRecord> get serializer =>
      _$travelplanRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'create_date')
  DateTime get createDate;

  @nullable
  DateTime get date;

  @nullable
  String get baselocation;

  @nullable
  String get destination;

  @nullable
  @BuiltValueField(wireName: 'last_visit')
  DateTime get lastVisit;

  @nullable
  int get distance;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TravelplanRecordBuilder builder) => builder
    ..baselocation = ''
    ..destination = ''
    ..distance = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('travelplan');

  static Stream<TravelplanRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TravelplanRecord._();
  factory TravelplanRecord([void Function(TravelplanRecordBuilder) updates]) =
      _$TravelplanRecord;

  static TravelplanRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTravelplanRecordData({
  DocumentReference user,
  DateTime createDate,
  DateTime date,
  String baselocation,
  String destination,
  DateTime lastVisit,
  int distance,
}) =>
    serializers.toFirestore(
        TravelplanRecord.serializer,
        TravelplanRecord((t) => t
          ..user = user
          ..createDate = createDate
          ..date = date
          ..baselocation = baselocation
          ..destination = destination
          ..lastVisit = lastVisit
          ..distance = distance));
