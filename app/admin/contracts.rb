ActiveAdmin.register Contract do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :phone, :school, :school_year, :address, :town, :group, :taken_date, :num_pp, :price_id, :package, :deposit, :prepare, :gift, :code, contract_plans_attributes: [:quater, :costume, :place, :prepare], viewers_attributes: [:email, :pwd, :drive_link]

  index do
    selectable_column
    id_column
    column :name
    column :phone
    column :school
    column :school_year
    column :address
    column :town
    column :group
    column :taken_date
    column :num_pp
    column :price_id
    column :package
    column :deposit
    column :prepare
    column :gift
    column :code
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Contract' do
      f.input :name
      f.input :phone
      f.input :school
      f.input :school_year
      f.input :address
      f.input :town
      f.input :group
      f.input :taken_date
      f.input :num_pp
      f.input :price_id, :as => :select, :collection => Price.all.map{|u| ["#{u.num_pp}, #{u.price}", u.id]}
      f.input :package
      f.input :deposit
      f.input :prepare
      f.input :gift
      f.input :code
    end
    f.has_many :contract_plans do |plan|
      unless !plan.object.new_record?
        plan.inputs 'Plan', :multipart => true do 
          plan.input :quater
          plan.input :costume
          plan.input :place
          plan.input :prepare
        end
      end
    end
    f.has_many :viewers do |view|
      view.inputs 'View', :multipart => true do 
        view.input :email
        view.input :pwd
        view.input :drive_link
      end
    end
    f.actions
  end
end
