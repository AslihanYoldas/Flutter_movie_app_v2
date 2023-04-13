import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/cubit/search_feautures/search_view.dart';
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

  HomeSuccess(this.news,this.popular,this.upcoming);

  @override
  State<HomeSuccess> createState() => _HomeSuccessState(this.news!,this.popular!,this.upcoming!);
}

class _HomeSuccessState extends State<HomeSuccess> {


  int _selectedIndex=0;
  News news;
  PopularMovies popular;
  UpcomingMovies upcoming;


  _HomeSuccessState(this.news,this.popular,this.upcoming);

  @override
  void initState() {

  }
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
   SearchBarWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Movie App"),
      ),
      bottomNavigationBar:BottomNavigationBar(

        backgroundColor: Colors.blueGrey[900],
        selectedItemColor:Colors.amber ,
        currentIndex: _selectedIndex,
        onTap:_navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:'Search')
        ],
      ) ,
      body:_pages[_selectedIndex],

    );
  }
}
