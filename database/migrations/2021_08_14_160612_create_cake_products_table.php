<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCakeProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cake_products', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('order_id');
            $table->integer('stage')->default(1);
            $table->string('shape')->default('circle');
            $table->boolean('biscuit')->default(false);
            $table->string('tastes');
            $table->integer('count');
            $table->integer('price');
            $table->text('product_data')->nullable();
            $table->mediumText('comments')->nullable();
            $table->boolean('confirmed');
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
        Schema::dropIfExists('cake_products');
    }
}
