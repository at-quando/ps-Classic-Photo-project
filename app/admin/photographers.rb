ActiveAdmin.register Photographer do
  permit_params :avatar, :name, :date_join, :role, :description, :phone, :address

  index do
    selectable_column
    id_column
    column :avatar
    column :name
    column :date_join
    column :role
    column :description
    column :phone
    column :address
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.inputs "Attachment", :multipart => true do 
        f.input :avatar, as: :file
      end
      f.input :name
      f.input :date_join
      f.input :role
      f.input :description
      f.input :phone
      f.input :address
    end
    f.actions
  end

end
