/**
 * Created with JetBrains RubyMine.
 * User: osamaalghanmi
 * Date: 3/24/13
 * Time: 9:23 PM
 * To change this template use File | Settings | File Templates.
 */


//load all bitmaps , add them to an array of bitmaps then call init

//this array carries all the containers so we can attach to them later .....
     var arr = [];

     var update = false;

     var canvas ;

     var imageArray = [];

     var stage ;


     function init(){


         //all the images in under the library (includes all of them)
         //the purpose is to load them before using Easel js to prevent bugs

         $('#items img').each(function(index){


             console.log();


             //create the image

             var image = new Image();
             image.src =  $(this).attr("src") ;
             imageArray.push(image);


         }) ;


      var img =  imageArray[imageArray.length - 1];
         img.onload = afterImageLoad;

   }
function afterImageLoad(){


    console.log(imageArray);

    //take the first container of the array and attach to the stage
    canvas = document.getElementById("avatarCanvas");


    //console.log(canvas);
     stage = new createjs.Stage(canvas);


    createContainers($('#hiddenAvatar').children());



    stage.x = stage.canvas.width/2;
    stage.y = stage.canvas.height/2;

    createjs.Ticker.addEventListener("tick", tick);


    // console.log(arr);

    // console.log(stage);

}



    function createContainers(dom){


        //create a new container if it didn't exist in the array
        var current_cont;
        var pr;
        for(var i=0; i<arr.length; i++){

            current_cont = arr[i];

            if(dom.attr("data-part-name") == current_cont.name){


                pr =   current_cont;


            }

        }
      if(arr.length == 0){
            //this means it's the head of the document
            //we can then update the stage if anything happen
            pr = stage;
            pr.name = dom.attr('data-part-name');
            pr.id = dom.attr('id');
        }

        if(pr!= undefined) {

        if(dom.children().length > 0){

            dom.children().each(function(index){


                //create a container from
                var cont = new createjs.Container() ;
                cont.id = $(this).attr('id');
                cont.name = $(this).attr('data-part-name');






                //get the variance(s) with this id, then attach it
                varianceArray  =   findVariances(cont.id);



                if(varianceArray != undefined){

               //loop through the variance array adding all the bitmaps to the container
              for(var i=0 ; i < varianceArray.length ; i++ ) {

                //get the image of that has this res
                  var image = findImage(varianceArray[i].res) ;
                  console.log(image);
                  var bitmap = new createjs.Bitmap(image);




              //  bitmap.id = varianceArray[i].id ;

                //attach it to the container so that it shows

                cont.addChild(bitmap);



              }
            }




                pr.addChild(cont);

                //position the containers according to the stage parent bitmap and its own bitmap
                setPosition($(this).attr('data-part-position'),pr,cont,$(this).attr('data-part-offset'));






                arr.push(cont) ;


                createContainers($(this));


            });
        }

        }


    }

    //handle the ticks
    function tick(){




         stage.update();


         createContainers($('#hiddenAvatar').children());




    }

    function stop(){

        //remove the tick listener when needed

    }


    function findImage(imageRes){


       for (var key in imageArray){




           if(imageArray[key].src.match(imageRes)){

                  return imageArray[key];


           }


       }












    }



     //takes the container_id (part_id) , finds the variance and returns it
    function findVariances(part_id){

        var varianceArray = [];

        for(var key in variances){

           //if the variance part id is the one chosen return the whole object
           if (variances[key].part_id == part_id){

               //create the image
               //send an array that contains variances
               varianceArray.push(variances[key]);


           }

        }

        return varianceArray;

    }


    function setPosition ( stringPos , parent , child , offset){


        //every element is positioned according to the first bitmap image (the part defining image)
        //so a head container has a head image added in the first index
        //this is the first element which could be a bitmap

        //get the the first bitmap of this parent and apply it to the container

        parent_bitmap = parent.getChildAt(0);

        child_bitmap = child.getChildAt(0);


       /** console.log(parent_bitmap);
        console.log(child_bitmap);
        console.log("----------------") ;
          **/


        if(parent_bitmap.name!="body") {

           // console.log(parent_bitmap.image.width) ;

        //do a swtich statment
        switch (stringPos){

            case "top" :
            //  console.log(parent_bitmap.image.width);


              //you change the registeration point to position from the center
              child.regX =  child_bitmap.image.width/2;
              child.regY =  child_bitmap.image.height/2;


              child.x   = parent_bitmap.image.width/2;
              child.y   = - child_bitmap.image.height/2;
                break;

            case "bottom" :

                child.x =  parent.height ;
                 break;

            case "left" :
                  break;


            case "right" :

                 break;
            case "top-left":
                child.x = parent.x;
                child.y = parent.y;

               break;

            case "top-right":
                child.x = stage.canvas.width;
                child.y = parent.y;
                break;

            case "bottom-left" :

                break;
            case "bottom-right":
               break;








        }

        }


    }

     //takes a size (number) and a parent object and resolve it to width and height
    function resolveDim (size , easelParentObject)  {




    }










//this function is called when a user adds a part
//this will store the reference to the avatar in the variance array (array of strings)
//which then will be sent to the server
    function addVariance(){





    }

//the parts added will have a (delete) sign, when a user clicks them this method is called
//add an overlay over all element (add it last)  that contains an image of a red X icon , once a user clicks it (hit area)
//trigger an event and the image ID (bitmap) delete it, then update the stage
// also it will remove it from the array of variances
    function deleteVariance(){



    }


//start over will delete all the variances
    function deleteAllVariances(){


    }


//this will randomly choose variances from each container, then call addVariance
    function randomize(){


    }



