import 'package:flutter/material.dart';
import 'package:project_example/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_example/model/planet.dart';

class PlanetCardWidget extends StatelessWidget {
  final Planet planet;

  PlanetCardWidget({this.planet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            planet.svgPath,
            height: 120,
            width: 120,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  planet.name,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  planet.description,
                  maxLines: 5,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
