module ApplicationHelper

  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger'
    }[flash_type.to_sym] || flash_type.to_s
  end

end
