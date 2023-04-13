import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news.dart';
import '../utils/modifed_text.dart';



class NewsWidget extends StatelessWidget {
  final News news;

  NewsWidget({required this.news}) : super();
  @override
  
  String? getTitle(int index){

    String? text=news.data?.newsStories?[index].title;
    debugPrint(text);
    text=text?.replaceAll(RegExp(r'<em>'), '');
    text=text?.replaceAll(RegExp(r'</em>'), '');
    text=text?.replaceAll(RegExp(r'<I>'), '');
    text=text?.replaceAll(RegExp(r'</i>'), '');
    text=text?.replaceAll(RegExp(r'&#\d*;'), ' ');
    text=text?.replaceAll(RegExp(r'&\w*;'), ' ');
    debugPrint(text);

    return text;
  }

  
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'News',
            size: 26, color: Colors.white,
          ),
          SizedBox(height:5),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: news.data?.newsStories?.length,
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
                        width: 160,
                        child: Column(
                          children: [
                            Container(
                              width:120,
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
                              height: 100,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                 getTitle(index) ?? '',
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