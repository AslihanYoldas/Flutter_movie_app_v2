import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubit/movie_features/movie_view.dart';
import '../model/popular_movies.dart';
import '../utils/modifed_text.dart';
import '../utils/utils.dart';



class PopularMoviesWidget extends StatelessWidget {
  final PopularMovies popular;

  const PopularMoviesWidget({super.key, required this.popular});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Popular Movies',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 30),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (popular.data?.popularity?.length??0) < 20 ? popular.data?.popularity?.length:20,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        String? reviewId = (popular.data?.popularity?[index].emsId);
                        String? detailId = (popular.data?.popularity?[index].emsVersionId);
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
                              height: 200,
                              width:140,
                              child: FadeInImage(
                                image:NetworkImage(popular.data?.popularity?[index].posterImage?.url ?? 'assets/images/movie.png' ),
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


                            Text(
                                popular.data?.popularity![index].name
                                    as String,
                                style: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontSize: (popular.data?.popularity![index].name?.length ?? 0) >60 ? 10:15,
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