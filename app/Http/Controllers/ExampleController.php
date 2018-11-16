<?php

namespace App\Http\Controllers;

use App\Historias;

class ExampleController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function prueba(){
        $fechaactual = date("Y-m-d H:i:s");
        $historias = Historias::where('vigencia_fin','<',$fechaactual)->orderBy('vigencia_fin','desc')->get();

        if($historias){
          foreach($historias as $hist){
            $ubicacion = $hist->url;
            $hist->delete();
            unlink($ubicacion);
          }
        }
    }

    //
}
