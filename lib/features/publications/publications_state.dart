part of 'publications_bloc.dart';

@freezed
class PublicationsState with _$PublicationsState {
  const factory PublicationsState({
    @Default(true) final bool isLoading,
    @Default([]) final List<PostBO> postList,
    @Default(0) final int postLen,
    @Default("") final String authorUserUid,
    @Default(PostTypeEnum.all) final PostTypeEnum type,
    final String? errorMessage
  }) = _PublicationsState;
}