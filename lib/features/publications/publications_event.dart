part of 'publications_bloc.dart';

@freezed
class PublicationsEvent with _$PublicationsEvent {
  const factory PublicationsEvent.loadPublications(String userUid, PublicationsContentTypeEnum type) = OnLoadPublicationsEvent;
}

enum PublicationsContentTypeEnum {
  pictures, reels, favorites, bookmarks, all;
}