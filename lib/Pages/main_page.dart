import 'package:flutter/material.dart';
import 'package:viacepdesafio/Pages/consulta_page.dart';
import 'package:viacepdesafio/Pages/historic_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPag = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Consulte CEP!"),),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  setState(() {
                    posicaoPag = value;
                  });
                },
                children: const [
                  ConsultaPage(),
                  HistoricPage(),
                ],
              ),
            ),
            BottomNavigationBar(type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: posicaoPag,
            items: const [
              BottomNavigationBarItem(label: "Consulta", icon: Icon(Icons.zoom_in)),
              BottomNavigationBarItem(label: "Histórico", icon: Icon(Icons.list)),
            ],)
          ],
        )
      ));
  }
}