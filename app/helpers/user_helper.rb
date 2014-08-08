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
end
