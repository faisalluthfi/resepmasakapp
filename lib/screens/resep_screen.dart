import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep/providers/resep_provider.dart';
import 'package:resep/screens/detail_resep_screen.dart';

class ResepScreen extends StatefulWidget {
  const ResepScreen({Key? key}) : super(key: key);

  @override
  State<ResepScreen> createState() => _ResepScreenState();
}

class _ResepScreenState extends State<ResepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        toolbarHeight: 100,
        elevation: 14,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70))
        ),
        title: const Text('Resep Makanan'),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 7, spreadRadius: 3,
                  color: Colors.pink
                  )
                  ],
                  shape: BoxShape.circle,
                  color: Colors.pink.shade400
                ),
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 7,spreadRadius: 3,
                    color: Colors.pink
                    )
                  ],
                  shape: BoxShape.circle,
                  color: Colors.pink
                ),
                child: Icon(
                  Icons.notifications,size: 20,
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius:  7, spreadRadius: 3
                  ,
                  color: Colors.pink),
                  ],
                ),
                child: Icon(
                  Icons.logout,size: 20,
                ),
              ),
              SizedBox(width: 26,)
            ],
          ),
        ],
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          return ListView.builder(
            itemCount: resepProvider.resepModel.results?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResepScreen(
                        title: resepProvider.resepModel.results![index].title,
                        id: resepProvider.resepModel.results![index].key,
                      ),
                    ),
                  );
                  resepProvider.showDetailResep(resepProvider.resepModel.results![index].key);
                },
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            "${resepProvider.resepModel.results![index].thumb}"),
                        Text(
                          "${resepProvider.resepModel.results![index].title}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "Porsi : ${resepProvider.resepModel.results![index].portion}"),
                        Text(
                            "Lama Pengerjaan : ${resepProvider.resepModel.results![index].times}"),
                        Text(
                            "Level Pengerjaan : ${resepProvider.resepModel.results![index].dificulty}"),
                      ],
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.all(18),
          );
        },
      ),
    );
  }
}