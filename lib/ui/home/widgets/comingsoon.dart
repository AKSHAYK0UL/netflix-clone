import 'package:flutter/material.dart';
import 'package:netflix/extras/noimage.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/detail/screens/detailscreen.dart';

Widget comingSoon({
  required BuildContext context,
  required List<ShowResponse> data,
}) {
  final screenSize = MediaQuery.sizeOf(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(screenSize.height * 0.0105),
        child: Text(
          'Coming Soon',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      SizedBox(
        height: screenSize.height * 0.285,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            final dataObj = data[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DetailScreen.routeName,
                    arguments: {"route": "Tv Shows", "data": dataObj});
              },
              child: Padding(
                padding: EdgeInsets.all(screenSize.height * 0.0105),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(screenSize.height * 0.0158),
                      child: Container(
                        width: screenSize.height * 0.422,
                        height: screenSize.height * 0.264,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                screenSize.height * 0.0158)),
                        child: Center(
                          child: Stack(
                            children: [
                              Image.network(
                                dataObj.show?.image?.original ??
                                    dataObj.show?.image?.medium ??
                                    noImageUrl,
                                fit: BoxFit.fill,
                                width: double.infinity,
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
                                        height: double.infinity,
                                        width: double.infinity,
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
