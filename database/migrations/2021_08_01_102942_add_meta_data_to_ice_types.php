<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMetaDataToIceTypes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ice_types', function (Blueprint $table) {
            $table->string('seo_title')->nullable()->after('slug');
            $table->text('meta_description')->nullable()->after('seo_title');
            $table->text('meta_keywords')->nullable()->after('meta_description');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ice_types', function (Blueprint $table) {
            $table->dropColumn(['seo_title','meta_description','meta_keywords']);
        });
    }
}
