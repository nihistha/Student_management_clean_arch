import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/batch_entity.dart';

final batchApiModelProvider = Provider<BatchApiModel>(
    (ref) => BatchApiModel.empty(),
);

@JsonSerializable()
class BatchApiModel{
  @JsonKey(name: '_id')
  final String batchId;
  final String batchName;

  BatchApiModel({
    required this.batchId,
    required this.batchName
  });

  BatchApiModel.empty()
    :batchId ='',
    batchName = '';
  //the data received from backend is converted to dart
  factory BatchApiModel.fromJson(Map<String, dynamic> json){
    return BatchApiModel(batchId: json['_id'], batchName: json['batchName'],);
  }

  //again the data is converted to Json to send back to the database
  Map<String, dynamic> toJson(){
    return {
      '_id': batchId,
      'batchName' : batchName
    };
  }

  BatchEntity toEntity() => BatchEntity(batchId: batchId, batchName: batchName);

  BatchApiModel fromEntity(BatchEntity entity) =>
      BatchApiModel(batchId: entity.batchId ?? '' , batchName: entity.batchName!);

  List<BatchEntity> toEntityList(List<BatchApiModel> model) =>
      model.map((mod) => mod.toEntity()).toList();

}