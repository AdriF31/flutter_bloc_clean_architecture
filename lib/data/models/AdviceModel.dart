import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

/// advice_id : 35
/// advice : "Follow the 80/20 rule — 20% of your work will bring 80% of your results. Find that 20% work and focus on that."

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({
    required int id,
    required String advice,
  }) : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(id: json['advice_id'], advice: json['advice']);
  }
}
