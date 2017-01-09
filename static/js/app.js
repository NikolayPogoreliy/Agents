$(document).ready(
    function () {
        $('.user-list').click(get_user);

        $('#login').submit(function(event){
            event.preventDefault();
            var data = $(this).serialize();
            $.ajax(
                {
                    type:'POST',
                    url:'/auth/login/',
                    data: data,
                    cache: false,
                    dataType: 'html',
                    success: function (data) {
                        if (data == 'ok'){
                            location.reload();
                        } else {
                            $('#error-login').html(data);
                        }
                    }
            });
        });
        $('#register').click(function(){
            //event.preventDefault();
            //var data = $(this).serialize();
            $.get('/auth/register/', function (data){
                $('#detail').html(data);
            });

        });
        
        /*$('#get-personal').submit(function(event){
            event.preventDefault();
            var data = $(this).serialize();
            $.ajax({
                type: 'POST',
                url: '/auth/presonal/',
                cache: false,
                dataType:'html',
                complete: function (data) {
                    if (data == 'ok'){
                        $('#detail').html(data);
                    }
                }
            })
        });*/
        
        /*$('#personal').click(function(){
            event.preventDefault();
            //var data = $(this).serialize();
            $.get('/auth/personal/', function (data){
                $('#detail').html(data);
            });

        });*/
        function get_user() {
            $.ajax(
                {
                    type: 'GET',
                    url:'/user/',
                    data:{'user_id':$(this).attr('value')},
                    dataType:'json',
                    cache: false,
                    complete: function (data) {
                        $('#detail').html(data.responseText);

                    }
                });
        }
    }
);
