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
        Schema::create('vehicules', function (Blueprint $table) {
            $table->id();
            $table->float('km') ;
            $table->float('Price_H') ;
            $table->float('Price_D') ;
            $table->String('location') ;
            $table->integer('portes') ;
            $table->String('carburant') ;
            $table->integer('siege') ;
            $table->text('description')->nullable() ;
            $table->String('transmission') ;
            $table->String('photo') ;
            $table->text('extras')->nullable() ;
             $table->text('description_line')->nullable() ;
             $table->String('matricule')->unique() ;
            $table->integer('nb_reservation')->default(0)  ;


         /*   $table->foreignId('options_id');
            $table->foreign('options_id')
            ->on('options')
            ->references('id')
            ->onDelete('cascade');


            $table->foreignId('reservation_id');

            $table->foreign('reservation_id')
            ->on('reservation')
            ->references('id')
            ->onDelete('cascade');*/

            $table->foreignId('user_id');

            $table->foreign('user_id')
            ->on('users')
            ->references('id')
            ->onDelete('cascade');




            $table->timestamps();


            $table->foreignId('model_id');

            $table->foreign('model_id')
            ->on('models')
            ->references('id')
            ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehicules');
    }
};
