part of 'info_bloc.dart';

sealed class InfoState extends Equatable {
  const InfoState();
  
  @override
  List<Object> get props => [];
}

final class InfoInitial extends InfoState {}
