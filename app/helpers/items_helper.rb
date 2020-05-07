module ItemsHelper

  def items_only_action_name
    controller_name == "items" && action_name
  end
  
  def edit?
    @item.persisted?
  end

end
