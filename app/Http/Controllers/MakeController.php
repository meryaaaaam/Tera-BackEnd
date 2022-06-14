<?php

namespace App\Http\Controllers;

use App\Models\Make;
use App\Models\Model;
use Illuminate\Http\Request;

class MakeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Make::all() ;    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


       $make =  Make::create($request->all());

      //  $model = $respose->make()->save() ;
        return response()->json($make , 200 );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $respose = Make::find($id) ;
       // $model[] = Model::where("make_id" , $respose->id)->get() ;

        $res = ["make" => $respose->name , "model" =>  Model::where("make_id" , $respose->id)->get()] ;
        //dd($model) ;

        return response()->json($res , 200 );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }



    public function storeMany(Request $request)
    {
        $makes = $request->makes ;
        //dd($makes) ;
        foreach ($makes as $m )
      {  Make::create(["name" => $m]); }

      //  $model = $respose->make()->save() ;
        return response()->json(["message" => "makes created successfully "], 200 );
    }
}
