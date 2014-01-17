$(document).ready(function(){
    var path = $(location).attr('href')
    console.log(path);
    $('h3 a').each(function() {
        if( path === "http://thefanschallenge.herokuapp.com/posts?new_post=true" ){
            $("#most_recent").addClass('active');
        } else if(path === "http://thefanschallenge.herokuapp.com/posts" ) {
            $('#most_popular').addClass('active');
        }
    });
    // $('h3 a').on('click', function() {
    //   alert('hey');
    // });
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
});

