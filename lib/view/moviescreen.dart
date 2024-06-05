import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_api_app/model/movie/moviemodel.dart';
import 'package:multi_api_app/utils/api/api.dart';
import 'package:multi_api_app/view/widgets/movieslider.dart';
import 'package:multi_api_app/view/widgets/trendingslider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int pageIndex = 0;
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> upcomingMovies;

  final ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    trendingMovies = Api().getTrendingmovies();
    topratedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getupcomingMovies();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('FlickHub'),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            SizedBox(
              height: 16,
              
            ),

            // trendingslidar(),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return trendingslidar(
                      snapshot: snapshot,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Top rated Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              child: FutureBuilder(
                future: topratedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return movieslider(
                      snapshot: snapshot,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Upcoming Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              child: FutureBuilder(
                future: upcomingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return movieslider(
                      snapshot: snapshot,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.work_rounded,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.work_outline_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.widgets_rounded,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.widgets_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
