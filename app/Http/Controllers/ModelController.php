<?php

namespace App\Http\Controllers;

use App\Models\Make;
use Illuminate\Http\Request;
use App\Models\Model as Modul ;
use App\Models\Model;

class ModelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Modul::all() ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $model =  [
            'name' => $request->name,
            'type' => $request->type,
            'year' => $request->year,
            'image' => $request->image,
            'make_id' => $request->make,
            'created_at' => $request->created_at,
            'updated_at' => $request->updated_at,
        ];

        //$response = Modul::create($request->all());

        Modul::create($model);

        $response = [
            'name' => $request->name,
            'type' => $request->type,
            'year' => $request->year,
            'image' => $request->image,
            'make' => Make::find($request->make),
            'created_at' => $request->created_at,
            'updated_at' => $request->updated_at,

        ];

      //  $model = $respose->make()->save() ;
        return response()->json($response , 200 );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       $respose = Modul::find($id) ;
       return response()->json($respose , 200 );
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
        $response = Modul::find($id) ;

   $response->update([$request
   ]);

   // On retourne la réponse JSON
      return response()->json($response , 200);
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
        $models = $request->models ;
        //dd($makes) ;
        foreach ($models as $m )
      {
          $make = Make::where('name', $m['make'])->first() ;
         // dd( $make->id) ;

          Model::create(["name" => $m['model'] , "type" => $m['type'] , "year" => $m['year'] , "make_id" => $make->id ]);
        }

      //  $model = $respose->make()->save() ;
        return response()->json(["message" => "Models created successfully "], 200 );
    }


}
