function users_new_intialize() {
    jQuery.validator.addMethod("lettersNumbersOnly", function(value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]+$/i.test(value);
        }, "Используйте для логина только буквы английского алфавита");

    jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
        return this.optional(element) || value != $(param).val();
    }, "Пароль и никнейм должны быть разными");

    $(document).ready(function(){
        $("#registration_form").validate({
            rules: {
                "user[nickname]": {
                    required: true,
                    rangelength: [5, 20],
                    lettersNumbersOnly: true,
                    remote: {
                        url: 'check_nick',
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
                        url: 'check_email',
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
                }
            },

            messages: {
                "user[nickname]": {
                    required: "Введите свой никнейм",
                    rangelength: "Длина логина должна быть от {0} до {1} знаков",
                    remote: "Этот никнейм уже занять, попробуйте другой"
                },
                "user[password]": {
                    required: "Введите свой пароль",
                    rangelength: "Длина пароля должна быть от {0} до {1} знаков"
                },
                "user[password_confirmation]": {
                    required: "Подтвердите пароль",
                    equalTo: "Пароли не совпадают"
                },
                "user[email]": {
                    required: "Введите email",
                    email: "Ваш email введен некоректно",
                    remote: "На этот email уже зарегистрирован другой аккаунт"
                },
                "user[date_of_birth]": {
                    required: "Введите вашу дату рождения"
                }
            }
        });
    });
}