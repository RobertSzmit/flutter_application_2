import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/models/banner_item_model.dart';

class BannerRowWidget extends StatelessWidget {
  final BannerItem banner;
  final String teamKey;

  const BannerRowWidget({
    super.key,
    required this.banner,
    required this.teamKey,
  });

  @override
  Widget build(BuildContext context) {
    final teamName = teamKey == 'team1' ? banner.team1Name : banner.team2Name;
    final teamLogo = teamKey == 'team1' ? banner.team1Logo : banner.team2Logo;
    final teamScore = teamKey == 'team1' ? banner.team1Score : banner.team2Score;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 250),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(teamLogo),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    teamName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  teamScore,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}