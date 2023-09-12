// import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: const [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: Image(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/ba33/f986/012c3a4528111744eeedd93dd859e6bf?Expires=1695600000&Signature=gVf6DbSMrceIK7Ti4W--0xmQv9ExHRdclNL4DUMOSfMUaqbKwGzULDARxipmUbhEo764zOynMmkD4MdzojWmuH1LCPVZPQu9Fe91RRTfnNkz3SYD-vWnAwLFjBOVmRYESgez6OwYpwmEhNp0Qy5Il8r-Dx1-akiDklGuF4~beYD6e7XMZB7Wad-TENXrV-7f8nVKvGF-A2FNyns0O-lRifAcPlwK-Cvmj86~iRJ6eigoUA-fiWRy6~npy~f93UKX1TDHQwAd4idpVVmW~kM-8OSedhimIEdHC4nR6OZt~oDk-xn4XL0ZZYA4XVAHovP5szZkCbhvOPViimuFbNpcUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Image(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/81ad/4d02/0dca6c18ca643b093ebf1d9146a38070?Expires=1695600000&Signature=ZS~OQ-gCApWqzXnRAwR1F~HTICP-xTschPSMaynkvkTnOLfg9MW8wZNCxSdXtU7Ms93BT-InmD6jQTu3YYZtsm4BhSWef7Jrx8HVCgFDe-BXBxZFeuzKFz4hKozVdKuosTKBediaJayscanyUIPqrfXHPinzS9OSAvy0JeBbmZrCGQFDlFI2MrOkcJ7Sc2t5jxZGRPnocFhrVX24bhLI1xrvz5sfP8liXsjQTuoExSzDgOiBEJnGG0NlycE-YDR6IQPfd3PdS3P2dDfX3DEal-SQdLXI9I60enT1JnBAnRY1EoSH6YtZXpkU4x32OD6SfxzIdi6WffauBne1LY6Ccg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Image(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/81ad/4d02/0dca6c18ca643b093ebf1d9146a38070?Expires=1695600000&Signature=ZS~OQ-gCApWqzXnRAwR1F~HTICP-xTschPSMaynkvkTnOLfg9MW8wZNCxSdXtU7Ms93BT-InmD6jQTu3YYZtsm4BhSWef7Jrx8HVCgFDe-BXBxZFeuzKFz4hKozVdKuosTKBediaJayscanyUIPqrfXHPinzS9OSAvy0JeBbmZrCGQFDlFI2MrOkcJ7Sc2t5jxZGRPnocFhrVX24bhLI1xrvz5sfP8liXsjQTuoExSzDgOiBEJnGG0NlycE-YDR6IQPfd3PdS3P2dDfX3DEal-SQdLXI9I60enT1JnBAnRY1EoSH6YtZXpkU4x32OD6SfxzIdi6WffauBne1LY6Ccg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 0.5,
            child: Image(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/81ad/4d02/0dca6c18ca643b093ebf1d9146a38070?Expires=1695600000&Signature=ZS~OQ-gCApWqzXnRAwR1F~HTICP-xTschPSMaynkvkTnOLfg9MW8wZNCxSdXtU7Ms93BT-InmD6jQTu3YYZtsm4BhSWef7Jrx8HVCgFDe-BXBxZFeuzKFz4hKozVdKuosTKBediaJayscanyUIPqrfXHPinzS9OSAvy0JeBbmZrCGQFDlFI2MrOkcJ7Sc2t5jxZGRPnocFhrVX24bhLI1xrvz5sfP8liXsjQTuoExSzDgOiBEJnGG0NlycE-YDR6IQPfd3PdS3P2dDfX3DEal-SQdLXI9I60enT1JnBAnRY1EoSH6YtZXpkU4x32OD6SfxzIdi6WffauBne1LY6Ccg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 05,
            child: Image(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/81ad/4d02/0dca6c18ca643b093ebf1d9146a38070?Expires=1695600000&Signature=ZS~OQ-gCApWqzXnRAwR1F~HTICP-xTschPSMaynkvkTnOLfg9MW8wZNCxSdXtU7Ms93BT-InmD6jQTu3YYZtsm4BhSWef7Jrx8HVCgFDe-BXBxZFeuzKFz4hKozVdKuosTKBediaJayscanyUIPqrfXHPinzS9OSAvy0JeBbmZrCGQFDlFI2MrOkcJ7Sc2t5jxZGRPnocFhrVX24bhLI1xrvz5sfP8liXsjQTuoExSzDgOiBEJnGG0NlycE-YDR6IQPfd3PdS3P2dDfX3DEal-SQdLXI9I60enT1JnBAnRY1EoSH6YtZXpkU4x32OD6SfxzIdi6WffauBne1LY6Ccg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
          ),
        ],
      ),
    );
  }
}
