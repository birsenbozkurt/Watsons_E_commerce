import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:watsons/app_icon_icons.dart';
import 'package:watsons/lipsticks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<List<Lipsticks>> lipstickleriGetir() async {
    var lipsticksListesi = <Lipsticks>[];

    var l1 = Lipsticks(
        lipStickId: 1, lipStickAdi: "Maybelline Hydra Supreme Extreme Ruj", lipStickResimAdi: "mhser.jpeg", lipStickFiyat: 109.90, cardFiyat: 39.95);
    var l2 = Lipsticks(
        lipStickId: 2,
        lipStickAdi: "Nyx Lip Lingerie XXL Matte Likit Mat Ruj Untamable",
        lipStickResimAdi: "nyx.jpeg",
        lipStickFiyat: 299.90,
        cardFiyat: 240.0);
    var l3 = Lipsticks(
        lipStickId: 3, lipStickAdi: "Deborah il Rossetto Klasik Ruj", lipStickResimAdi: "deborah.jpeg", lipStickFiyat: 79.95, cardFiyat: 55.95);
    var l4 = Lipsticks(
        lipStickId: 4, lipStickAdi: "Flormar Kiss Me More Lip Tattoo Ruj", lipStickResimAdi: "flormar.jpeg", lipStickFiyat: 149.90, cardFiyat: 89.75);

    lipsticksListesi.add(l1);
    lipsticksListesi.add(l2);
    lipsticksListesi.add(l3);
    lipsticksListesi.add(l4);

    return lipsticksListesi;
  }

  @override
  Widget build(BuildContext context) {
    var ekran = MediaQuery.of(context);
    final ekranen = ekran.size.width;
    final ekranboy = ekran.size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(
          AppIcon.search,
          size: 35,
        ),
        backgroundColor: Color(0xFF0097A7),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black38))),
        height: 58,
        child: CustomLineIndicatorBottomNavbar(
          selectedIconSize: 25,
          unselectedIconSize: 25,
          selectedColor: Color(0xFF0097A7),
          unSelectedColor: Color(0xFF404040),
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          enableLineIndicator: true,
          lineIndicatorWidth: 3,
          indicatorType: IndicatorType.Top,
          customBottomBarItems: [
            CustomBottomBarItems(icon: Icons.house_outlined, label: "Anasayfa"),
            CustomBottomBarItems(icon: Icons.favorite_border, label: "Favoriler"),
            CustomBottomBarItems(icon: Icons.arrow_drop_up, label: "Arama"),
            CustomBottomBarItems(icon: Icons.account_circle, label: "Hesap"),
            CustomBottomBarItems(icon: Icons.shopping_bag_outlined, label: "Sepet"),
          ],
          // items: const <BottomNavigationBarItem>[
          //   BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Anasayfa"),
          //   BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Favoriler"),
          //   BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Arama"),
          //   BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Hesap"),
          //   BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "Sepet"),
          // ],
          // showUnselectedLabels: true,
          // currentIndex: _selectedIndex,
          // unselectedItemColor: Colors.black87,
          // selectedItemColor: Colors.teal,
          // onTap: _onItemTapped,
        ),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "resimler/appBar.jpg",
          width: 150,
          height: 120,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                AppIcon.updown,
                color: Color(0xFF00897B),
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              AppIcon.filtre,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Lipsticks>>(
        future: lipstickleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var lipsticksListesi = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top: 6, left: 8),
              child: GridView.builder(
                  itemCount: lipsticksListesi!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 4.3,
                  ),
                  itemBuilder: ((context, index) {
                    var lipstiks = lipsticksListesi[index];
                    return SingleChildScrollView(
                      child: Card(
                        margin: EdgeInsets.only(top: 6, left: 4, bottom: 10, right: 8),
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 100, bottom: 8),
                              child: Icon(
                                CupertinoIcons.heart,
                                color: Color(0xFF00897B),
                              ),
                            ),
                            Image.asset(
                              "resimler/${lipstiks.lipStickResimAdi}",
                              width: 120,
                              height: 120,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                lipstiks.lipStickAdi,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF424242)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 38),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Başlangıç Fiyatı",
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
                                      textAlign: TextAlign.start,
                                      maxLines: 17,
                                    ),
                                    SizedBox(
                                      width: 16,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${lipstiks.lipStickFiyat} ₺",
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
                                  ),
                                ),
                                SizedBox(
                                  width: 66,
                                  height: 10,
                                ),
                                Image.asset(
                                  "resimler/card.jpg",
                                  width: 30,
                                  height: 40,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: RatingBar.builder(
                                      itemPadding: EdgeInsets.only(top: 10, left: 4),
                                      initialRating: 4.5,
                                      ignoreGestures: true,
                                      unratedColor: Colors.grey,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 12.0,
                                      updateOnDrag: true,
                                      itemBuilder: ((context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          )),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      }),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Text(
                                    "${lipstiks.cardFiyat} ₺",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF00838F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, left: 8, right: 8, bottom: 8),
                              child: Container(
                                height: 38,
                                child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  color: Color(0xFF00838F),
                                  borderRadius: BorderRadius.circular(5),
                                  minSize: 10,
                                  child: Row(
                                    children: [
                                      Text(
                                        "SEPETE",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40),
                                        child: Icon(
                                          CupertinoIcons.bag,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                  pressedOpacity: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
