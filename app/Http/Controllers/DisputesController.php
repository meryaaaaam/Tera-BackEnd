<?php

namespace App\Http\Controllers;

 use App\Models\Disputes;
use Exception;
use Illuminate\Http\Request;

class DisputesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $disputes =  Disputes::all();
           // foreach()
          //  dd($disputes) ;
            return response()->json(['disputes' => $disputes]);
        } catch (Exception $e) {
            return $e;
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


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

    public function openDispute(Request $request)
    {
        try {

            $request->validate([
                'user_id' => 'required',
                'host_name' => 'required',
                'client_name' => 'required',
                'description' => 'nullable',
            ]);

            $data = $request->all();

            $dispute = new Disputes();
            $dispute->host_name = $data['host_name'];
            $dispute->client_name = $data['client_name'];
            $dispute->user_id = $data['user_id'];
            $dispute->description = $data['description'];
            $dispute->date = now();
            $dispute->save();


            return response()->json(['message' => "Dispute entered succesfully"]);

        } catch (Exception $e) {
            return $e;
        }

    }
}
