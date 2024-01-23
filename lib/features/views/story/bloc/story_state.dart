part of 'story_bloc.dart';

sealed class StoryState extends Equatable {
  const StoryState();
  
  @override
  List<Object> get props => [];
}

final class StoryInitial extends StoryState {}
