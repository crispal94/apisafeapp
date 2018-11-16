<?php namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Post;
use App\Imagen;
use App\Referenciales;
use App\Estadoanimo;
use App\Comentarios;
use App\Reaccion;
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
    $idfinal = Imagen::where('id_user',$iduser)->max('secuencial_img');
    $nextsecuencial = $idfinal + 1;
    $imagen = new Imagen;
    $imagen->id_referenciales = 4;
    $nombreimagen = 'post'.$iduser.$nextsecuencial.'.jpg';
    $imagen->descripcion = $nombreimagen;
    $imagen->secuencial_img = $nextsecuencial;
    $imagen->id_user = $iduser;
    $imagen->save();

    $destinationPath = 'C:\xampp\htdocs\apisafeapp\public';
    $file->move($destinationPath,$nombreimagen);

    $post = new Post;
    $post->id_user = $iduser;
    $post->id_referenciales = $flag;
    $post->id_imagen = $imagen->id;
    $post->descripcion = $descripcion;
    $post->id_estadoanimo = $idestado;
    $post->est_comentario = $estcomentario;
    $post->save();
    $array = ['success'=>true,'message'=>'Post creado con exito'];
    return response()->json($array);

  }

}


public function getPost(Request $request,$id){
    $posts = Post::where('id_user',$id)->get();
    $jsontotal = [];
    foreach ($posts as $post) {
      $tmp = [];
      $tmp['fecha'] = $post->created_at->toDateString();
      $referencial = Referenciales::find($post->id_referenciales);
      $tmp['tipo_post'] = $referencial->descripcion;
      $tmp['contenido'] = $post->descripcion;
      $imagen = $post->imagen->descripcion;
      $tmp['imagen'] = $imagen;
      $estadoanimo = Estadoanimo::find($post->id_estadoanimo);
      $tmp['estadoanimo'] = $estadoanimo->descripcion;
      array_push($jsontotal,$tmp);
    }
    return response()->json($jsontotal);
}


public function getPostAll(){
  $posts = Post::all();
  $jsontotal = [];
  foreach ($posts as $post) {
    $tmp = [];
    $tmp['fecha'] = $post->created_at->toDateString();
    $referencial = Referenciales::find($post->id_referenciales);
    $tmp['tipo_post'] = $referencial->descripcion;
    $tmp['contenido'] = $post->descripcion;
    $imagen = $post->imagen->descripcion;
    $tmp['imagen'] = $imagen;
    $estadoanimo = Estadoanimo::find($post->id_estadoanimo);
    $tmp['estadoanimo'] = $estadoanimo->descripcion;
    array_push($jsontotal,$tmp);
  }
  return response()->json($jsontotal);
}


public function postComentario(Request $request){
    $iduser = $request->input('iduser');
    $idpost = $request->input('idpost');
    $descripcion = $request->input('descripcion');

    $comentario = new Comentarios();
    $comentario->id_user = $iduser;
    $comentario->id_post = $idpost;
    $comentario->descripcion = $descripcion;
    $comentario->save();

      return response()->json(['success'=>true,'message'=>'Comentario creado con exito']);
}

public function postReaccion(Request $request){
    $iduser = $request->input('iduser');
    $idpost = $request->input('idpost');
    $descripcion = $request->input('descripcion');

    $reaccion = new Reaccion();
    $reaccion->id_user = $iduser;
    $reaccion->id_post = $idpost;
    $reaccion->save();

      return response()->json(['success'=>true,'message'=>'Reaccion creada con exito']);
}


public function getComentariosPost(Request $request){
  $iduser = $request->input('iduser');
  $idpost = $request->input('idpost');

  $comentarios = Comentarios::where('id_user',$iduser)->where('id_post',$idpost)->get();

  return response()->json($comentarios);
}


public function getReaccionesPost(Request $request){
  $iduser = $request->input('iduser');
  $idpost = $request->input('idpost');

  $reacciones = Reaccion::where('id_user',$iduser)->where('id_post',$idpost)->get();

  return response()->json($reacciones);
}

}
