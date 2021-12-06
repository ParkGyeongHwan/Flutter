import 'package:flutter/material.dart';
import 'package:kakao_t_ui_exam/data/fake_data.dart';
import 'package:kakao_t_ui_exam/model/ad.dart';
import 'package:kakao_t_ui_exam/ui/home/components/ad_view.dart';
import 'package:kakao_t_ui_exam/ui/home/components/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '카카오 T',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final PageController controller = PageController(initialPage: 0);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          _buildMenu(),
          _buildAds(controller),
          _buildNotice(),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 2.5 / 3.2,
      physics: NeverScrollableScrollPhysics(),
      children: fakeMenus.map((e) => MenuWidget(menu: e)).toList(),
    );
  }

  Widget _buildAds(PageController controller) {
    return SizedBox(
          height: 150,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: fakeAds.map((Ad e) => AdView(ad: e)).toList(),
            // children: <Widget>[
            //   AdView(
            //     ad: fakeAds[0],
            //   ),
            //   AdView(
            //     ad: fakeAds[1],
            //   ),
            //   AdView(
            //     ad: fakeAds[2],
            //   ),
            // ],
          ),
        );
  }

  Widget _buildNotice() {
    // ListView 보다 Column만 두는게 더 깔끔하다
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(50, (index) => ListTile(
        leading: Icon(Icons.notifications),
        title: Text('공지 $index'),
        trailing: Icon(
          Icons.navigate_next_outlined,
        ),
      )),
    );
  }
}

