import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/model/news.dart';
import 'package:flutter_movieapi_v2/model/popular_movies.dart';
import 'package:flutter_movieapi_v2/model/upcoming_movies.dart';
import 'package:flutter_movieapi_v2/widgets/search_bar.dart';
import 'package:flutter_movieapi_v2/widgets/upcoming_movies.dart';
import '../widgets/news.dart';
import '../widgets/popular_movies.dart';

class HomeSuccess extends StatefulWidget {
  final News? news;
  final PopularMovies? popular;
  final UpcomingMovies? upcoming;

  HomeSuccess(this.news,this.popular,this.upcoming, {super.key});

  @override
  State<HomeSuccess> createState() => _HomeSuccessState(news!,popular!,upcoming!);
}

class _HomeSuccessState extends State<HomeSuccess> {
  int _selectedIndex=0;
  News news;
  PopularMovies popular;
  UpcomingMovies upcoming;

  _HomeSuccessState(this.news,this.popular,this.upcoming);
  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  late final List<Widget> _pages=[
    ListView(
      children: <Widget>[
        UpcomingMoviesWidget(upcoming:upcoming),
        PopularMoviesWidget(popular: popular),
        NewsWidget(news: news)
      ],
    ),
   const SearchBarWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
        title: const Text("Movie App"),
      ),
      bottomNavigationBar:BottomNavigationBar(

        backgroundColor: Colors.blueGrey[800],
        selectedItemColor:Colors.amber ,
        currentIndex: _selectedIndex,
        onTap:_navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:'Search')
        ],
      ) ,
      body:_pages[_selectedIndex],

    );
  }
}
