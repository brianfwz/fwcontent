ActiveAdmin.register <%= class_name %> do
	permit_params :title, :description, :page, :position
end