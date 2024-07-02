import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/pages/explore/quiz.dart';
import 'package:learn/pages/modules/atoz.dart';
import 'package:learn/pages/modules/birds.dart';
import 'package:learn/pages/modules/colours.dart';
import 'package:learn/pages/modules/planets.dart';
import 'package:learn/pages/modules/shapes.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/utils/route/route_constant.dart';
import 'package:provider/provider.dart';
import '../../favorite_page_provider.dart';
import '../../theme_provider.dart';
import '../../utils/const_dimensions.dart';
import '../../widgets/drawer.dart';

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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 1),
                  child: IconButton(
                    icon: Icon(
                      themeProvider.themeMode == ThemeMode.dark
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   pinned: true,
                  //   title: Padding(
                  //     padding: const EdgeInsets.fromLTRB(0, 12, 16, 4),
                  //     child: Text(
                  //       "Explore",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headlineLarge!
                  //           .copyWith(fontWeight: FontWeight.bold, fontSize: 30.0),
                  //     ),
                  //   ),
                  // ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         (MaterialPageRoute(
                        //             builder: (context) => const Quiz())));
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.symmetric(
                        //         horizontal: 18.0, vertical: 8),
                        //     padding: const EdgeInsets.all(8.0),
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black, width: 1.0),
                        //       borderRadius: BorderRadius.circular(8.0),
                        //       color: Colors.blueAccent,
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         SizedBox(
                        //           width: ConstantDimensions.widthExtraLarge,
                        //           height: ConstantDimensions.heightExtraLarge,
                        //           child:
                        //               SvgPicture.asset('assets/explore/notebook.svg'),
                        //         ),
                        //         const SizedBox(
                        //             width: ConstantDimensions.widthMedium_Large),
                        //         const Text(
                        //           'Quiz',
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 30.0,
                        //             fontFamily: 'Comic',
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AllRoutesConstant.drawingboardRoute);
                          },
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              height: ConstantDimensions.heightExtraLarge * 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
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
                                      child: SvgPicture.asset(
                                        'assets/explore/drawing_board.svg',
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
                                              "Drawing Board",
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
                                              "Drawing Board for Artist Kids!",
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
                                                  item.setDrawingBoard();
                                                },
                                                icon: item.drawingBoard
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
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            try {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) => const Quiz())));
                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) => const AtoZ())));
                                  break;
                                case 2:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) => BirdsPage())));
                                  break;
                                case 3:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              const ColoursPage())));
                                  break;
                                case 4:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) => BirdsPage())));
                                  break;
                                case 5:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              const ShapesPage())));
                                  break;
                                case 6:
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              PlanetsPage())));
                                  break;
                                default:
                                  break;
                              }
                            } catch (e) {
                              // ignore: avoid_print
                              print(e);
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              height: ConstantDimensions.heightExtraLarge * 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
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
