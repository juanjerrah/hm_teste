import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HumorFormPage extends StatefulWidget {
  dynamic humor;
  HumorFormPage({super.key, this.humor});

  @override
  State<HumorFormPage> createState() => _HumorFormPageState();
}

class _HumorFormPageState extends State<HumorFormPage> {
  bool isEdit = false;
  bool permiteVisualizacao = false;
  int tipoHumor = 0;
  List<Map<dynamic, dynamic>> tiposHumor = [
    {
      "id": 1,
      "mensagem": "Me sentindo Feliz",
      "emoji": "lib/assets/happy2.svg"
    },
    {
      "id": 2,
      "mensagem": "Me sentindo Entediado",
      "emoji": "lib/assets/bored.svg"
    },
    {"id": 3, "mensagem": "Me sentindo Triste", "emoji": "lib/assets/sad.svg"},
    {
      "id": 4,
      "mensagem": "Me sentindo Confuso",
      "emoji": "lib/assets/confused2.svg"
    },
    {"id": 5, "mensagem": "Me sentindo Bravo", "emoji": "lib/assets/angry.svg"},
  ];

  TextEditingController tituloHumorController = TextEditingController();
  TextEditingController descricaoHumorController = TextEditingController();
  TextEditingController tipoHumorController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final item = widget.humor;

    if (item == null) {
      isEdit = true;

      final titulo = item["tituloHumor"];
      final tipoDoHumor = item["tipoDoHumor"];
      final descricaoHumor = item["descricaoHumor"];
      final permiteVisualiz = item["permiteVisualizacao"];

      tituloHumorController.text = titulo;
      descricaoHumorController.text = descricaoHumor;
      tipoHumor = tipoDoHumor;
      permiteVisualizacao = !permiteVisualiz;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Humor form"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: tituloHumorController,
              style: const TextStyle(fontSize: 20, color: Color(0xff374957)),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffd9d9d9),
                hintText: "Titulo do humor",
                hintStyle: TextStyle(color: Color(0xff374957)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                contentPadding:
                    EdgeInsets.only(left: 16, top: 18, bottom: 18, right: 16),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: descricaoHumorController,
              maxLines: 12,
              style: const TextStyle(fontSize: 20, color: Color(0xff374957)),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffd9d9d9),
                hintText: "Descreva a situação...",
                hintStyle: TextStyle(color: Color(0xff374957)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 16, top: 18, bottom: 18),
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        tipoHumor = 1;
                      })
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        tipoHumor == 1 ? Colors.green : Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(tiposHumor[tipoHumor - 1]["emoji"]),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        tipoHumor = 2;
                      })
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        tipoHumor == 2 ? Colors.green : Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(tiposHumor[tipoHumor - 1]["emoji"]),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        tipoHumor = 3;
                      })
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        tipoHumor == 3 ? Colors.green : Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(tiposHumor[tipoHumor - 1]["emoji"]),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        tipoHumor = 4;
                      })
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        tipoHumor == 4 ? Colors.green : Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(tiposHumor[tipoHumor - 1]["emoji"]),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        tipoHumor = 5;
                      })
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        tipoHumor == 5 ? Colors.green : Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(tiposHumor[tipoHumor - 1]["emoji"]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: permiteVisualizacao,
                    fillColor: MaterialStateProperty.all(const Color(0xFF011E31)),
                    onChanged: (bool? value) {
                      setState(() {
                        permiteVisualizacao = value!;
                      });
                    }),
                const Text(
                  "Tornar Anônimo",
                  style: TextStyle(color: Color(0xff374957), fontSize: 16),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(100, 5, 100, 5))),
              onPressed: isEdit ? update : submitHumor,
              child: Text(
                isEdit ? "Atualizar" : "Salvar",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> update() async {
    final item = widget.humor;
    if (item == null) {
      print("Todo can not be updated without data");
      return;
    }
    final id = item["id"];
    final titulo = tituloHumorController.text;
    final descricao = descricaoHumorController.text;

    const baseUrl = 'https://10.0.2.2:7053/api/Humor';

    final body = {
      "id": id,
      "titulo": titulo,
      "descricao": descricao,
      "tipoHumor": 1,
      "permiteVisualizacao": !permiteVisualizacao
    };

    final response = await http.put(
      Uri.parse(baseUrl),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json', "accept": "*/*"},
    );

    // if (response.statusCode == 200) {
    //   showSuccessMessage(context, "Updation Success");
    // } else {
    //   showErroMessage(context, "Updation Failed");
    // }
  }

  Future<void> submitHumor() async {
    const header = {'accept': 'text/plain', 'Content-Type': 'application/json'};
    final titulo = tituloHumorController.text;
    final descricao = descricaoHumorController.text;

    final body = {
      "titulo": titulo,
      "descricao": descricao,
      "tipoHumor": tipoHumor,
      "permiteVisualizacao": !permiteVisualizacao
    };
    const urlBase = 'https://10.0.2.2:7053/api/Humor';

    final json = jsonEncode(body);

    final response =
        await http.post(Uri.parse(urlBase), headers: header, body: json);

    if (response.statusCode == 200) {
      tituloHumorController.text = '';
      descricaoHumorController.text = '';
      //showSuccessMessage(context, "Creation Success");
      //NavigateToDiaryListPage;
      print("Success");
    } else {
      //showErroMessage("Creation Failed");
      print("Failed");
    }

    print(response.body);
  }
}
