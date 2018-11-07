<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

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
        $telefono = $request->input('telefono');
        $password = $hasher->make($request->input('password'));
        $user = User::create([
            'nombres' => $nombres,
            'apellidos' => $apellidos,
            'nickname' => $nickname,
            'telefono' => $telefono,
            'email' => $email,
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
}
