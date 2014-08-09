module FormsHelper
  def game_tag(tag_id)
    select_tag tag_id, options_for_select(
        [
            ["DayZ", 1],
            ["SAMP", 2],
            ["The Fores", 3],
            ["Minecraft", 4]
        ])
  end
end
