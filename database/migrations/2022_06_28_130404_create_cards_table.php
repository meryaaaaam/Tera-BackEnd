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
        Schema::create('cards', function (Blueprint $table) {
            $table->id();
            $table->string('Driving_licence_side1');
            $table->string('Driving_licence_side2');
            $table->string('holder_name')->nullable();
            $table->string('card_number')->nullable();
            $table->date('card_date')->nullable();
            $table->string('cvv')->nullable();
            $table->boolean('save')->nullable();

            $table->foreignId('user_id')->nullable();

            $table->foreign('user_id')
            ->on('users')
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
        Schema::dropIfExists('cards');
    }
};
