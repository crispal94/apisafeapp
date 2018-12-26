<?php namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use App\User;
use App\Consejos;
use App\Estadoanimo;

class ConsejosController extends Controller {

public function GetConsejo($id){
  $consejo = Consejos::where('id_estadoanimo',$id)->inRandomOrder()->first();
  return response()->json($consejo);
}

public function getEstados(){
  $estados = Estadoanimo::all();
  return response()->json($estados);
}

}
