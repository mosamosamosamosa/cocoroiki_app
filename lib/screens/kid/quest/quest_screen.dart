import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/grandparent/grandchild_room.dart';
import 'package:cocoroiki_app/screens/kid/menu_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest/tree_modal.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QuestScreen extends ConsumerStatefulWidget {
  const QuestScreen({super.key});

  @override
  ConsumerState<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends ConsumerState<QuestScreen> {
  AppUserListResponse? users = AppUserListResponse();
  List<int> grandList = [];
  List<String> grandNameList = [];
  List<String> grandGenderList = [];
  String qrData = "";
  bool showQrCode = false; //QRcodeの表示の有無
  bool showIcons = true; //QRcodd表示時の他のwidgetの表示
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  bool visible0 = false;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;

  @override
  void initState() {
    fetchSomeData().then((value) {
      if (grandList.length == 0) {
        visible0 = true;
      } else if (grandList.length == 1) {
        visible1 = true;
      } else if (grandList.length == 2) {
        visible2 = true;
      } else if (grandList.length == 3) {
        visible3 = true;
      } else {
        visible4 = true;
      }
    });

    //setState(() {});
    //super.initState();
  }

  Future fetchSomeData() async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = AppUserApi(apiClient);
    try {
      final response = await apiInstance.getAppUsers();

      if (response != null) {
        for (int i = 0; i < response.data.length; i++) {
          if (response.data[i].attributes?.families?.data[0].id == 1 &&
              response.data[i].attributes?.grandparent == true) {
            setState(() {
              // grandList.add((response.data[i].id!).toInt());

              // grandNameList.add((response.data[i].attributes?.name).toString());
              // grandGenderList
              //     .add((response.data[i].attributes?.gender).toString());
            });
            // print('おばあちゃん:$grandList');
            // print(grandNameList);
            // print(grandGenderList);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    final grandListNotifier = ref.watch(grandListProvider.notifier);
    //状態管理している値を取得する
    final userRoleState = ref.watch(userRoleProvider);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: kBackgroundColors,
          stops: [
            0.3,
            0.6,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/image/back.png')),
            Visibility(
                visible: visible0,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 260),
                    child: Stack(
                      children: [
                        Image.asset('assets/image/board_first.png'),
                        Positioned(
                          top: 50,
                          left: 0,
                          right: 0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                "おじいちゃんおばあちゃんに\nアプリをいれてもらおう！",
                                style: TextStyle(
                                  fontSize: 18,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 5
                                    ..color = Color(0xFF3E0E0E),
                                ),
                              ),
                              const Text(
                                "おじいちゃんおばあちゃんに\nアプリをいれてもらおう！",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
            Visibility(
              visible: visible1,
              child: Positioned(
                  bottom: 293,
                  right: deviceW * 0.32,
                  child: GestureDetector(
                      onTap: () {
                        grandListNotifier.state = grandList;
                        if (userRoleState) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GrandchildScreen()));
                        } else {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => TreeModal(
                                  grandName: grandNameList[0],
                                  gender: grandGenderList[0]));
                        }
                      },
                      child: SvgPicture.asset('assets/svg/green.svg'))),
            ),
            Visibility(
              visible: visible2,
              child: Stack(
                children: [
                  Positioned(
                      left: 50,
                      bottom: 220,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                  Positioned(
                      right: 60,
                      bottom: 300,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                ],
              ),
            ),
            Visibility(
              visible: visible3,
              child: Stack(
                children: [
                  Positioned(
                      left: 50,
                      bottom: 200,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                  Positioned(
                      right: 40,
                      bottom: 280,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                  Positioned(
                      left: 70,
                      bottom: 370,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                ],
              ),
            ),
            Visibility(
              visible: visible4,
              child: Stack(
                children: [
                  Positioned(
                      left: 50,
                      bottom: 400,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                  Positioned(
                      right: 60,
                      bottom: 330,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                  Positioned(
                      left: 40,
                      bottom: 220,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                  Positioned(
                      right: 20,
                      bottom: 180,
                      child: SvgPicture.asset('assets/svg/green.svg')),
                ],
              ),
            ),
            Positioned(
                top: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/board.svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: Stack(
                        children: [
                          Text(
                            'ひろば',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Zen-B',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = Color(0xFF835237),
                            ),
                          ),
                          Text(
                            'ひろば',
                            style: TextStyle(
                              fontFamily: 'Zen-B',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            if (showIcons)
              Positioned(
                  top: 70,
                  left: 24,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuScreen()));
                        setState(() {});
                      },
                      child:
                          SvgPicture.asset('assets/svg/quest_humberger.svg'))),
            if (showIcons)
              Positioned(
                top: 60,
                right: 8,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        qrData = "1"; // 新しいQRコードのデータ
                        showQrCode = true;
                        showIcons = false;
                        print('QRコード生成');
                      });
                    },
                    child: SvgPicture.asset('assets/svg/qrcode.svg')),
              ),
            if (showQrCode)
              Container(
                color: Colors.black.withOpacity(0.5), // 背後の画面を暗くする色と透明度を調整
              ),
            if (showQrCode)
              Container(
                margin: EdgeInsets.only(top: 0), // QRコードの表示位置を調整
                child: Center(
                  child: Container(
                    child: QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: 310.0,
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ),
            // QRコードを消すボタンとQRコードスキャナーアイコン
            if (showQrCode)
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 70.0, right: 19, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // QRコードを消すボタン
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showQrCode = false;
                          showIcons = true;
                          print('QRコード削除');
                        });
                      },
                      child: SvgPicture.asset('assets/svg/qr_close.svg'),
                    ),
                    // QRコードスキャナーアイコン
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          //QRコードをスキャンする処理
                          print('QRスキャン');
                        });
                      },
                      child: SvgPicture.asset('assets/svg/qr-scan.svg'),
                    ),
                  ],
                ),
              ),

            if (showQrCode)
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 150.0, right: 38, left: 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // QRコードを消すボタン
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            showQrCode = false;
                            showIcons = true;
                            print('共有する');
                          });
                        },
                        child: Image.asset('assets/image/share.png')
                        //child: SvgPicture.asset('assets/svg/link_copy.svg'),
                        ),
                    // QRコードスキャナーアイコン
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            showQrCode = false;
                            showIcons = true;
                            print('リンクコピー');
                          });
                        },
                        child: Image.asset('assets/image/link_copy.png')
                        //child: SvgPicture.asset('assets/svg/share.svg'),
                        ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
