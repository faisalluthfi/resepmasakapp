import 'package:flutter/cupertino.dart';
import 'package:resep/models/detail_resep_model.dart';
import 'package:resep/models/resep_model.dart';
import 'package:resep/services/resep_service.dart';

class ResepProvider extends ChangeNotifier{
   
  ResepProvider(){
    showListResep();

  }

  final ResepService _ResepService = ResepService();
  ResepModel resepModel = ResepModel();
  DetailResepModel detailResepModel = DetailResepModel();

  //show list resep data
  showListResep() async {
    resepModel = await _ResepService.getResep();
    notifyListeners();
  }

  //show detail resep data
  showDetailResep (String? id) async {
    print("id : $id");
    detailResepModel = await _ResepService.getDetailResep(key: id);
    notifyListeners();
  }
}

class ResepDetailProvider with ChangeNotifier{

  final ResepService _ResepService = ResepService();
  DetailResepModel detailResepModel = DetailResepModel();

}

