import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'article_record.g.dart';

abstract class ArticleRecord
    implements Built<ArticleRecord, ArticleRecordBuilder> {
  static Serializer<ArticleRecord> get serializer => _$articleRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'ArticleTitle')
  String get articleTitle;

  @nullable
  @BuiltValueField(wireName: 'ArticleDescription')
  String get articleDescription;

  @nullable
  @BuiltValueField(wireName: 'Excerpt')
  String get excerpt;

  @nullable
  @BuiltValueField(wireName: 'Createdate')
  DateTime get createdate;

  @nullable
  String get creator;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ArticleRecordBuilder builder) => builder
    ..articleTitle = ''
    ..articleDescription = ''
    ..excerpt = ''
    ..creator = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Article');

  static Stream<ArticleRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ArticleRecord._();
  factory ArticleRecord([void Function(ArticleRecordBuilder) updates]) =
      _$ArticleRecord;

  static ArticleRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createArticleRecordData({
  String articleTitle,
  String articleDescription,
  String excerpt,
  DateTime createdate,
  String creator,
}) =>
    serializers.toFirestore(
        ArticleRecord.serializer,
        ArticleRecord((a) => a
          ..articleTitle = articleTitle
          ..articleDescription = articleDescription
          ..excerpt = excerpt
          ..createdate = createdate
          ..creator = creator));
