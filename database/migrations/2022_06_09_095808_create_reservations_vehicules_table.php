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
        Schema::create('reservations_vehicules', function (Blueprint $table) {
            $table->id();

            $table->foreignId('reservation_id')->nullable();

            $table->foreign('reservation_id')
            ->on('reservations')
            ->references('id')
            ->onDelete('cascade');


            $table->foreignId('vehicule_id')->nullable();

            $table->foreign('vehicule_id')
            ->on('vehicules')
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
        Schema::dropIfExists('reservation_vehicules');
    }
};
