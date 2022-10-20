<?php

namespace App\Http\Controllers;

use App\Models\Gallery;
use App\Models\Vehicule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class GallerieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request ,$id)
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
        $vehicule = Vehicule::find($id);
        $gallerie = Gallery::where('vehicule_id' , $vehicule->id)->get() ;
        return response()->json($gallerie) ;
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
        if(Gallery::find($id))
       { $gallerie =Gallery::find($id)->path;
        Storage::disk('public')->delete('image/vehicule/'.$gallerie);
        $exist = Storage::exists("public/image/vehicule/".$gallerie);
        Gallery::find($id)->delete();
        //$result = Storage::files("public/image/vehicule");

         if(!$exist)
                 {return response()->json("Image Deleted" ) ;}
        else
                 {return response()->json("Somthing wrong went" ) ;}
      }
      else
      {return response()->json("Cannot find image" ) ;}
    }


    public function storeImages(Request $request ,$id)
    {  //return response()->json("Cannot find image" ) ;

                if ($request->hasFile('img'))
                {

                    $filenameWithExt = $request->file('img')->getClientOriginalName();

                        $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
                        $extension = $request->file('img')->getClientOriginalExtension();
                        $fileNameToStore= $filename.'_'.time().'.'.$extension;
                         $request->file('img')->storeAs('public/image/vehicule', $fileNameToStore);
                        $size = $request->img->getSize();
                        $g = Gallery::create(["path"=>$fileNameToStore , "name"=>$fileNameToStore , "size"=> $size ,  "vehicule_id"=>$id]) ;

                if($g->save() && $g->refresh()){
                    return response()->json(["message" => "image added successfully."]);
                } else{
                    return response()->json(["message" => "something went wrong"]);
                }
            }
    }

}
