// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

yc.accounts = {
    init: function(){
        $(".flash-msg-remove").on("click", function(){
            $(this).parent().hide();
        });

        $("#change_avatar").on("click", function(){
           $("#input_avatar").click();
        });

        $("#input_avatar").change(function(evt){
            var file = evt.target.files[0];
            var reader = new FileReader();

            // Closure to capture the file information.
            reader.onload = (function(imageFile) {
                return function(e) {
                    $("#img_avatar").attr("src", e.target.result);
                };
            })(file);

            // Read in the image file as a data URL.
            reader.readAsDataURL(file);
        })
    }
}