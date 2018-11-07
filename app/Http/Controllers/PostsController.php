<?php namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Post;
use App\Imagen;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use DB;

class PostsController extends Controller {

public function addPost(Request $request){
  $iduser = $request->input('iduser');
  $flag = $request->input('tipo');
  $file = $request->file('file');
  $idestado = $request->input('idestado');
  $descripcion = $request->input('descripcion');
  $estcomentario = $request->input('estcomentario');

  //SI ES TIPO 1 ES TEXTO, TIPO 2 ES IMAGEN, TIPO 3 IMAGEN Y TEXTO

  if($flag==1){
  $post = new Post;
  $post->id_user = $iduser;
  $post->id_referenciales = $flag;
  $post->id_estadoanimo = $idestado;
  $post->descripcion = $descripcion;
  $post->est_comentario = $estcomentario;
  $post->save();
  $array = ['success'=>true,'message'=>'Post creado con exito'];
  return response()->json($array);
}else if($flag==2){

  $idfinal = Imagen::where('id_user',$iduser)->max('id');
  $imagen = new Imagen;
  $imagen->id_referenciales = 4;
  $nombreimagen = 'post'.$iduser.($idfinal+1).'.jpg';
  $imagen->descripcion = $nombreimagen;
  $imagen->id_user = $iduser;
  $imagen->save();

  $destinationPath = 'C:\xampp\htdocs\apisafeapp\public';
  $file->move($destinationPath,$nombreimagen);

  $post = new Post;
  $post->id_user = $iduser;
  $post->id_referenciales = $flag;
  $post->id_imagen = $imagen->id;
  $post->descripcion = 'post con imagen';
  $post->id_estadoanimo = $idestado;
  $post->est_comentario = $estcomentario;
  $post->save();
  $array = ['success'=>true,'message'=>'Post creado con exito'];
  return response()->json($array);

  }else if($flag==3){

  }

}

}
