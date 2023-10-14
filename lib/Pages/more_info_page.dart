import 'package:flutter/material.dart';
import 'package:viacepdesafio/Models/cep_back4app_model.dart';
import 'package:viacepdesafio/Repositories/cep_back4app_repository.dart';

class MoreInfoPage extends StatefulWidget {
  final String cepId;
  const MoreInfoPage({super.key, required this.cepId});

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {

  late CepBack4AppRepository cepBack4AppRepository;
  var cepsInfo = <Ceps>[];
  // var cepsInfo = CepBack4AppModel([]);
  // var cepsBack4App = CepBack4AppModel([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cepBack4AppRepository = CepBack4AppRepository();
    carregarDados();
  }

  carregarDados() async {
    // cepsInfo = await cepBack4AppRepository.retornaInfo(widget.cepId);
    cepsInfo = [await cepBack4AppRepository.retornaInfo(widget.cepId)];
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Mais informações"),),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: cepsInfo.length == 0 ? Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: cepsInfo.length,
          itemBuilder: (bc, int index) {
            var cepInfo = cepsInfo[index];
            // var cepInfo = cepsBack4App.ceps[index];
            return Card(child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CEP: ${cepInfo.cep}"),
                      Text("Rua: ${cepInfo.logradouro}"),
                      Text("Bairro: ${cepInfo.bairro}"),
                      Text("Cidade: ${cepInfo.localidade}"),
                      Text("Estado: ${cepInfo.uf}"),
                      Text("DDD: ${cepInfo.ddd}"),
                    ],
                  )
                ],
              )
            ),);
          }))
      ),
    );
  }
}