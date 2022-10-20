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
        Schema::create('disputes', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date')->nullable();
            $table->string('description')->nullable();
            $table->string('host_id')->nullable();
            $table->string('host_name')->nullable();
            $table->string('client_id')->nullable();
            $table->string('client_name')->nullable();
            $table->foreignId('reservation_id')->nullable()->references('id')->on('reservations');
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
        Schema::dropIfExists('disputes');
    }
};
