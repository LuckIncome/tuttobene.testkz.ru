<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIcePortionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ice_portions', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('icecream_id')->unsigned()->index();
            $table->foreign('icecream_id')->references('id')->on('icecreams')->onDelete('cascade');
            $table->string('title');
            $table->string('icon');
            $table->string('excerpt')->nullable();
            $table->integer('price');
            $table->integer('sort_id')->default(0);
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ice_portions');
    }
}
