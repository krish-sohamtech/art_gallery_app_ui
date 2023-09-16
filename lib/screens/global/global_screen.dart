// import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GlobalPage extends StatefulWidget {
  const GlobalPage({super.key});

  @override
  State<GlobalPage> createState() => GlobalPageState();
}

class GlobalPageState extends State<GlobalPage> {
  @override
  Widget build(BuildContext context) {
    var height_ = MediaQuery.of(context).size.height;
    var width_ = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 11.0),
              child: Text("Boards",
                  style: TextStyle(
                    color: Color.fromRGBO(71, 71, 71, 1),
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ),
          const Text(
            "Following galleries to power up your art career",
              style: TextStyle(
                color: Color.fromRGBO(151, 158, 166, 1),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: height_ * 0.05,
                  width: width_ * 0.3,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        // AppColors.cherryRed,

                        Color.fromRGBO(247, 131, 131, 1),
                        Color.fromRGBO(250, 36, 36, 1),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text("painting",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white70,
                            size: height_ * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width_ * 0.05,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: height_ * 0.05,
                  width: width_ * 0.3,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(247, 131, 131, 1),
                        Color.fromRGBO(250, 36, 36, 1)
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text("Illustration",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white70,
                            size: height_ * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            height: height_ * 0.3,
            width: width_ * 0.9,
            child: Center(
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        1, // Set cross-axis count to 1 for the left image
                    mainAxisCellCount:
                        2, // Set main-axis count to 2 for the left image
                    child: Image(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/c4b4/b3ad/2f40ccca7a634230c963b832a945f6c2?Expires=1695600000&Signature=qGVq4lPrIjL819HHz3bVecghoreLamYuevPJATDuHgbxuG90yNWUUZ56raDzMh-jdBE0e171aV128kbZxm9u01N3q6jZgvQkGlNNmHoblZN901yM3vggV42d5zHcQMopgeZn~vdnUQ7Nqa1Hhe7cHc5-O7d7MZXW7UZewqiDTriumjzsF3jxQQEG1V~ombzVzUBXKafnaOi0Z3MWGVBSW7HlZrjud-sHSpAo3J2wT3o~p4Hqj2u6~IOYIkN6ob8vXEbTrM5x5K2gsJ48B2wbDjUQVjGaflD~qKtEmZ93JCutdtEWdT-HeBV3dzNt2lN0IF5-bVjgMUiFyG2j1~wbMg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/3578/7358/8a30bdde12665240eedadad62258698f?Expires=1695600000&Signature=auI9ycUZ0vzRZWFFqP5KWFKK-TUDiefM067aEBRsWpoQiZHxGZKoW4W9bSFOgen0iN-F3DZh~eQOlj-FVcWpTM0Y5qGnNoPpFyF1sQoRP~E2Bgk~Xj-kWOwzlaP6yMmIp9frX5n4sE2Sp8SM4LMddF-gVJeLDk9oBQqC9S~WKetH1oSdaisHvJc7lEHtqc4rRYAKviQRPZxfGSJL2bzbKkDqk3twHLBLHqVkzAvsPSRO1UiiA9MVi2RP5XJoXQBgM8OBKwUw~f4UoHfwmGriSMxPtatpcWRJMQ90Ib5TJsZX~ZMPOYQ8bMXEMWuPNrV5sZj-yGVdoTGdjDlNiJyyPQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/662e/dfb6/284f3208f792c89bc810c3044713d786?Expires=1695600000&Signature=Rjh81-ycBOU4v~2ydSw1tEKyLfBhpV0mt3D2lPB3I2JCRacDeD5ib6QU-esmhz-kyPE1g7wD0MiolSvMHGVzDVqdrkLAVYEThQa-zUjsmHRt~fscfQbMgdGBG8LGAup98rhLIflwpwT~pMO6nYhRelT5xmSGjcYnkxXn3JDmRfJTESN~cQV9koG7RDjV4vVF68SsDQ0p5T8fTdJsu4y08-gAdYpQdRlNF61qrblCVPoaqV7dmzL4~f~SjqYEVUlpPtbXpL159Bz1lXiB6vC-hK8dz7NkMg0G9rqUU2RaANoFkJsstIXo0Cz~X1OobEUHKlwVVHPHDXsc-3pl8XrWqA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("paintings",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            height: height_ * 0.35,
            width: width_ * 0.9,
            child: Center(
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        1, // Set cross-axis count to 1 for the left image
                    mainAxisCellCount:
                        2, // Set main-axis count to 2 for the left image
                    child: Image(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/ba33/f986/012c3a4528111744eeedd93dd859e6bf?Expires=1695600000&Signature=gVf6DbSMrceIK7Ti4W--0xmQv9ExHRdclNL4DUMOSfMUaqbKwGzULDARxipmUbhEo764zOynMmkD4MdzojWmuH1LCPVZPQu9Fe91RRTfnNkz3SYD-vWnAwLFjBOVmRYESgez6OwYpwmEhNp0Qy5Il8r-Dx1-akiDklGuF4~beYD6e7XMZB7Wad-TENXrV-7f8nVKvGF-A2FNyns0O-lRifAcPlwK-Cvmj86~iRJ6eigoUA-fiWRy6~npy~f93UKX1TDHQwAd4idpVVmW~kM-8OSedhimIEdHC4nR6OZt~oDk-xn4XL0ZZYA4XVAHovP5szZkCbhvOPViimuFbNpcUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/81ad/4d02/0dca6c18ca643b093ebf1d9146a38070?Expires=1695600000&Signature=ZS~OQ-gCApWqzXnRAwR1F~HTICP-xTschPSMaynkvkTnOLfg9MW8wZNCxSdXtU7Ms93BT-InmD6jQTu3YYZtsm4BhSWef7Jrx8HVCgFDe-BXBxZFeuzKFz4hKozVdKuosTKBediaJayscanyUIPqrfXHPinzS9OSAvy0JeBbmZrCGQFDlFI2MrOkcJ7Sc2t5jxZGRPnocFhrVX24bhLI1xrvz5sfP8liXsjQTuoExSzDgOiBEJnGG0NlycE-YDR6IQPfd3PdS3P2dDfX3DEal-SQdLXI9I60enT1JnBAnRY1EoSH6YtZXpkU4x32OD6SfxzIdi6WffauBne1LY6Ccg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      ),
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/0d6c/b276/144e5c48ba22891570a7ab62512ee225?Expires=1695600000&Signature=Sm3tVrlvRzV4fgsBvM3kD4xC~u9~N-hEpGTSlWliQYTntRs3giBcNVVgYKmUjLjoBijP2DwgKZxU3orJ8ezQXVQv2qeBhLFlUrUx-IEDlPObZu-EieDX6cAxif9qLFtSRRnq9CB~AyBKw1KBtfOMz6tH00iQ8Z~sNnPFadG92pKxXU7h7ILIySS1TUfN7fnz6C~hxKdxKuHwPjn~E9NppWK5xqh0vvAx7iZmr~m45ZlfkZj~GgDutTEoKmqcAkD0~XXHR0QxKAGEDZVRm46V2y46Gn90gHyivmsVhryLS0rPxwF9nW3VVJ4BPyanfadC5VIX48MMKB5RHmwdQnNE6Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      ),
                      fit: BoxFit.fill, // Adjust the fit as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Illustrations",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          SizedBox(
            
            height: height_ * 0.3,
            width: width_ * 0.9,
            child: Center(
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        1, // Set cross-axis count to 1 for the left image
                    mainAxisCellCount:
                        2, // Set main-axis count to 2 for the left image
                    child: Image(
                      image: NetworkImage(
                        'https://www.shutterstock.com/shutterstock/photos/2265632523/display_1500/stock-photo-david-street-style-graphic-design-textile-artwork-for-t-shirts-pop-art-david-statue-illustration-2265632523.jpg',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkVWOXXPx1T5N42hIC5EEtJAAd4qKY1hd9Gg&usqp=CAU',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ-BrK94v--HHiYLRgXDxxGLzhfC5IT8VDJ1oP4l0kq3Xx30duW',
                      ),
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Art",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            height: height_ * 0.35,
            width: width_ * 0.9,
            child: Center(
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        1, // Set cross-axis count to 1 for the left image
                    mainAxisCellCount:
                        2, // Set main-axis count to 2 for the left image
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZxHMgzmy32lobZiLHF6C9leeFWZlU8f3Snw&usqp=CAU',
                      ),
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMXwXcwzjv6l6kvmR1RLZQFMW2w3fSHxlJ4Q&usqp=CAU',
                      ),
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount:
                        2, // Set cross-axis count to 1 for the right images
                    mainAxisCellCount:
                        1, // Set main-axis count to 1 for the right images
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3OSmA_w_TYYpVj1IdbzFzRpZIMuMuHIQg3Q&usqp=CAU',
                      ),
                      fit: BoxFit.fill, // Adjust the fit as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
