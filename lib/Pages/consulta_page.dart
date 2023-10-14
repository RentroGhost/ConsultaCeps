import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viacepdesafio/Models/cep_back4app_model.dart';
import 'package:viacepdesafio/Models/viacep_model.dart';
import 'package:viacepdesafio/Repositories/cep_back4app_repository.dart';
import 'package:viacepdesafio/Repositories/cep_repository.dart';

class ConsultaPage extends StatefulWidget {
  const ConsultaPage({super.key});

  @override
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {

  var cepController = TextEditingController(text:"");
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var cepRepository = CepRepository();
  CepBack4AppRepository cepBack4AppRepository = CepBack4AppRepository();
  bool isCepSubmitted = false;
  
  void consultarCEP() async {
    var cep = cepController.text.replaceAll(RegExp(r'[^0-9]'), '');
      
              if (cep.length == 8) {
                setState(() {
                  loading = true;
                  isCepSubmitted = true;
                });
                viacepModel = await cepRepository.consultarCep(cep);
              }
              setState(() {
                loading = false;
                isCepSubmitted = false;
              });


                CepBack4AppModel ceps = await cepBack4AppRepository.obterCeps();

                
               List<String> cepJsonList = []; 
              ceps.ceps.forEach((cep) async {
                // print(viacepModel.cep + " " + cep.cep);
                // print(ceps.ceps.length); 
                cepJsonList.add(cep.cep);
                print(cep.cep);

              });
              print("Teste");
              

                if (!cepJsonList.contains(viacepModel.cep)){
                  await cepBack4AppRepository.criar(Ceps.criar(viacepModel.logradouro, viacepModel.cep, viacepModel.bairro, viacepModel.localidade, viacepModel.uf, viacepModel.ddd));
                }
              setState(() {
                  
                });
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [Text("Consultar CEPS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
          
          TextField(
            controller: cepController,
            keyboardType: TextInputType.number,
            // onChanged: (String value) async {
              


              
            // },
            onSubmitted: (String value) async {
              if (!isCepSubmitted) {
                consultarCEP();
              }
            

            },


          ),
              
              


          const SizedBox(height: 60),
          Card(child: 
          Column(
            children: [
              Text("Resultado da pesquisa de CEP:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              Text("${viacepModel.logradouro ?? ""}", style: TextStyle(fontSize: 20),),
              Text("${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}", style: const TextStyle(fontSize: 20)),
               
          ],)),
         if (loading) const CircularProgressIndicator()
          ]),
      ),
    ),);
  }
}