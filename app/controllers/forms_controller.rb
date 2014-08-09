class FormsController < ApplicationController
  def new()
    @form = Form.new
    if !get_user
      render :layout => !pjax?
    end
  end

  def create()
    if !user = get_user
      return redirect_to users_login_path
    end

    @form = Form.new(form_params)
    @form.user = user

    if !game = Game.where(id: params[:form][:game]).first
      return render 'new', :layout => !pjax?
    end

    if user.games.length >= 3
      @form.errors.add(:game, I18n.t('views.messages.too_many_games'))
      return render 'new', :layout => !pjax?
    end

    if user.games.include? game
      @form.errors.add(:game, I18n.t('views.messages.you_are_looking_for_this_game_already'))
      return render 'new', :layout => !pjax?
    end

    @form.game = game

    if(!@form.save)
      render 'new', :layout => !pjax?
    else
      redirect_to users_login_path
    end
  end

  def form_params
    params.require(:form).permit(:europe, :australia,
                                 :asia, :north_america, :south_america,
                                  :africa, :age_from, :age_upto)
  end
end
