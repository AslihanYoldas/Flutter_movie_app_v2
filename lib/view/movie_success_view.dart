import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/model/movie_detail.dart';
import 'package:flutter_movieapi_v2/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';
import '../model/review.dart';

import '../utils/modifed_text.dart';
import '../widgets/video.dart';

class MovieView extends StatefulWidget {
  Review review;
  MovieDetail detail;

  MovieView(this.detail, this.review, {super.key});

  @override
  State<MovieView> createState() => _MovieViewState(detail, review);
}

class _MovieViewState extends State<MovieView> {
  late Review review;
  late MovieDetail detail;

  _MovieViewState(this.detail, this.review);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
            physics: const ClampingScrollPhysics(),
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
                        child: Column(children: [
                          modified_text(
                            text: ' User Rating \u{2B50} '
                                ' ${detail.data?.movie?.userRating?.dtlLikedScore ?? '-'}  ',
                            color: Colors.amber,
                            size: 15,
                          ),
                          modified_text(
                            text: ' Tomato Rating \u{2B50} '
                                ' ${detail.data?.movie?.tomatoRating?.tomatometer ?? '-'}  ',
                            color: Colors.amber,
                            size: 15,
                          ),
                        ])),
                  ])),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getName(detail),
                          const SizedBox(
                            height: 15,
                          ),
                          modified_text(
                            text:
                                'DIRECTED BY ${detail.data?.movie?.directedBy}',
                            size: 15,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text:
                                '${detail.data?.movie?.durationMinutes} Minutes ',
                            size: 15,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text: getGenre(detail),
                            size: 15,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text:
                                'Release Date  ${detail.data?.movie?.showReleaseDate}',
                            size: 15,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          modified_text(
                            text:
                                'Movie Rate  ${detail.data?.movie?.motionPictureRating?.code ?? 'Unknown'}',
                            size: 15,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                  const Spacer(),
                  Container(
                    height: 150,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Image.network(detail.data?.movie?.posterImage?.url ??
                        'assets/images/movie.png'),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 00.0),
                    child: modified_text(
                      text: detail.data?.movie?.synopsis ?? '',
                      size: 15,
                      color: Colors.grey,
                    )),
                Container(
                  padding: const EdgeInsets.all(13.0),
                  child: const modified_text(
                    text: 'CAST',
                    size: 26,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                    height: 170,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: detail.data?.movie?.cast?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index ==
                                    (detail.data?.movie?.cast?.length ?? 1) - 1
                                ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                : const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Column(
                                children: [
                                  AspectRatio(
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
                                  const SizedBox(height: 5),
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
                const modified_text(
                  text: 'CREW',
                  size: 26,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                Container(
                    height: 170,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: detail.data?.movie?.crew?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index ==
                                    (detail.data?.movie?.crew?.length ?? 1) - 1
                                ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                : const EdgeInsets.only(left: 8),
                            child: Container(
                                width: 80,
                                height: 80,
                                child: Column(children: [
                                  AspectRatio(
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
                                  const SizedBox(height: 5),
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
                const SizedBox(height: 10),
                const modified_text(
                  size: 22,
                  text: 'PHOTO GALLERY',
                  color: Colors.grey,
                ),
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(8.0),
                  child: PhotoViewGallery.builder(
                    itemCount: detail.data?.movie?.images?.length,
                    builder: (context, index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(
                            detail.data?.movie?.images?[index].url ?? ''),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      );
                    },
                    scrollPhysics: const BouncingScrollPhysics(),
                    backgroundDecoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black,
                    ),
                    enableRotation: true,
                    loadingBuilder: (context, event) => Center(
                      child: Container(
                          width: 30.0, height: 30.0, child: buildLoading()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const modified_text(
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
                const modified_text(
                  size: 22,
                  text: 'REVIEWS',
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.white,
                        ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemCount: review.data?.audienceReviews?.items?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                modified_text(
                                  size: 15,
                                  text:
                                      '⭐Rating - ${review.data?.audienceReviews?.items?[index].rating} ',
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 5),
                                modified_text(
                                  size: 15,
                                  text:
                                      '${review.data?.audienceReviews?.items?[index].comment} \n',
                                  color: Colors.grey,
                                ),
                              ]));
                    })
              ])
            ]));
  }
}
