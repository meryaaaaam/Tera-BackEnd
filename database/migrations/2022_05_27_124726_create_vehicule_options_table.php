<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehicule_options', function (Blueprint $table) {
            $table->id();
            $table->foreignId('vehicule_id')->nullable();

            $table->foreign('vehicule_id')
            ->on('vehicules')
            ->references('id')
            ->onDelete('cascade');


            $table->foreignId('option_id')->nullable();

            $table->foreign('option_id')
            ->on('options')
            ->references('id')
            ->onDelete('cascade');

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
        Schema::dropIfExists('vehicule_options');
    }
};
