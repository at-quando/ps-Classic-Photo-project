ActiveAdmin.register ContractPhotographer do
permit_params :photographer_id, :contract_id, :salary, :finishImages

  index do
    selectable_column
    id_column
    column 'Link' do |member|
      link_to("#{member.contract.name} - #{member.contract.group}, #{member.contract.school}, #{member.contract.school_year}", "../contracts/#{member.contract_id}?code=#{member.contract.code}").html_safe
    end
    column 'Thợ chụp' do |member|
      link_to("#{member.photographer.name}", "#").html_safe
    end
    column :salary
    column :photographer_id
    column :contract_id
    column(:finishImages) do |check| 
      check.finishImages? ? status_tag( "yes", :ok ) : status_tag( "no" )
    end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.input :photographer_id, :as => :select, :collection => Photographer.all.map{|u| ["#{u.name}, #{u.phone}", u.id]}
    f.input :contract_id, :as => :select, :collection => Contract.all.order(taken_date: :desc).map{|u| ["#{u.taken_date} -> #{u.group}, #{u.school}, #{u.school_year}", u.id]}
    f.input :salary
    f.input :finishImages

    f.actions
  end
end
