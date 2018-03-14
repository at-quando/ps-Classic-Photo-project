ActiveAdmin.register ContractPhotographer do
permit_params :photographer_id, :contract_id, :salary

  index do
    selectable_column
    id_column
    column :photographer_id
    column :contract_id
    column :salary
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.input :photographer_id, :as => :select, :collection => Photographer.all.map{|u| ["#{u.name}, #{u.phone}", u.id]}
    f.input :contract_id, :as => :select, :collection => Contract.all.map{|u| ["#{u.group}, #{u.school}, #{u.school_year}", u.id]}
    f.input :salary

    f.actions
  end
end
