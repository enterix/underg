function users_new_intialize() {
    jQuery.validator.addMethod("lettersNumbersOnly", function(value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]+$/i.test(value);
        });

    jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
        return this.optional(element) || value != $(param).val();
    });

    $(document).ready(function(){
        $("#registration_form").validate({
            rules: {
                "user[nickname]": {
                    required: true,
                    rangelength: [5, 20],
                    lettersNumbersOnly: true,
                    remote: {
                        url: '/users/check_nick',
                        type: 'GET',
                        data: {
                            nickname: function() {
                                return $("#user_nickname").val()
                            }
                        }
                    }
                },
                "user[password]": {
                    required: true,
                    rangelength: [6, 30],
                    notEqualTo: "#user_nickname"
                },
                "user[password_confirmation]": {
                    required: true,
                    equalTo: "#user_password"
                },
                "user[email]": {
                    required: true,
                    email: true,
                    remote: {
                        url: '/users/check_email',
                        type: 'GET',
                        data: {
                            email: function() {
                                return $("#user_email").val()
                            }
                        }
                    }
                },
                "user[date_of_birth]": {
                    required: true
                },
                "user[lang_1]": {
                    required: true
                }
            },

            messages: {
                "user[nickname]": {
                    remote: "Этот никнейм уже занять, попробуйте другой"
                },
                "user[email]": {
                    remote: "На этот email уже зарегистрирован другой аккаунт"
                }
            }
        });
    });
}