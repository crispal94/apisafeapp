<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Historias;
use App\User;
use DB;

class cronHistorias extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'update:image';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Elimina las imagenes de las historias que la vigencia ha vencido';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
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
}
