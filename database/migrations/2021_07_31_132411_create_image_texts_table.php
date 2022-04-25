<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImageTextsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('image_texts', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('page_id');
            $table->string('title')->nullable();
            $table->string('image')->nullable();
            $table->string('icon')->nullable();
            $table->longText('body')->nullable();
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
        Schema::dropIfExists('image_texts');
    }
}
