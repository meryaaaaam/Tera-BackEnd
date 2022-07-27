<?php

namespace App\Http\Controllers;

use App\Models\card;
use Illuminate\Http\Request;

class CardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cards=card::All();
        foreach ($cards as $c)
        {
            $user = User::find($c->user_id) ;

            $res[] = [
                'user'=>  $user->firstname." ".$user->lastname ,
                'Driving_licence_side1'=> "http://localhost:8000/storage/image/permis/". $c->Driving_licence_side1,
            'Driving_licence_side2' => "http://localhost:8000/storage/image/permis/".$c->Driving_licence_side2,  
            'image'=>  "http://localhost:8000/storage/image/". $c->photo ,
            'phone'=>  $user->phone ,
            'email'=>  $user->email ,
            
        ];
        }
        return response()->json($res);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $card =  [
            'Driving_licence_side1' => $request->Driving_licence_side1,
            'Driving_licence_side2' => $request->Driving_licence_side2,
            'user_id' => $request->user_id,
        ];
        $card =  card::create($card);

        //  $model = $respose->make()->save() ;
          return response()->json($card , 200 );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        $card = card::find($id) ;

        $card->update( [
            'Driving_licence_side1' => $request->Driving_licence_side1,
            'Driving_licence_side2' => $request->Driving_licence_side2,
            'user_id' => $request->user_id,
        ]);
        return response()->json(["card" => $card]);
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
    public function storeImage(Request $request)
{
    if ($request->hasFile('img'))
      {

        $filenameWithExt = $request->file('img')->getClientOriginalName();

            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('img')->getClientOriginalExtension();
            $fileNameToStore= $filename.'.'.$extension;
            $path = $request->file('img')->storeAs('public/image/permis', $fileNameToStore);

      }
}
}
