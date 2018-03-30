ActiveAdmin.register Article do
  permit_params :content, :description, :kind, :title, :key, images_attributes: [:name]

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :description
    column :kind
    column :key
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Article' do
      f.input :title
      f.input :description
      f.input :content
      f.input :kind
      f.input :key
    end
    f.has_many :images do |image|
      unless !image.object.new_record?
        image.inputs 'Image', :multipart => true do 
          image.input :name, as: :file
        end
      end
    end

    f.actions
  end
end
