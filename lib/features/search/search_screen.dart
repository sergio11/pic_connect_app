import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return state.isLoading ? _buildProgressIndicator()
              : _buildScreenContent(state);
        });
  }


  Widget _buildScreenContent(SearchState state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Form(
            child: _buildTextSearchView(),
          ),
        ),
        body: state.isShowUsers
            ? _buildUsersGridView(state)
            : _buildPostsGridView(state)
    );
  }

  Widget _buildTextSearchView() {
    return TextFormField(
      controller: searchController,
      decoration:
      const InputDecoration(labelText: 'Search for a user...'),
      onFieldSubmitted: (String term) {
        context.read<SearchBloc>().add(OnSearchUsersEvent(term));
      },
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildUsersGridView(SearchState state) {
    return ListView.builder(
      itemCount: state.users.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => {

          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                state.users[index].photoUrl,
              ),
              radius: 16,
            ),
            title: Text(
              state.users[index].username,
            ),
          ),
        );
      },
    );
  }


  Widget _buildPostsGridView(SearchState state) {
    return MasonryGridView.count(
      crossAxisCount: 3,
      itemCount: state.posts.length,
      itemBuilder: (context, index) => Image.network(
        state.posts[index].postUrl,
        fit: BoxFit.cover,
      ),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }

}
