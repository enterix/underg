module UserHelper
  def lang_tag(tag_id)
    select_tag tag_id, options_for_select(
    [
        ["none", 0],
        ["Ukrainian", 1],
        ["English", 2],
        ["Russian", 3]
    ])
  end

  def worldpart_tag(tag_id)
    select_tag tag_id, options_for_select(
        [
            [I18n.t('views.forms.australia'), 1],
            [I18n.t('views.forms.asia'), 2],
            [I18n.t('views.forms.africa'), 3],
            [I18n.t('views.forms.europe'), 4],
            [I18n.t('views.forms.north_america'), 5],
            [I18n.t('views.forms.south_america'), 6]
        ])
  end
end
