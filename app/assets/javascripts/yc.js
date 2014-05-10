
var yc ={};

$(document).on('ready page:load', function(){
    /*
     $( "#timeline" ).on("click",".post",function() {
     alert( "hello" );
     });
     */
    if( $('body').data("js") === 'js-users')
    {
        yc.users.init();
    }

    if( $('body').data("js") === 'js-accounts'){
        yc.accounts.init();
    }
});