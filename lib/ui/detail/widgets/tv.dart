import 'package:flutter/material.dart';
import 'package:netflix/model/response.dart';

Widget showInfo(BuildContext context, String data1, String? data2) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "$data1: ",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextSpan(
          text: data2,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    ),
  );
}

Widget buildTv(BuildContext context, ShowResponse data) {
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
      showInfo(context, "Network", data.show?.network?.name ?? "not available"),
      showInfo(context, "Schedule",
          "${data.show?.schedule?.days?.isNotEmpty == true ? data.show!.schedule!.days![0] : "not available"} at ${data.show?.schedule?.time ?? "not available"} (${data.show?.runtime != null ? data.show!.runtime.toString() : "not available"})"),
      showInfo(context, "Status", data.show?.status ?? "not available"),
      showInfo(context, "Language", data.show?.language ?? "not available"),
      showInfo(context, "Show Type", data.show?.type ?? "not available"),
      showInfo(context, "Genres",
          data.show?.genres?.map((e) => e).toString() ?? "not available"),
      showInfo(context, "Episodes ordered",
          data.show?.links?.previousepisode?.name ?? "not available"),
      showInfo(
          context, "Official site", data.show?.officialSite ?? "not available"),
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
