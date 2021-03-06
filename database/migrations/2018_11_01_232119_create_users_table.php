<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('id_imagen');
            $table->foreign('id_imagen')->references('id')->on('imagen');
             $table->string('nombres', 150);
              $table->string('apellidos', 150);
             $table->string('password');
             $table->string('api_token');
             $table->string('nickname', 150);
             $table->string('email',150)->unique();
             $table->integer('telefono');
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
