import 'package:flutter/material.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/detail/widgets/tv.dart';

Widget buildWeb(BuildContext context, ShowResponse data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Show Info",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.red),
      ),
      showInfo(context, "WebChannel",
          data.show?.webChannel?.name ?? "not available"),
      showInfo(
          context, "Watch Time", "(${data.show?.runtime ?? "not available"})"),
      showInfo(context, "Status", data.show?.status ?? "not available"),
      showInfo(context, "Show Type", data.show?.type ?? "not available"),
      showInfo(context, "Genres",
          data.show?.genres?.map((e) => e).toString() ?? "not available"),
      showInfo(context, "Episodes ordered",
          data.show?.links?.previousepisode?.name ?? "not available"),
      showInfo(
          context,
          "Official site",
          data.show?.officialSite ??
              data.show?.webChannel?.officialSite ??
              "not available"),
      showInfo(
          context, "Episodes ordered", data.show?.links?.previousepisode?.name),
      Text(
        "Summary",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.red),
      ),
      Text(
        data.show?.summary ?? "not available",
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ],
  );
}
