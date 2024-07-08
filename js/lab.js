$(document).ready(function(){

    // Todo de imagen movible
	$(".elemento-movido-1").draggable({
		containment:".subarea-1",
		snap:true
	});
    $(".elemento-movido-2").draggable({
        containment:".subarea-2",
        snap:true
    });

    //reutilizar
	$(".elemento-movido").rotatable({


        stop: function(e, ui){
             if(ui.angle.current<0){
                   var given_angle=ui.angle.current+2*Math.PI;
                }
                else{ var given_angle=ui.angle.current;  }
                var new_angle=Math.round(given_angle*180/ Math.PI)+"deg";
                $(".elemento-movido").css("transform","rotate("+new_angle+")");
        }

    });
    $(".elemento-movido").resizable({
          handles: "n, e, s, w, ne, se, sw, nw"

    });


    //Cambiar imagen

    //Habilitar front-image
     $('#check-image-front').change(function() {
        $(".elemento-movido-1").toggleClass("hide");
        $('label[for="' + $('#front-file').attr('id') + '"]').toggleClass("cursor");
        if ($(this).is(':checked')) {
            $('#front-file').removeAttr('disabled');

        } else {
            $('#front-file').attr('disabled', true);
        }
    });

    //Habilitar back-image
     $('#check-image-back').change(function() {
        $(".elemento-movido-2").toggleClass("hide");
        $('label[for="' + $('#back-file').attr('id') + '"]').toggleClass("cursor");
        if ($(this).is(':checked')) {
            $('#back-file').removeAttr('disabled');


        } else {
            $('#back-file').attr('disabled', true);
        }
    });

    $("#front-file").on("change",()=>{
        let files = $('#front-file').prop('files');
        let file = files[0];
        let reader = new FileReader();
        reader.onload = function(event) {
            $("#image-front").attr("src", event.target.result);
        };
        reader.onerror = function(event) {
            alert("I AM ERROR: " + event.target.error.code);
        };
        reader.readAsDataURL(file);
    });


    $("#back-file").on("change",()=>{
        let files = $('#back-file').prop('files');
        let file = files[0];
        let reader = new FileReader();
        reader.onload = function(event) {
            $("#image-back").attr("src", event.target.result);
        };
        reader.onerror = function(event) {
            alert("I AM ERROR: " + event.target.error.code);
        };
        reader.readAsDataURL(file);
    });

    var orientation="front";

    //Colores
    $(".color-btn").each(function(){
        $(this).css("background-color",$(this).attr("color"));

        // para todos
        $(this).click(function(){
            //$(this).attr("color-label")
            $(".reference").attr("src",orientation+"-"+$(this).attr("color-label")+".png");
            console.log(orientation);
        });
    });

    $(".toggle").click(function(){
        
        let name = $(".reference").attr("src");
        let parts=name.split('-');
        //console.log(parts[1]);
        $("#front").toggleClass("hide");
        $("#back").toggleClass("hide");

        if(orientation == "front"){
            orientation="back";
            $(".reference").attr("src",orientation+"-"+parts[1]);
            $(this).text("Go Front");
        }else{
            orientation="front";
            $(".reference").attr("src",orientation+"-"+parts[1]);
            $(this).text("Go Back");
        }
    });

        
          
});