import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/model/search_result.dart';

import '../cubit/movie_features/movie_view.dart';

class SearchListWidget extends StatefulWidget {
  SearchResult? searchResult;


  SearchListWidget(this.searchResult);

  @override
  State<SearchListWidget> createState() => _SearchListWidgetState(this.searchResult);

}

class _SearchListWidgetState extends State<SearchListWidget> {
  SearchResult? searchResult;


  _SearchListWidgetState(this.searchResult);


  @override
  Widget build(BuildContext context) {
    debugPrint(searchResult?.data.search.movies[0].name);
    debugPrint(searchResult?.data.search.movies[0].posterImage?.url);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Movie App"),
    ),
    body:Container(
      color: Colors.black,
      child: ListView.builder(

          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: searchResult?.data.search.movies.length,
          itemBuilder: (context, index) {
            final post = searchResult;

            return InkWell(
              onTap: () {
                String? reviewId =
                (post.data.search.movies[index].emsId);
                String? detailId =
                (post.data.search.movies[index].emsVersionId);
                debugPrint("$reviewId,$detailId");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MoviePage(reviewId, detailId)));
              },
              child: Container(
                color: Colors.black,
                child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),

                    title: Text(
                      "${post?.data.search.movies[index].name}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    leading:FadeInImage(
                      image:NetworkImage(post!.data.search.movies[index].posterImage?.url ?? 'assets/images/movie.png' ),
                      placeholder: const AssetImage('assets/images/movie.png'),
                      imageErrorBuilder:(context, error, stackTrace) {
                        return Image.asset('assets/images/movie.png',
                            fit: BoxFit.fitWidth
                        );
                      },
                      fit: BoxFit.fitWidth,
                    ),




                ),
              ),
            );
          }),
    )
    );
  }

}