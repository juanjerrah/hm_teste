import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hm_test_implementation/repositories/Humor/humor_repository.dart';

import '../components/empty_humor_widget.dart';
import '../forms/humor/humor_form_page.dart';
import '../models/humor_model.dart';

class HumorScreen extends StatefulWidget {
  const HumorScreen({super.key});

  @override
  State<HumorScreen> createState() => _HumorScreenState();
}

class _HumorScreenState extends State<HumorScreen> {
  List<dynamic> humores = [];

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

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    List<dynamic> humoresFetched = await HumorRepository().ObterHumores();

    setState(() {
      humores = [];
    });
  }

  void navigateToHumorForm(dynamic humor) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => HumorFormPage(humor: humor)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HealthyMind"),
          backgroundColor: const Color(0xFF011E31),
          actions: [
            IconButton(
                icon: const Icon(Icons.replay_outlined),
                onPressed: () => getData()),
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => navigateToHumorForm(null)),
          ],
        ),
        body: humores == []
            ? ListView.builder(
                itemBuilder: (BuildContext context, int humorIndex) {
                  final tipoDoHumor = humores[humorIndex]['tipoDoHumor'] as int;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 2.5),
                    child: ListTile(
                      onTap: () => navigateToHumorForm(humores[humorIndex]),
                      leading: SizedBox(
                        width: 40,
                        child: SvgPicture.asset(
                            tiposHumor[tipoDoHumor - 1]["emoji"]),
                      ),
                      title: Text(
                        tiposHumor[tipoDoHumor - 1]["mensagem"],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(humores[humorIndex]['tituloHumor'],
                          maxLines: 1,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          )),
                      trailing: const Icon(Icons.arrow_forward_rounded),
                      tileColor: Colors.grey[350],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
                //separatorBuilder: (_, ___) => const Divider(),
                itemCount: humores.length)
            : EmptyHumorWidget());
  }
}
