import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/albam/albam3_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';

class AlbamCreateModal extends StatefulWidget {
  const AlbamCreateModal({super.key});

  @override
  State<AlbamCreateModal> createState() => _AlbamCreateModalState();
}

class _AlbamCreateModalState extends State<AlbamCreateModal> {
  bool tap = false;
  bool tapname = false;
  int index = 1;
  final tags = ['ゆうと'];
  var selectedTags = <String>[];
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.only(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
        ),
        child: index == 1
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/svg/menu_batsu.svg')),
                  SizedBox(height: 8),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 218,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5))),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  Text(
                                    '写真選択方法',
                                    style: TextStyle(
                                      fontFamily: 'Zen-Bl',
                                      fontSize: 17,
                                      color: Color(0xFF511C0B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset('assets/svg/kome.svg')
                            ],
                          ),
                          SizedBox(height: 14),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tap = true;
                              });
                              _showModalPicker(context);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                    width: 290,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26, //色
                                            spreadRadius: 0,
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                        color: tap
                                            ? Colors.white
                                            : Color(0xFFE9E9E9),
                                        border: Border.all(
                                            color: tap
                                                ? Color(0xFF90C659)
                                                : Colors.transparent,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        tap
                                            ? '         $_selectedItem'
                                            : '    ---',
                                        style: TextStyle(
                                            fontFamily: 'Zen-B',
                                            color: tap
                                                ? Color(0xFF511C0B)
                                                : Color(0xFFAAAAAA),
                                            fontSize: 16)),
                                    SizedBox(width: 4),
                                    tap
                                        ? Container()
                                        : SvgPicture.asset(
                                            'assets/svg/pulldown.svg')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 0.5,
                            height: 42,
                            indent: 40,
                            endIndent: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index++;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                tap
                                    ? SvgPicture.asset(
                                        'assets/svg/albam_next_yellow_button.svg')
                                    : SvgPicture.asset(
                                        'assets/svg/albam_next_button.svg'),
                                tap
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            Text(
                                              '次へ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Zen-B',
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 5
                                                  ..color = Color(0xFF835237),
                                              ),
                                            ),
                                            Text(
                                              '次へ',
                                              style: TextStyle(
                                                fontFamily: 'Zen-B',
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ])
                                    : Text('次へ',
                                        style: TextStyle(
                                            fontFamily: 'Zen-B',
                                            color: Colors.white,
                                            fontSize: 18)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/svg/menu_batsu.svg')),
                  SizedBox(height: 8),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 480,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5))),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  Text(
                                    '写真選択方法',
                                    style: TextStyle(
                                      fontFamily: 'Zen-Bl',
                                      fontSize: 17,
                                      color: Color(0xFF511C0B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset('assets/svg/kome.svg')
                            ],
                          ),
                          SizedBox(height: 14),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tap = true;
                              });
                              _showModalPicker(context);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                    width: 290,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26, //色
                                            spreadRadius: 0,
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                        color: tap
                                            ? Colors.white
                                            : Color(0xFFE9E9E9),
                                        border: Border.all(
                                            color: tap
                                                ? Color(0xFF90C659)
                                                : Colors.transparent,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        tap
                                            ? '         $_selectedItem'
                                            : '    ---',
                                        style: TextStyle(
                                            fontFamily: 'Zen-B',
                                            color: tap
                                                ? Color(0xFF511C0B)
                                                : Color(0xFFAAAAAA),
                                            fontSize: 16)),
                                    SizedBox(width: 4),
                                    tap
                                        ? Container()
                                        : SvgPicture.asset(
                                            'assets/svg/pulldown.svg')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 0.5,
                            height: 42,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  Text(
                                    '名前タグ選択',
                                    style: TextStyle(
                                      fontFamily: 'Zen-Bl',
                                      fontSize: 17,
                                      color: Color(0xFF511C0B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset('assets/svg/kome.svg')
                            ],
                          ),
                          SizedBox(height: 14),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Wrap(
                                runSpacing: 16,
                                spacing: 10,
                                children: tags.map((tag) {
                                  // selectedTags の中に自分がいるかを確かめる
                                  final isSelected = selectedTags.contains(tag);
                                  return InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    onTap: () {
                                      if (isSelected) {
                                        // すでに選択されていれば取り除く
                                        selectedTags.remove(tag);
                                      } else {
                                        // 選択されていなければ追加する
                                        selectedTags.add(tag);
                                      }
                                      setState(() {});
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 26, vertical: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                            width: 2,
                                            color: isSelected
                                                ? kSelectColor
                                                : Colors.transparent,
                                          ),
                                          color: isSelected
                                              ? Colors.white
                                              : kNameBoxColor),
                                      child: Text(
                                        tag,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.black
                                              : kNonSelectColor,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 0.5,
                            height: 42,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  Text(
                                    '枚数選択',
                                    style: TextStyle(
                                      fontFamily: 'Zen-Bl',
                                      fontSize: 17,
                                      color: Color(0xFF511C0B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset('assets/svg/kome.svg')
                            ],
                          ),
                          SizedBox(height: 14),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tapname = true;
                              });
                              _showModalPickername(context);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 50),
                                    Container(
                                        width: 60,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26, //色
                                                spreadRadius: 0,
                                                blurRadius: 2,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                            color: tapname
                                                ? Colors.white
                                                : Color(0xFFE9E9E9),
                                            border: Border.all(
                                                color: tapname
                                                    ? Color(0xFF90C659)
                                                    : Colors.transparent,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 50),
                                    Text(
                                        tapname
                                            ? '    $selectedItemname'
                                            : '   ---',
                                        style: TextStyle(
                                            fontFamily: 'Zen-B',
                                            color: tapname
                                                ? Color(0xFF511C0B)
                                                : Color(0xFFAAAAAA),
                                            fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFFAFAFAF),
                            thickness: 0.5,
                            height: 42,
                            indent: 40,
                            endIndent: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Albam3Screen(
                                          imageNum: selectedItemname)));
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                tapname
                                    ? SvgPicture.asset(
                                        'assets/svg/albam_next_yellow_button.svg')
                                    : SvgPicture.asset(
                                        'assets/svg/albam_next_button.svg'),
                                tapname
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            Text(
                                              '次へ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Zen-B',
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 5
                                                  ..color = Color(0xFF835237),
                                              ),
                                            ),
                                            Text(
                                              '次へ',
                                              style: TextStyle(
                                                fontFamily: 'Zen-B',
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ])
                                    : Text('次へ',
                                        style: TextStyle(
                                            fontFamily: 'Zen-B',
                                            color: Colors.white,
                                            fontSize: 18)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ));
  }

  void _showModalPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: GestureDetector(
                onTap: () {},
                child: CupertinoPicker(
                  itemExtent: 40,
                  children: _items.map(_pickerItem).toList(),
                  onSelectedItemChanged: _onSelectedItemChanged,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('キャンセル', style: TextStyle(fontSize: 18))),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('完了', style: TextStyle(fontSize: 18))),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _selectedItem = '';

  final List<String> _items = [
    '投稿内から自分で写真を選ぶ',
    '名前のタグから自動選択',
    '投稿時期から自動選択',
  ];

  Widget _pickerItem(String str) {
    return Text(
      textAlign: TextAlign.center,
      str,
      style: const TextStyle(
          fontSize: 22, fontFamily: 'Zen-M', color: Color(0xFF383838)),
    );
  }

  void _onSelectedItemChanged(int index) {
    setState(() {
      _selectedItem = _items[index];
    });
  }

  void _showModalPickername(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: GestureDetector(
                onTap: () {},
                child: CupertinoPicker(
                  itemExtent: 40,
                  children: _itemsname.map(_pickerItemname).toList(),
                  onSelectedItemChanged: _onSelectedItemChangedname,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('キャンセル', style: TextStyle(fontSize: 18))),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('完了', style: TextStyle(fontSize: 18))),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String selectedItemname = '';

  final List<String> _itemsname = [
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61'
  ];

  Widget _pickerItemname(String str) {
    return Text(
      textAlign: TextAlign.center,
      str,
      style: const TextStyle(
          fontSize: 22, fontFamily: 'Zen-M', color: Color(0xFF383838)),
    );
  }

  void _onSelectedItemChangedname(int index) {
    setState(() {
      selectedItemname = _itemsname[index];
    });
  }
}
