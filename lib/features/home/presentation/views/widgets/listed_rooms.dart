import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

class ListedroomsItem extends StatelessWidget {
  const ListedroomsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Rooms',
                style: TextStyles.font18WhiteMedium,
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'see all',
                  style: TextStyles.font14GreyMedium,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kRoomDetailsView);
                },
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  color: ColorStyles.blackLight,
                  shadowColor: ColorStyles.black,
                  child: Column(
                    children: [
                      Image.asset(
                        ImagesAssets.onBoardingImage,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 130,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Living Room',
                              style: TextStyles.font14WhiteMedium,
                            ),
                            Text(
                              '2 lights',
                              style: TextStyles.font14GreyMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
