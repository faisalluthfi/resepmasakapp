import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep/providers/resep_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailResepScreen extends StatefulWidget {
  final String? title;
  final String? id;
  const DetailResepScreen({this.title, this.id, Key? key}) : super(key: key);

  @override
  State<DetailResepScreen> createState() => _DetailResepScreenState();
}

class _DetailResepScreenState extends State<DetailResepScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"), 
        backgroundColor: Colors.green,
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          return SingleChildScrollView(
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        "${resepProvider.detailResepModel.results!.thumb}"),
                    Container(
                      decoration: BoxDecoration(
                    
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(color: Colors.green,spreadRadius: 3),
                          
                        ]
                      ),
                      child: Text(
                        "${resepProvider.detailResepModel.results!.title}",
                        style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Porsi : ${resepProvider.detailResepModel.results!.servings}",
                      
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        "Lama Pengerjaan : ${resepProvider.detailResepModel.results!.times}"),
                    SizedBox(height: 10.0),
                    Text(
                        "Level Pengerjaan : ${resepProvider.detailResepModel.results!.dificulty}"),
                    SizedBox(height: 10.0),
                    Text(
                        "Penulis : ${resepProvider.detailResepModel.results!.author!.user}"),
                        SizedBox(height: 10.0),
                    Text(
                        "Penulis : ${resepProvider.detailResepModel.results!.author!.datePublished}"),
                    SizedBox(height: 10.0),
                    
                    Text(
                        "Deskripsi : ${resepProvider.detailResepModel.results!.desc}"),
                    SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: resepProvider.detailResepModel.results!.needItem!.length ,
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            Text("${resepProvider.detailResepModel.results!.needItem![index].itemName!}"),
                            Image.network("${resepProvider.detailResepModel.results!.needItem![index].thumbItem!}"),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        "Bahan-Bahan : ${resepProvider.detailResepModel.results!.ingredient}"),
                        
                    SizedBox(height: 10.0),
                    Text(
                        "STEP : "),
                    Text("${resepProvider.detailResepModel.results!.step}"),
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
