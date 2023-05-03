import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/cubit/movie_features/movie_view.dart';
import 'package:flutter_movieapi_v2/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/upcoming_movies.dart';
import '../utils/modifed_text.dart';



class UpcomingMoviesWidget extends StatelessWidget {
  final UpcomingMovies upcoming;




  const UpcomingMoviesWidget({super.key, required this.upcoming});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Upcoming Movies',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 30),
          Container(
              height:270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (upcoming.data?.upcoming?.length??0) < 20 ? upcoming.data?.upcoming?.length:20,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        String? reviewId = (upcoming.data?.upcoming?[index].emsId);
                        String? detailId = (upcoming.data?.upcoming?[index].emsVersionId);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MoviePage(reviewId, detailId)));
                      },
                      child: Container(
                        width: 170,
                        child: Column(
                          children: [
                            Container(
                              height:200,
                              width:140,
                              child: FadeInImage(
                                image:NetworkImage(upcoming.data?.upcoming?[index].posterImage?.url ?? 'assets/images/movie.png' ),
                                placeholder: const AssetImage('assets/images/movie.png'),
                                imageErrorBuilder:(context, error, stackTrace) {
                                  return Image.asset('assets/images/movie.png',
                                      fit: BoxFit.cover
                                  );
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text( upcoming.data?.upcoming?[index].name ?? ''

                    , style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: (upcoming.data?.upcoming![index].name?.length ?? 0) >60 ? 10 :15,
                            ),
                                textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}