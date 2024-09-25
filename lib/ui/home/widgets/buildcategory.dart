import 'package:flutter/material.dart';
import 'package:netflix/extras/noimage.dart';
import 'package:netflix/helperfunc/filter.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/detail/screens/detailscreen.dart';
import 'package:netflix/ui/home/screens/showall.dart';

Widget buildCategory(
    {required BuildContext context,
    required List<ShowResponse> data,
    required String title,
    required String category}) {
  final tvShows = filter(data: data, category: category);
  final int datalength = (tvShows.length / 2) >= 3 ? 3 : tvShows.length;
  final screenSize = MediaQuery.sizeOf(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(screenSize.height * 0.0105),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ShowAll.routeName,
                arguments: {"title": title, "data": tvShows});
          },
          child: Text(
            '$title >',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      SizedBox(
        height: screenSize.height * 0.311,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: datalength,
          itemBuilder: (context, index) {
            final dataObj = tvShows[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DetailScreen.routeName,
                    arguments: {"route": title, "data": dataObj});
              },
              child: Padding(
                padding: EdgeInsets.all(screenSize.height * 0.0105),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(screenSize.height * 0.0158),
                      child: Container(
                        width: screenSize.height * 0.237,
                        height: screenSize.height * 0.290,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenSize.height * 0.0158),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              dataObj.show?.image?.original ??
                                  dataObj.show?.image?.medium ??
                                  noImageUrl,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/loadingImagebg.png",
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                    const CircularProgressIndicator(),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
