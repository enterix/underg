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
    @form.age_from = params[:form][:age_from].to_i.years.ago
    @form.age_upto = params[:form][:age_upto].to_i.years.ago

    if !@form.valid?
      return render 'new', :layout => !pjax?
    end

    if group = get_group(@form)
      if group.forms.size >= group.count
        group.looking = false
      end
    else
      if !group = Group.new(count: params[:form][:count].to_i, looking: true)
        return root_path #you can make this error only if u dont use browser
      end
    end

    @form.save
    group.forms << @form
    group.save

    redirect_to forms_path
  end

  def index
    @groups = Group.joins(:forms).where(forms: {user_id: get_user().id}).all

    render 'index', :layout => !pjax?
  end

  private
  def form_params
    params.require(:form).permit(:europe, :australia,
                                 :asia, :north_america, :south_america,
                                  :africa)
  end

  def get_group(searcher)
    worldparts = {4 => searcher.europe, 1 => searcher.australia,2 => searcher.asia,
                  5 => searcher.north_america, 6=> searcher.south_america,
                  3 => searcher.africa}

    worldparts_strs = {4 => 'europe', 1 => 'australia', 2 => 'asia',
                       5 => 'north_america', 6=> 'south_america',
                       3 => 'africa'}

    Group.joins(
        "INNER JOIN forms ON groups.id = forms.group_id
         INNER JOIN users ON users.id = forms.user_id
				 INNER JOIN languages_users ON users.id = languages_users.user_id").group("groups.id").having(
                                        "groups.looking = 't' AND forms.game_id = ? AND (users.date_of_birth BETWEEN ? AND ?) AND users.worldpart in (?) AND
                                         forms.age_from <= ? AND forms.age_upto >= ? AND
                                         forms.#{worldparts_strs[searcher.user.worldpart]} = 't' AND
                                         languages_users.language_id in (?)",
                                        searcher.game_id,
                                        searcher.age_from,
                                        searcher.age_upto,
                                        worldparts.select {|_, v| v}.keys,
                                        searcher.user.date_of_birth,
                                        searcher.user.date_of_birth,
                                        searcher.user.languages.map{|a| a.id}
                                        ).first
  end
end
