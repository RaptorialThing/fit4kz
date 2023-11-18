ActiveAdmin.register Program do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params  :description, :title, :user_id,
  #
  # or
  #
  permit_params do
    permitted = [:description, :title, :user_id]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  filter :created_at
  filter :updated_at

end
