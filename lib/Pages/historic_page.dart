import 'package:flutter/material.dart';
// import 'package:viacepdesafio/APISimulate.dart';
import 'package:viacepdesafio/Models/cep_back4app_model.dart';
import 'package:viacepdesafio/Pages/more_info_page.dart';
import 'package:viacepdesafio/Repositories/cep_back4app_repository.dart';


class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  CepBack4AppRepository cepRepository = CepBack4AppRepository();
  // SimulatedCepBack4AppRepository cepRepository = SimulatedCepBack4AppRepository();
  CepBack4AppModel cepsBack4App = CepBack4AppModel([]);
  var loading = false;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {

    setState(() {
      loading = true;
    });
  

    cepsBack4App = await cepRepository.obterCeps();
    // print("Dados de CEPs obtidos: ${cepsBack4App.ceps}");

    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            loading ?
             Expanded(
              // child: Container(child: Text(cepsBack4App.ceps.toString()))) ://Center(
             child: Center(
               child: Container(margin: EdgeInsets.symmetric(vertical: 220),
                 child: CircularProgressIndicator()),
             ),
            ) :
            
            Expanded(child: ListView.builder(
              itemCount: cepsBack4App.ceps.length,
              itemBuilder: (BuildContext bc, int index) {
                var cep = cepsBack4App.ceps[index];

                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (bc) => MoreInfoPage(cepId: cep.objectId)));
                    },
                    child: Dismissible(onDismissed: (DismissDirection dismissDirection) async {
                      await cepRepository.remover(cep.objectId);
                      carregarDados();
                    },
                    key: Key(cep.cep),
                    child: ListTile(
                      title:  Text(cep.cep),
                      trailing: Text("Clique para mais informações"),
                    ),),
                  ),
                );

              }))
          ],
        ),
      ),
    );
  }
}