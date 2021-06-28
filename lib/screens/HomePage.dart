import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar_lib.dart';
import 'package:flutter_custom_tab_bar/delegate/color_transform_delegte.dart';
import 'package:flutter_custom_tab_bar/delegate/scale_transform_delegate.dart';
import 'package:flutter_custom_tab_bar/indicator/standard_indicator.dart';
import 'package:flutter_custom_tab_bar/tab_bar_item.dart';
import 'package:flutter_custom_tab_bar/tab_bar_item_info.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_booking/Data/Constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size? screenSize;
  final int pageCount = 3;
  final PageController _controller = PageController();
  final RoundIndicatorController _roundIndicatorController =
      RoundIndicatorController();

  Widget getTabbarChild(BuildContext context, TabBarItemInfo data) {
    return TabBarItem(
        delegate: ColorTransformDelegate(
            highlightColor: Colors.white,
            normalColor: Colors.black,
            builder: (context, color) {
              return Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                constraints: BoxConstraints(minWidth: 30),
                child: (Text(
                  "Movies",
                  //"data.itemIndex == 1 ? 'Movies' : 'Top-Rated'",
                  style: TextStyle(fontSize: 14, color: color),
                )),
              );
            }),
        tabbarItemInfo: data);
  }
  const StaggeredGridViewPage.count({
    required this.title,
    required this.crossAxisCount,
    required this.tiles,
    this.mainAxisSpacing = 4,
    this.crossAxisSpacing = 4,
  })  : _staggeredGridViewMode = _StaggeredGridViewMode.count,
        maxCrossAxisExtent = null;

  const StaggeredGridViewPage.extent({
    required this.title,
    required this.maxCrossAxisExtent,
    required this.tiles,
    this.mainAxisSpacing = 4,
    this.crossAxisSpacing = 4,
  })  : _staggeredGridViewMode = _StaggeredGridViewMode.extent,
        crossAxisCount = null;

  static const EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 4);

  final String title;
  final List<StaggeredTile> tiles;
  final int? crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? maxCrossAxisExtent;
  final _StaggeredGridViewMode _staggeredGridViewMode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Movie Booking')),
      body: Column(
        children: [
          Container(
            height: 35,
            child: Container(
              child: CustomTabBar(
                defaultPage: 0,
                itemCount: pageCount,
                builder: getTabbarChild,
                indicator: RoundIndicator(
                  indicatorColor: Constants.orange,
                  top: 2.5,
                  bottom: 2.5,
                  radius: 15,
                  controller: _roundIndicatorController,
                ),
                pageController: _controller,
                tabbarController: _roundIndicatorController,
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: _buildStaggeredGridView(context))));
        ],
      ),
    );
  }
  Widget _buildStaggeredGridView(BuildContext context) {
    switch (_staggeredGridViewMode) {
      case _StaggeredGridViewMode.count:
        return StaggeredGridView.countBuilder(
          crossAxisCount: crossAxisCount!,
          itemCount: tiles.length,
          itemBuilder: _getChild,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          padding: padding,
          staggeredTileBuilder: _getStaggeredTile,
        );
      default:
        return StaggeredGridView.extentBuilder(
          maxCrossAxisExtent: maxCrossAxisExtent!,
          itemCount: tiles.length,
          itemBuilder: _getChild,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          padding: padding,
          staggeredTileBuilder: _getStaggeredTile,
        );
    }
  }
  TileWidget _getChild(BuildContext context, int index) {
    //return TileWidget(key: ObjectKey(index), index: index);
  }
  StaggeredTile? _getStaggeredTile(int i) {

  }

  /*TileWidget _getChild(BuildContext context, int index) {
    return TileWidget(key: ObjectKey(index), index: index);
  }*/
}

class TileWidget {
}



enum _StaggeredGridViewMode { count, extent }