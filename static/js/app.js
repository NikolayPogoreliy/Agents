$(document).ready(
    function () {
        // $(document).foundation();

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
        $('#personal-info').on('click', '#edit-personaldata', function(){

            $.get('/personal-edit/', function (data){
                $('#personal-info').html(data);
            });

        });
        $('.info').on('submit', '#edit-regdata-form', function(event){
            event.preventDefault();
            var data = $('form').serialize();
            $.ajax({
                type: 'POST',
                url:'/auth/edit/',
                data: data,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#registration-info').html(data.template);
                    $('.first-name').html(data.info.userFirstname);
                    $('.last-name').html(data.info.userLastname);
                    $('#username').html(data.info.username)
                }
            });
            // $.get('/personal-edit/', function (data){
            //     $('#personal-info').html(data);
            // });

        });
        $('#registration-info').on('click', '#edit-regdata', function(){
            $.get('/auth/edit/', function (data){
                $('#registration-info').html(data);
            });

        });
        $('#detail').on('click','.cancel', function () {
            console.log('cancel clicked');
           $.ajax({
               type: 'GET',
               url:'/formcancel/',
               data:{'container':$(this).attr('value')},
               dataType:'json',
               cache: false,
               success: function (data) {
                   console.log(data);
                   $(data.container).html(data.template);
               }
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
