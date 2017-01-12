$(document).ready(
    function () {

        $(document).foundation();

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
        
        $('#edit-personaldata').click(function(){
            //event.preventDefault();
            //var data = $(this).serialize();
            $.get('/personal-edit/', function (data){
                console.log(data);
                $('#personal-info').html(data);
            });

        });
        
        function get_user() {
            $.ajax(
                {
                    type: 'GET',
                    url:'/user/',
                    data:{'user_id':$(this).attr('value')},
                    dataType:'json',
                    cache: false,
                    success: function (data) {
                        // for (key in data) {
                        //     console.log(key);
                        //     console.log(data[key]);
                        // }
                        var photo = data['userPhoto'];
                        var firstName = data.userFirstname;
                        var lastName = data.userLastname;

                        $('#user-photo').attr({alt:firstName+' '+lastName, src:photo,});
                        $('.first-name').html(firstName);
                        $('.last-name').html(lastName);

                        $('#last-login').html(data.userLastlogin);
                        $('#id').html(data.userID);
                        $('#email').html(data.userEmail);
                        $('#address').html(data.userAddress);
                        if (data.userInfo == 'me'){
                            $('#edit-button').html('<button id="edit" class="button expanded" href="javascript:">Edit profile</button>');
                            $('#regdata').html('<a href="javascript:" title="Edit" id="edit-regdata"><i class="fi-pencil"></i></a>');
                            $('#personaldata').html('<a href="javascript:" title="Edit" id="edit-personaldata"><i class="fi-pencil"></i></a>');
                        } else {
                            $('#edit-button').empty();
                            $('#regdata').empty();
                            $('#personaldata').empty();
                        }
                        $('#status').html(data.userStatus);
                    }
                });
        }
    }
);
