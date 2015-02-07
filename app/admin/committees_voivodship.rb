ActiveAdmin.register CommitteesVoivodship do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :committee_id, :voivodship_id, :number_of_votes
  index do
    selectable_column
    id_column
    column :number_of_votes
    column :voivodship
    column :committee
    actions defaults: true do |committees_voivodship|
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
