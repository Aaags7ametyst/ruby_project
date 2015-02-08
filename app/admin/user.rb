ActiveAdmin.register User do

  permit_params :login, :password, :password_confirmation, :email, :role, :name, :surname
  actions :all

  index do
    selectable_column
    id_column
    column :login
    column :email
    column :name
    column :surname
    column :role
    column :district
    column :created_at
    actions defaults: true do |user|
   #   link_to 'Zmień role', change_role_admin_user_path(user)
    end

  end
     
  show do
    attributes_table do
      row :login
      row :email
      row :name
      row :surname
      row :role
      row :district
      row :created_at
      row :updated_at
    end
    
  end
  
  form do |f|
    f.inputs "User Details" do
      f.input :login
      f.input :email
      f.input :name
      f.input :surname
      f.input :district	
      f.input :role, :label => 'Rola', :as => :select, :collection => User::ROLES
      f.input :password
      #f.input :password_confirmation
    end
    f.actions
  end
  #member_action :change_role, method: :get do
   # @user = User.find(params[:id])
  #end


end
