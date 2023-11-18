ActiveAdmin.register Training do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params  :user_id, :program_id, :video_link, :description, :title
  #
  # or
  #
  permit_params do
    permitted = [:user_id, :program_id, :video_link, :description, :title]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  filter :created_at
  filter :updated_at

end
