import 'package:flutter/material.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/detail/widgets/buildweb.dart';
import 'package:netflix/ui/detail/widgets/tv.dart';

Widget buildInfo(BuildContext context, ShowResponse data, String route) {
  final screenSize = MediaQuery.sizeOf(context);

  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: screenSize.height * 0.01056,
        vertical: screenSize.height * 0.00528),
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.show?.name ?? "not available",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    "Rating: ${data.show?.rating?.average ?? "not available"}",
                    style: data.show?.rating?.average == null
                        ? Theme.of(context).textTheme.bodySmall
                        : Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (data.show?.rating?.average != null)
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                ],
              ),
            ),
          ],
        ),
        if (route == "Tv Shows") buildTv(context, data),
        if (route == "Web Series") buildWeb(context, data),
        if (route == "search" &&
            data.show?.webChannel != null &&
            data.show?.network != null)
          buildTv(context, data),
        if (route == "search" && data.show?.webChannel != null)
          buildWeb(context, data),
        if (route == "search" && data.show?.network != null)
          buildTv(context, data),
        if (route == "search" &&
            data.show?.network == null &&
            data.show?.webChannel == null)
          buildTv(context, data),
      ],
    ),
  );
}
