<?php

namespace App\Http\Controllers;

use App\Models\Address;
use App\Models\Gallery;
use App\Models\Make;
use App\Models\Model;
use App\Models\option;
use App\Models\User;
use App\Models\Vehicule;
use App\Models\vehicule_Options;
use Illuminate\Http\Request;

class VehiculeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

       $vehicules = Vehicule::All() ;

       foreach ($vehicules as $v)
       {
        $gallerie = Gallery::where('vehicule_id' , $v->id)->get() ;
        foreach ($gallerie as $g )
        {
            $images[] = "http://localhost:8000/storage/image/vehicule/".$g->name ;
        }
        $model = Model::find( $v->model_id) ;
        $make = Make::find($model->make_id) ;
        $user = User::find($v->user_id) ;
        if($gallerie)
      {  $res[] = ["id" =>  $v->id ,
        "km" =>  $v->km ,
        "matricule" =>  $v->matricule ,
        "Price_D" =>  $v->Price_D ,
        "Price_H" =>  $v->Price_H ,

        'location'=>  $v->location ,
        'model'=>  $make->name." ".$model->name ." ".$model->type." ".$model->year ,
        'user'=>  $user->firstname." ".$user->lastname ,
        'authorImg'=> "http://localhost:8000/storage/image/". $user->photo,
        'image' => "http://localhost:8000/storage/image/vehicule/".$v->photo,
        "nb" =>  $v->nb_reservation ,
        "images" =>  $images ,

    ];}
        else
        {$res[] = ["id" =>  $v->id ,
            "km" =>  $v->km ,
            "matricule" =>  $v->matricule ,
            "Price_D" =>  $v->Price_D ,
            "Price_H" =>  $v->Price_D ,

            'location'=>  $v->location ,
            'model'=>  $make->name." ".$model->name ." ".$model->type." ".$model->year ,
            'user'=>  $user->firstname." ".$user->lastname ,

             ];}



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


       // $filename =time(). $gal->getClientOriginalName();
    //    $gal->storeAs('public/image/vehicule', $filename);
            $model =  Model::find($request->model_id) ;
            $make =  Make::find($model->make_id) ;

      /*  if ($request->hasFile('img'))
        {

             $filenameWithExt = $request->file('img')->getClientOriginalName();

              $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
              $extension = $request->file('img')->getClientOriginalExtension();
              $fileNameToStore= $make->name.'_'.$model->name.'_'.$model->year.'_'.$model->type.'_0'.'.'.$extension;
              $path = $request->file('img')->storeAs('public/image/vehicule', $fileNameToStore);
          //    $v->photo= $fileNameToStore;

        }*/

        $v =  [
            'km' => $request->km,
            'matricule' => $request->matricule,
            'portes' => $request->portes,
            'carburant' => $request->carburant,
            'transmission' => $request->transmission,
            'siege' => $request->siege,
            'Price_H' => $request->Price_H,
            'Price_D' => $request->Price_D,
            'location' => $request->location,
            'model_id' => $request->model_id,
            'user_id' => $request->user_id,
            'description' => $request->description,
            'photo' => $request->photo,
            'options' => $request->options,
            'bail' => $request->bail,

        ];
         $v = Vehicule::create($v);
        if($request->options)
        {foreach($request->options as $op)
        {
            vehicule_Options::create([ "vehicule_id" => $v->id , "option_id" => $op ]);
           // dump($op) ;
        }}


       if($request->galleries)
        {foreach($request->galleries as $gal)
        {
            $gallerie[] = $gal ;
           Gallery::create([
               "vehicule_id" => $v->id , "path" => $gal['path'] , "size"=> $gal["size"] , "name"=> $gal["name"]
           ]);


          //  dump($op) ;


        }}






        //$response = Modul::create($request->all());


           // 'make_id' => Make::find($request->model->make),





        $response =  [
           'id' => $v->id,
            'km' => $request->km,
            'matricule' => $request->matricule,
            'Price_H' => $request->Price_H,
            'Price_D' => $request->Price_D,
            'location' => $request->location,
            'photo' => $request->photo,
            'model' => $model->name,
            'type' => $model->type,
            'year' => $model->year,
            'gallerie' => $gallerie ,
            'portes' => $request->portes,
            'carburant' => $request->carburant,
            'transmission' => $request->transmission,
            'siege' => $request->siege,
            'make' => $make->name,
            'bail' => $request->bail,

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
        if (Vehicule::find($id))
        {   //$images = [] ;
            $vehicule = Vehicule::find($id);
            $gallerie = Gallery::where('vehicule_id' , $vehicule->id)->first() ;
            $model = Model::find( $vehicule->model_id) ;
            $make = Make::find($model->make_id) ;
            $galleries = Gallery::where('vehicule_id' , $vehicule->id)->get() ;
            foreach($galleries as $gal)
            {
                $images[] = ["path" => "http://localhost:8000/storage/image/vehicule/".$gal["path"]] ;
            }
            $user = User::find( $vehicule->user_id ) ;

            $address = Address::find($user->address_id) ;
                if($address)
                {$adr = $address->address." , ".$address->city." , ".$address->state." , ".$address->code ;}
                else
                {$adr='' ;}

            $voptions = vehicule_Options::where('vehicule_id' , $vehicule->id)->get() ;
            foreach($voptions as $op)
            {
                $options[] = [
                    "label" => Option::find($op->option_id)->label ,
                    "icon" => Option::find($op->option_id)->icon ,


                ] ;
            }
            // dd($options) ;
            $res = ["id" =>  $vehicule->id ,
                    "km" =>  $vehicule->km ,
                    "matricule" =>  $vehicule->matricule ,
                    "Price_D" =>  $vehicule->Price_D ,
                    "Price_H" =>  $vehicule->Price_H ,
                    "portes" =>  $vehicule->portes ,
                    "carburant" =>  $vehicule->carburant ,
                    "transmission" =>  $vehicule->transmission ,
                    "siege" =>  $vehicule->siege ,

                    'location'=>  $vehicule->location ,
                    'model'=>  $make->name." ".$model->name ." ".$model->type." ".$model->year ,
                    'user'=> $user->firstname." ".$user->lastname,
                    'user_photo' => "http://localhost:8000/storage/image/".$user->photo,
                    'address'=> $adr,
                    'telephone'=> $user->phone,
                    'nb'=> $vehicule->nb_reservation,
                    'description'=> $vehicule->description,
                    'photo'=> "http://localhost:8000/storage/image/vehicule/".$vehicule->photo,


                    "gallerie" =>  $gallerie["path"] ,
                    "galleries" =>  $images ,
                    "options" => $options ,


        ];
            return response()->json($res) ;
        }
        elseif(Vehicule::where('matricule',$id))
        {
            return response()->json(Vehicule::where('matricule',$id)->get());
        }
        else
        { return response()->json(['message' => 'Vehicule not found  ']);}
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
        $response = Vehicule::find($id) ;
        $model = Model::find($response->model_id) ;
        $response->update($request->all() );


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


    public function CarByUser($id)
    {

      $vehicule = Vehicule::where('user_id',$id)->get() ;
        foreach ($vehicule as $v)
        {
            $images = array();
            $model = Model::find($v->model_id) ;
            $make = Make::find($model->make_id) ;
            $user = User::find($v->user_id) ;
            $gallerie = Gallery::where('vehicule_id' , $v->id)->get();
            $images[] = ["name" => $v->photo] ;
            foreach($gallerie as $g )
            {
                $images[] = ["name"=> $g->name] ;
            }
                if($gallerie){
                     $res[] = [   'id' => $v->id,
                    'km' => $v->km,
                    'matricule' => $v->matricule,
                    'Price_H' => $v->Price_H,
                    'Price_D' => $v->Price_D,
                    'location' => $v->location,
                    'model' => $model->name,
                    'type' => $model->type,
                    'year' => $model->year,
                    'user' =>$user->firstname.' '.$user->lastname ,
                    'authorImg' =>$user->photo ,

                    'make' => $make->name ,
                   'image' => "http://localhost:8000/storage/image/vehicule/".$v->photo,

                   'images' => $images,

                    ] ;}

                else
                {  $res[] = [   'id' => $v->id,
                    'km' => $v->km,
                    'matricule' => $v->matricule,
                    'Price_H' => $v->Price_H,
                    'Price_D' => $v->Price_D,
                    'location' => $v->location,
                    'model' => $model->name,
                    'type' => $model->type,
                    'year' => $model->year,
                    'user' =>$user->firstname.' '.$user->latsname ,

                    'make' => $make->name ,


                    ] ;}
          // dd() ;


        }


    //  $model = Model::find($vehicule->model_id) ;
    //  $make = Make::find($model->make_id) ;

    return response()->json($res);


    }


    public function uploadGallery(Request $request )
    {

        $model =  Model::find($request->model_id) ;
        $make =  Make::find($model->make_id) ;
         $v =  [
        'km' => $request->km,
        'matricule' => $request->matricule,
        'Price_H' => $request->Price_H,
        'Price_D' => $request->Price_D,
        'location' => $request->location,
        'model_id' => $request->model_id,
        'user_id' => $request->user_id, ];



    if($request->options)
    {  $v = Vehicule::create($v);

        foreach($request->gallery as $gal)
        {
            $g = Gallery::create(["path"=>$gal ,   "vehicule_id"=>$v->id]) ;
        }

        foreach($request->options as $op)
    {   if(option::where("label" , $op)->first() )
        {$option = option::where("label" , $op)->first() ;
       vehicule_Options::create([
           "vehicule_id" => $v->id , "option_id" => $option->id
       ]);
         }
        else
        {
            $option = option::create(  ["label" => $op]) ;
             vehicule_Options::create([
           "vehicule_id" => $v->id , "option_id" => $option->id
       ]);
        }


    }

    $response =  [
        'id' => $v->id,
        'km' => $request->km,
        'matricule' => $request->matricule,
        'Price_H' => $request->Price_H,
        'Price_D' => $request->Price_D,
        'location' => $request->location,
        'model' => $model->name,
        'type' => $model->type,
        'year' => $model->year,

        'make' => $make->name,
        'option' =>$option->label,
        'galleries' => $request->gallery


    ];




}
    else {
        $v = Vehicule::create($v);

        foreach($request->gallery as $gal)
        {
            $g = Gallery::create(["path"=>$gal ,   "vehicule_id"=>$v->id]) ;
        }

        $response =  [
            'id' => $v->id,
            'km' => $request->km,
            'matricule' => $request->matricule,
            'Price_H' => $request->Price_H,
            'Price_D' => $request->Price_D,
            'location' => $request->location,
            'model' => $model->name,
            'type' => $model->type,
            'year' => $model->year,

            'make' => $make->name,
            'galleries' => $request->gallery

        ];


    }

    //$response = Modul::create($request->all());


       // 'make_id' => Make::find($request->model->make),







  //  $model = $respose->make()->save() ;
    return response()->json($response , 200 );
}

public function gallerieTest(Request $request)
{

   /* foreach($request->name as $gal)
    {
        $g = Gallery::create(["path"=>$gal   ]) ;
    }

    if ($g)
    {
        return response()->json("Done");
    }
    else
    {
        return response()->json("Nope");

    }*/
    return response()->json(["req"=>$request]);

}



public function uploadphoto(Request $request, $id )
{

    $user = User::findOrFail($id) ;
    $user->update($request->all());
     if ($request->hasFile('img'))
      {

        $filenameWithExt = $request->file('img')->getClientOriginalName();

            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('img')->getClientOriginalExtension();
            $fileNameToStore= $filename.'_'.time().'.'.$extension;
            $path = $request->file('img')->storeAs('public/image', $fileNameToStore);
            $user->photo= $fileNameToStore;

     if($user->save() && $user->refresh()){
        return response()->json(["message" => "image added successfully."]);
     } else{
        return response()->json(["message" => "something went wrong"]);
     }

}
}
public function storeImage(Request $request)
{
    if ($request->hasFile('img'))
      {

        $filenameWithExt = $request->file('img')->getClientOriginalName();

            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('img')->getClientOriginalExtension();
            $fileNameToStore= $filename.'.'.$extension;
            $path = $request->file('img')->storeAs('public/image/vehicule', $fileNameToStore);

      }
}

    public function storeImages(Request $request)
    {
        $files = $request->file('gal');
        dd($files);

       // return response()->json(["message" => $files]);
       //  die() ;
        $allowedfileExtension=['pdf','jpg','png'];
        $i=0 ;
        foreach($files as $file)
        {
           // dump($file) ;
            $extension = $file->getClientOriginalExtension();
            $check = in_array($extension,$allowedfileExtension);

            $filenameWithExt = $file->getClientOriginalName();
            foreach($request->gal as $mediaFiles) {

               $i++;
               $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
               $fileNameToStore= $filename.'.'.$extension;
                // $name = $make->name.'_'.$model->name.'_'.$model->year.'_'.$model->type.'_'.$i.'.'.$extension;
                //$path = 'http://127.0.0.1:8000/image/vehicule'.$filename ;
                $mediaFiles->storeAs('public/image/vehicule' , $fileNameToStore);
                //store image file into directory and db
                $size = $mediaFiles->getSize();


            }
        }
    }




    public function searchcar(Request $request)
    {
        $start = $request->start ;
        $end = $request->end ;
        $location = $request->location ;




    }

}
