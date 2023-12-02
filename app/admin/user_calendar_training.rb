ActiveAdmin.register UserCalendarTraining do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :training_id, :icube_rule, :last_date, :training_datetime
  #
  # or
  #
  permit_params do
    permitted = [:user_id, :training_id, :icube_rule, :last_date, :training_datetime]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  filter :created_at
  filter :updated_at

end
