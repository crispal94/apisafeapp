<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('post', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('id_user');
            $table->foreign('id_user')->references('id')->on('users');
            $table->unsignedInteger('id_referenciales');
            $table->foreign('id_referenciales')->references('id')->on('referenciales');
            $table->unsignedInteger('id_imagen');
            $table->foreign('id_imagen')->references('id')->on('imagen');
            $table->unsignedInteger('id_estadoanimo');
            $table->foreign('id_estadoanimo')->references('id')->on('estadoanimo');
            $table->string('descripcion',150);
            $table->char('est_comentario', 1);
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
        Schema::dropIfExists('post');
    }
}

