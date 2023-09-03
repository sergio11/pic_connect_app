part of 'publications_bloc.dart';

@freezed
class PublicationsEvent with _$PublicationsEvent {
  const factory PublicationsEvent.loadPublications(String userUid, PostTypeEnum type) = OnLoadPublicationsEvent;
}

enum PostTypeEnum {
  pictures, reels, favorites, bookmarks, all;
}