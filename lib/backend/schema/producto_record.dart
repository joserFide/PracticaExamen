import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'producto_record.g.dart';

abstract class ProductoRecord
    implements Built<ProductoRecord, ProductoRecordBuilder> {
  static Serializer<ProductoRecord> get serializer =>
      _$productoRecordSerializer;

  String? get nombre;

  double? get precio;

  int? get cantidadDisponible;

  String? get img;

  DocumentReference? get categoria;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductoRecordBuilder builder) => builder
    ..nombre = ''
    ..precio = 0.0
    ..cantidadDisponible = 0
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('producto');

  static Stream<ProductoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductoRecord._();
  factory ProductoRecord([void Function(ProductoRecordBuilder) updates]) =
      _$ProductoRecord;

  static ProductoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductoRecordData({
  String? nombre,
  double? precio,
  int? cantidadDisponible,
  String? img,
  DocumentReference? categoria,
}) {
  final firestoreData = serializers.toFirestore(
    ProductoRecord.serializer,
    ProductoRecord(
      (p) => p
        ..nombre = nombre
        ..precio = precio
        ..cantidadDisponible = cantidadDisponible
        ..img = img
        ..categoria = categoria,
    ),
  );

  return firestoreData;
}
