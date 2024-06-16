import 'package:flutter/material.dart';
import 'package:multi_api_app/model/constants.dart';
import 'package:multi_api_app/view/screens/detailscreen.dart';


//movie slider page
class movieslider extends StatelessWidget {
  const movieslider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(movie: snapshot.data[index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data![index].posterPath}'),
                  height: 200,
                  width: 150,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
