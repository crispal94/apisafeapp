<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    $res['success'] = true;
    $res['result'] = 'Hello world with lumen';
    return response($res);
});


$router->post('/login', 'LoginController@index');
$router->post('/register', 'UserController@register');
$router->get('user/{id}', ['middleware' => 'auth', 'uses'=>'UserController@getUser']);

/**
 * Routes for resource post
 */
$router->get('post', 'PostsController@all');
$router->get('post/{id}', 'PostsController@get');
$router->post('post', 'PostsController@addPost');
$router->put('post/{id}', 'PostsController@put');
$router->delete('post/{id}', 'PostsController@remove');
