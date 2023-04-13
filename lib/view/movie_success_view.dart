import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/model/movie_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../model/review.dart';

import '../utils/modifed_text.dart';
import '../widgets/video.dart';

class MovieView extends StatefulWidget {
  Review review;
  MovieDetail detail;


  MovieView(this.detail, this.review);

  @override
  State<MovieView> createState() => _MovieViewState(this.detail,this.review);
}

class _MovieViewState extends State<MovieView> {
  late Review review;
  late MovieDetail detail;
  _MovieViewState(this.detail, this.review);


  @override
  void initState() {
    super.initState();
    debugPrint(detail.data?.movie?.trailer?.url ?? '');


  }
  Widget getName(){
    int str_len=detail.data?.movie?.name?.length ?? 0;
    if(str_len > 60 ){
      return modified_text(
        text: detail.data?.movie?.name ?? '',
        size: 20,
        color: Colors.white,
      );
    }
    else{
      return modified_text(
        text: detail.data?.movie?.name ?? '',
        size: 30,
        color: Colors.white,
      );

    }
  }


  String getGenre() {
    int len = detail.data?.movie?.genres?.length ?? 0;
    String genre = "";
    for (var i = 0; i < len; i++) {
      genre += '${detail.data?.movie?.genres?[i].name} ' ?? '';
      debugPrint(genre);
    }
    return genre;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
              Container(
                  height: 250,
                  child: Stack(children: [
                    Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: FadeInImage(
                          image: NetworkImage(
                              detail.data?.movie?.backgroundImage?.url ??
                                  'assets/images/movie.png'),
                          placeholder:
                              const AssetImage('assets/images/movie.png'),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/movie.png',
                                fit: BoxFit.fitHeight);
                          },
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        child: modified_text(
                          text:
                              '⭐ Average Rating -   ${detail.data?.movie?.userRating?.dtlLikedScore}',
                          color: Colors.yellow,
                          size: 20,
                        )),
                  ])),
              Row(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width - 100,
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         getName(),
                          SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text:
                                'DIRECTED BY ${detail.data?.movie?.directedBy}',
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text:
                                '${detail.data?.movie?.durationMinutes} Minutes ',
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text: '${getGenre()}',
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text:
                                'Release Date  ${detail.data?.movie?.showReleaseDate}',
                            size: 15,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                  Spacer(),
                  Container(
                    height: 150,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                    child: Image.network(detail.data?.movie?.posterImage?.url ??
                        'assets/images/movie.png'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(13.0),
                      margin: EdgeInsets.fromLTRB(1.0, 1.0, 10.0, 00.0),
                      child: modified_text(
                        text: detail.data?.movie?.synopsis ?? '',
                        size: 15,
                        color: Colors.grey,
                      )),
                  Container(
                    padding: EdgeInsets.all(13.0),
                    child: modified_text(
                      text: 'CAST',
                      size: 26,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: 170,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: detail.data?.movie?.cast?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: index ==
                                      (detail.data?.movie?.cast?.length ?? 1) -
                                          1
                                  ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                  : const EdgeInsets.only(left: 8),
                              child: Container(
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    Container(
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipOval(
                                          child: FadeInImage(
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(detail
                                                      .data
                                                      ?.movie
                                                      ?.cast?[index]
                                                      .headShotImage
                                                      ?.url ??
                                                  'assets/images/actor.png'),
                                              placeholder: const AssetImage(
                                                  'assets/images/actor.png'),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    'assets/images/actor.png',
                                                    fit: BoxFit.fitWidth);
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: 120,
                                      child: Column(
                                        children: [
                                          Text(
                                              '${detail.data?.movie?.cast?[index].name} ',
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center),
                                          Text(
                                              '${detail.data?.movie?.cast?[index].characterName} ',
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                  modified_text(
                    text: 'CREW',
                    size: 26,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: 170,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: detail.data?.movie?.crew?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: index ==
                                      (detail.data?.movie?.crew?.length ?? 1) -
                                          1
                                  ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                  : const EdgeInsets.only(left: 8),
                              child: Container(
                                  width: 80,
                                  height: 80,
                                  child: Column(children: [
                                    Container(
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipOval(

                                          child: FadeInImage(
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(detail
                                                      .data
                                                      ?.movie
                                                      ?.crew?[index]
                                                      .headShotImage
                                                      ?.url ??
                                                  'assets/images/actor.png'),
                                              placeholder: const AssetImage(
                                                  'assets/images/actor.png'),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    'assets/images/actor.png',
                                                    fit: BoxFit.fitWidth);
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: 120,
                                      child: Column(
                                        children: [
                                          Text(
                                              '${detail.data?.movie?.crew?[index].name} ',
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center),
                                          Text(
                                              '${detail.data?.movie?.crew?[index].role} ',
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                  ])),
                            );
                          })),
                  modified_text(
                    size: 22,
                    text: 'TRAILER',
                    color: Colors.grey,
                  ),
                  Container(
                    height: 250,
                    child: VideoWidget(
                      videoPlayerController: VideoPlayerController.network(
                        detail.data?.movie?.trailer?.url ?? '',
                      ),
                      looping: true,
                    ),
                  ),
                  modified_text(
                    size: 22,
                    text: 'REVIEWS',
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.white,
                          ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      itemCount:
                          review.data?.audienceReviews?.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10.0),
                          child: modified_text(
                            size: 15,
                            text:
                                '⭐Rating - ${review.data?.audienceReviews?.items?[index].rating} \n ${review.data?.audienceReviews?.items?[index].comment} \n',
                            color: Colors.grey,
                          ),
                        );
                      })
                ],
              ),
            ])));
  }
}
