import 'package:course_book/utils/util.dart';
import 'package:json_annotation/json_annotation.dart';
part 'index.g.dart';

@JsonLiteral('../../assets/env/dev.json')
Map<String, dynamic> get devConfig => _$devConfigJsonLiteral;

@JsonLiteral('../../assets/env/prod.json')
Map<String, dynamic> get prodConfig => _$prodConfigJsonLiteral;


