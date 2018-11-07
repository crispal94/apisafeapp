<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateImagen extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('imagen', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('id_referenciales');
            $table->foreign('id_referenciales')->references('id')->on('referenciales');
            $table->string('descripcion', 150);
            $table->string('url', 150);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('imagen');
    }
}
