<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class LoginController extends Controller
{
    /**
     * Index login controller
     *
     * When user success login will retrive callback as api_token
     */    public function index(Request $request)
    {
        $hasher = app()->make('hash');

        $credential = $request->input('credential');
        $password = $request->input('password');
        $login = User::where('email', $credential)->orWhere('nickname',$credential)->first();

        if ( ! $login) {
            $res['success'] = false;
            $res['message'] = 'Tu email o contraseña esta incorrecta!';
            return response($res);
        } else {
            if ($hasher->check($password, $login->password)) {
                $api_token = sha1(time());
                $create_token = User::where('id', $login->id)->update(['api_token' => $api_token]);
                if ($create_token) {
                    $res['success'] = true;
                    $res['api_token'] = $api_token;
                    $res['message'] = $login;
                    return response($res);
                }
            } else {
                $res['success'] = false;
                $res['message'] = 'Tu email o contraseña esta incorrecta!';
                return response($res);
            }
        }
    }
}
