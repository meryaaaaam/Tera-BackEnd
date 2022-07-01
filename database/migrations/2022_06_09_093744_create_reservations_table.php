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
        Schema::create('reservations', function (Blueprint $table) {
            $table->id();
            $table->float('amount');
            $table->datetime('start');
            $table->datetime('end');

         /*   $table->string('startday');
            $table->string('starthour');
            $table->string('endday');
            $table->string('endday');*/


            $table->string('period')->nullable();
            $table->integer('days')->nullable();
            $table->integer('hours')->nullable();
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
        Schema::dropIfExists('reservations');
    }
};
