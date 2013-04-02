/**
 * Created with JetBrains RubyMine.
 * User: osamaalghanmi
 * Date: 3/24/13
 * Time: 9:23 PM
 * To change this template use File | Settings | File Templates.
 */





$(document).ready(function(){


    //this array carries all the containers so we can attach to them later .....
    var arr = [];


    //take the first container of the array and attach to the stage
    var canvas = $('#avatarCanvas');

    var stage = new createjs.Container(canvas);


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
        if(pr == undefined){
            //this means it's the head of the document
            //we can then update the stage if anything happens
            pr = stage;
            pr.name = dom.attr('data-part-name');
            pr.id = dom.attr('id');
        }


        if(dom.children().length > 0){

            dom.children().each(function(index){


                //create a container from
                var cont = new createjs.Container() ;
                cont.id = $(this).attr('id');
                cont.name = $(this).attr('data-part-name');


                pr.addChild(cont);


                arr.push(cont) ;


                createContainers($(this));


            });
        }


    }




//this function is called when a user adds a part
//this will store the reference to the avatar in the variance array (array of strings)
//which then will be sent to the server
    function addVariance(){



    }

//the parts added will have a (delete) sign, when a user clicks them this method is called
    function deleteVariance(){


    }


//start over will delete all the variances
    function deleteAllVariances(){


    }


//this will randomly choose variances from each container, then call addVariance
    function randomize(){


    }











    createContainers($('#hiddenAvatar'));





    console.log(arr);

});