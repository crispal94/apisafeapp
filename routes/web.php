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

$router->get('prueba','ExampleController@prueba');


$router->post('/login', 'LoginController@index');
$router->post('/register', 'UserController@register');
$router->get('user/{id}', ['middleware' => 'auth', 'uses'=>'UserController@getUser']);
$router->post('postfollower','UserController@postfollower');

/**
 * Routes for resource post
 */
$router->get('post', 'PostsController@all');
$router->get('post/{id}', 'PostsController@getPost');
$router->get('postall','PostsController@getPostAll');
$router->post('postcomentario','PostsController@postComentario');
$router->post('postreaccion','PostsController@postReaccion');
$router->get('getcomentariospost','PostsController@getComentariosPost');
$router->get('getreaccionespost','PostsController@getReaccionesPost');
$router->post('post', 'PostsController@addPost');
$router->put('post/{id}', 'PostsController@put');
$router->delete('post/{id}', 'PostsController@remove');



$router->get('getconsejo/{id}','ConsejosController@getConsejo');

/**
 * Routes for resource consejos
 */
/*$app->get('consejos', 'ConsejosController@all');
$app->get('consejos/{id}', 'ConsejosController@get');
$app->post('consejos', 'ConsejosController@add');
$app->put('consejos/{id}', 'ConsejosController@put');
$app->delete('consejos/{id}', 'ConsejosController@remove');*/

/**
 * Routes for resource historias
 */
$router->get('historias', 'HistoriasController@all');
$router->get('historias/{id}', 'HistoriasController@get');
$router->post('historias', 'HistoriasController@postHistoria');
$router->put('historias/{id}', 'HistoriasController@put');
$router->delete('historias/{id}', 'HistoriasController@remove');
$router->get('gethistoriasxuser/{id}','HistoriasController@getHistoriasxUser');
