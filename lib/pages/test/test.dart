import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var currentColor = "#6ae792";
  var isShowPandaImage = false;

  setColor(value) {
    setState(() {
      currentColor = value;
    });
  }

  togglePandaImage(){
    setState(() {
      isShowPandaImage = !isShowPandaImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: currentColor.toColor(),
        title: const Text('Test Components'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: (context, index) => ColorPallet(index,
                        setColor: setColor, currentColor: currentColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10))),
                      minimumSize: const Size(50, 50),
                      backgroundColor: currentColor.toColor(),
                    ),
                    child: const Text("ElevatedButtonr",
                        style: TextStyle(color: Colors.white))),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ac_unit_sharp, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: currentColor.toColor(),
                  ),
                ),
                OutlinedButton(
                    onPressed: () => togglePandaImage(),
                    child: const Text("Outlined Show Img"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: currentColor.toColor(),
                    side: BorderSide(color: currentColor.toColor())
                  ),
                ),
                TextButton(
                    onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                          content: Text("I'm Banner", style: TextStyle(color: Colors.white)),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          dividerColor: Colors.transparent,
                          backgroundColor: currentColor.toColor(),
                          actions: [
                        IconButton(
                          onPressed: () => ScaffoldMessenger.of(context).clearMaterialBanners(),
                          icon: Icon(Icons.close_outlined),
                        ),
                      ])
                    ),
                    child: const Text("TextButton and Banner"),
                  style: TextButton.styleFrom(
                    foregroundColor: currentColor.toColor()
                  ),
                )
              ],
            ),
            Wrap(
              children: [
                Visibility(
                    visible: isShowPandaImage,
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                      height: 250,
                      width: 250,
                      'assets/images/panda.jpg')
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ColorPallet extends StatelessWidget {
  final int index;
  final setColor;
  final currentColor;

  const ColorPallet(this.index, {super.key, this.setColor, this.currentColor});

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length];
    final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();

    var hexText = Text(
      '#$hexRgb',
      style: const TextStyle(color: Colors.white),
    );

    var snackbar = SnackBar(
      content: hexText,
      duration: const Duration(milliseconds: 1500),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: '#$hexRgb'.toColor(),
    );

    return GestureDetector(
      onTap: () {
        setColor('#$hexRgb');
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: Container(
        width: 80,
        color: color,
        child: Center(
            child: hexText),
      ),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
