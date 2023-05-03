import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news.dart';
import '../utils/modifed_text.dart';
import '../utils/utils.dart';



class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget({super.key, required this.news});


  
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'News',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height:5),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (news.data?.newsStories?.length??0) < 20 ? news.data?.newsStories?.length:20,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()   async {

                          const url = 'https://flutter.io';
                          final uri = Uri.parse(news.data?.newsStories?[index].link ?? url);
                          if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                          } else {
                          throw 'Could not launch $url';


                        }

                      },
                      child: Container(
                        width: 180,
                        child: Column(
                          children: [
                            Container(
                              width:160,
                              height: 100,
                              child: FadeInImage(
                                image:NetworkImage(news.data?.newsStories?[index].mainImage?.url ?? 'assets/images/news.png' ),
                                placeholder: const AssetImage('assets/images/news.png'),
                                imageErrorBuilder:(context, error, stackTrace) {
                                  return Image.asset('assets/images/news.png',
                                      fit: BoxFit.fitWidth
                                  );
                                },
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width:140,
                              child: Text(
                                 getTitle(news,index) ?? '',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontSize: 15,
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