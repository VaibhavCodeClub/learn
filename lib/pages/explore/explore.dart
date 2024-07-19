// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/pages/modules/atoz.dart';
import 'package:learn/pages/modules/birds.dart';
import 'package:learn/pages/modules/colours.dart';
import 'package:learn/pages/modules/planets.dart';
import 'package:learn/pages/modules/shapes.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/utils/const_dimensions.dart';
import 'package:learn/utils/route/route_constant.dart';


// Explore Page
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    await Provider.of<FavouriteScreenProvider>(context, listen: false)
        .loadFromPrefs();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final provider =
        Provider.of<FavouriteScreenProvider>(context, listen: false);
    List<int> selectItem = provider.selectedItemList;
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: [
                                    ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Image.asset(
                                        AppConstants
                                            .modules[index].thumbnailPath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppConstants.modules[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  const Shadow(
                                                    color: Colors.black,
                                                    offset: Offset(2, 1),
                                                    blurRadius: 4,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              AppConstants
                                                  .modules[index].description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  const Shadow(
                                                    color: Colors.black,
                                                    offset: Offset(2, 1),
                                                    blurRadius: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child:
                                              Consumer<FavouriteScreenProvider>(
                                            builder: (context, item, child) {
                                              return IconButton(
                                                onPressed: () {
                                                  if (item.selectedItemList
                                                      .contains(index)) {
                                                    item.removeList(index);
                                                  } else {
                                                    print(selectItem);
                                                    item.setList(index);
                                                  }
                                                },
                                                icon: selectItem.contains(index)
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        size: 25,
                                                        color: Colors.red,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_border,
                                                        size: 25,
                                                      ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                      childCount: AppConstants.modules.length,
                    ),
                  ),
                ],
              ),
            ),
            drawer: const MyDrawer(),
          );
  }
}
