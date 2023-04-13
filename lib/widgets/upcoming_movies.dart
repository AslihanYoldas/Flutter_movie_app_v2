import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/cubit/movie_features/movie_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/upcoming_movies.dart';
import '../utils/modifed_text.dart';



class UpcomingMoviesWidget extends StatelessWidget {
  final UpcomingMovies upcoming;


  double getNameSize(int index){
    int str_len=upcoming.data?.upcoming![index].name?.length ?? 0;
    if(str_len > 60 ){
      return 10;


    }
    else{

        return 15;


    }
  }


  UpcomingMoviesWidget({required this.upcoming}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Upcoming Movies',
            size: 26, color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
              height:270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.data?.upcoming?.length,
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
                              child: FadeInImage(
                                image:NetworkImage(upcoming.data?.upcoming?[index].posterImage?.url ?? 'assets/images/movie.png' ),
                                placeholder: const AssetImage('assets/images/movie.png'),
                                imageErrorBuilder:(context, error, stackTrace) {
                                  return Image.asset('assets/images/movie.png',
                                      fit: BoxFit.fitHeight
                                  );
                                },
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text( upcoming.data?.upcoming?[index].name ?? ''

                    , style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: getNameSize(index),
                              ),
                                  textAlign: TextAlign.center),
                            )
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