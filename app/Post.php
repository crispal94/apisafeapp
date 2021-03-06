<?php namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model {

    use SoftDeletes;

	 protected $table = 'post';

    protected $fillable = [];

    protected $dates = [];

    public static $rules = [
        // Validation rules
    ];

    // Relationships

    public function imagen()
    {
        return $this->hasOne('App\Imagen','id', 'id_imagen');
    }

}
