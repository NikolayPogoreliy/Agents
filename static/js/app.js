$(document).ready(
    function () {
        $('.user-list').click(get_user);
        function get_user() {
            $.ajax(
                {
                    type: 'GET',
                    url:'/user/',
                    data:{'user_id':$(this).attr('value')},
                    dataType:'json',
                    cache: false,
                    success: function (data) {
                        var info = data.userInfo;
                        // $('#detail').html(data + info);
                        var photo = data.userPhoto;
                        var firstName = data.userFirstname;
                        var lastName = data.userLastname;

                        $('#user-photo').attr({alt:firstName+' '+lastName, src:photo,});
                        $('#first-name').html(firstName);
                        $('#last-name').html(lastName);

                        $('#last-login').html(data.userLastlogin);
                        $('#id').html(data.userID);
                        $('#email').html(data.userEmail);
                        $('#address').html(data.userAddress);
                        if (data.userInfo == 'me'){
                            $('#edit-button').html('<button id="edit" class="button expanded" href="javascript:">Редактировать</button>')
                        } else {
                            $('#edit-button').html('')
                        }
                        $('#status').html(data.userStatus);
                        

                    },
                });
        };
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
                            console.log('login');
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
    }
)
