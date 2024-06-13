
import 'package:json_annotation/json_annotation.dart';

import '../model/batch_api_model.dart';


//Data transfer object represent the structure of data as
// it comes from or goes to the data sources. They often include serialization/deserialization logic.
part 'get_all_batch_dto.g.dart';

@JsonSerializable()
class GetAllBatchDTO{
  final bool success;
  final int count;
  final List<BatchApiModel> data;

  GetAllBatchDTO({
    required this.success,
    required this.count,
    required this.data,
});
  Map<String,dynamic> toJson() => _$GetAllBatchDTOToJson(this);

  factory GetAllBatchDTO.fromJson(Map<String,dynamic> json)=>
      _$GetAllBatchDTOFromJson(json);
}