<?php
namespace App\Http\Controllers;



use Illuminate\Http\Request;
use App\User;
use App\Seguidores;

class UserController extends Controller
{
    /**
     * Register new user
     *
     * @param $request Request
     */    public function register(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);

        $hasher = app()->make('hash');
        $email = $request->input('email');
        $nombres = $request->input('nombres');
        $apellidos = $request->input('apellidos');
        $nickname = $request->input('nickname');
        $genero = $request->input('genero');
        $telefono = $request->input('telefono');
        $password = $hasher->make($request->input('password'));

        $user = User::create([
            'nombres' => $nombres,
            'apellidos' => $apellidos,
            'nickname' => $nickname,
            'telefono' => $telefono,
            'email' => $email,
            'genero' => $genero,
            'password' => $password,
        ]);

        $res['success'] = true;
        $res['message'] = 'Registro realizado con exito';
        $res['data'] = $user;
        return response($res);
    }
    /**
     * Get user by id
     *
     * URL /user/{id}
     */
    public function getUser(Request $request, $id)
    {
        $user = User::where('id', $id)->get();
        if ($user) {
              $res['success'] = true;
              $res['message'] = $user;

              return response($res);
        }else{
          $res['success'] = false;
          $res['message'] = 'Cannot find user!';

          return response($res);
        }
    }


    public function postfollower(Request $request){
      $idpadre = $request->input('idpadre');
      $idhijo = $request->input('idhijo');
      $follower = new Seguidores();
      $follower->id_user_padre = $idpadre;
      $follower->id_user_seguidor = $idhijo;
      $follower->save();
      return response()->json(['success'=>true,'message'=>'Seguidor creado con exito']);
    }
}
