<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInteraccionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('interaccion', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('id_post');
             $table->foreign('id_post')->references('id')->on('post');
             $table->unsignedInteger('id_referenciales');
            $table->foreign('id_referenciales')->references('id')->on('referenciales');
            $table->string('descripcion',150);
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
        Schema::dropIfExists('interaccion');
    }
}
