$(document).ready(function(){
    var path = $(location).attr('href')
    console.log(path);
    $('h2 a').each(function() {
        if( path === "http://localhost:3000/posts?new_post=true" ){
            $("#most_recent").addClass('active');
        } else {
            $('#most_popular').addClass('active');
        }
    });
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
});

