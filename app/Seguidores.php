<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Seguidores extends Model {


    protected $table = 'Seguidores';

    protected $fillable = [];

    protected $dates = [];

    public static $rules = [
        // Validation rules
    ];


    public function historias()
    {
      return $this->hasMany('App\Historias','id_user', 'id_user_seguidor');
      //
      //  return $this->belongsToMany('App\Role', 'role_user', 'user_id', 'role_id');
      //
    //   return $this->belongsTo('App\Historias', 'id_user', 'id_user_seguidor');
    }

    // Relationships

}
