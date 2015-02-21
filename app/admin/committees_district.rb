ActiveAdmin.register CommitteesDistrict do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :committee_id, :district_id, :votes, :voivodship_id
  index do
    selectable_column
    id_column
    column :district
    column :committees_voivodship
    column :committee
    column :votes
    actions defaults: true do |committees_district|
    end
   end

 
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
