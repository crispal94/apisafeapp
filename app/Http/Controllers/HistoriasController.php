<?php namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Post;
use App\Imagen;
use App\Referenciales;
use App\Estadoanimo;
use App\Comentarios;
use App\Reaccion;
use App\Historias;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use DB;
use App\Seguidores;

class HistoriasController extends Controller {


  public function postHistoria(Request $request){
    $iduser = $request->input('iduser');
    $file = $request->file('file');

    $idfinal = Historias::where('id_user',$iduser)->max('secuencial_img');
    $nextsecuencial = $idfinal + 1;
    $historia = new Historias();
    $historia->id_user = $iduser;
    $historia->vigencia_inicio = date("Y-m-d H:i:s");

    $mod_date = strtotime($historia->vigencia_inicio."+ 1 days");
    $historia->vigencia_fin = date("Y-m-d H:i:s",$mod_date);

    $destinationPath = 'C:\xampp\htdocs\apisafeapp\public\img-historia';
    $nombreimagen = $nextsecuencial.date("Y-m-d").'.jpg';
    //var_dump($nombreimagen);
    $url = $destinationPath.DIRECTORY_SEPARATOR.$nombreimagen;
    $file->move($destinationPath,$nombreimagen);
    $historia->secuencial_img = $nextsecuencial;
    $historia->url = $url;
    $historia->save();

    $array = ['success'=>true,'message'=>'historia creada con exito'];
    return response()->json($array);
  }


  public function getHistoriasxUser($id){

    $seguidores = Seguidores::where('id_user_padre',$id)->get();
    $jsontotal = [];
    foreach ($seguidores as $seg){
      foreach($seg->historias as $historia){
        $fechaini = $historia->vigencia_inicio;
        $fechafin = $historia->vigencia_fin;
        $fechaactual = date("Y-m-d H:i:s");

        if($fechaactual>=$fechaini&&$fechaactual<=$fechafin){
          $tmp = [];
          $tmp['id_seguidor'] = $seg->id_user_seguidor;
          $tmp['url'] = $historia->url;
          array_push($jsontotal,$tmp);
        }
      }
    }

      return response()->json($jsontotal);

  }



}
