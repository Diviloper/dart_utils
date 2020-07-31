import 'package:equatable/equatable.dart';

class Tuple<F, S> extends Equatable{
  final F first;
  final S second;

  Tuple(this.first, this.second);

  Tuple copyWith({F? first, S? second}) => Tuple(first ?? this.first, second ?? this.second);

  @override
  List<Object> get props => [first as Object, second as Object];
}
