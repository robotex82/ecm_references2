ActiveAdmin.register Ecm::References::Reference do
  menu :parent => Proc.new { I18n.t('ecm.references.active_admin.menu') }.call

  permit_params :attached_pictures_attributes,
                :category,
                :ecm_categories_category_id,
                :description,
                :markup_language,
                :name,
                :pictures_attributes

  # List settings
  sortable_member_actions

  form do |f|
    f.inputs do
      f.input :category, :as => :select,
                         :collection => nested_set_options(Ecm::References::Category) { |c| "#{'&#160;&#160;&#160;&#160;' * c.depth}&bull; #{c.to_s}".html_safe },
                         :prompt => ''
    end # f.inputs

    f.inputs do
      f.input :name
      f.input :description
      f.input :published, :as => :boolean
    end # f.inputs

    f.inputs do
      f.input :markup_language, :as => :select, :collection => Ecm::References::Configuration.markup_languages.map(&:to_s)
    end # f.inputs

    form_inputs_for_pictureable(f)

    f.actions

#    f.inputs do
#      span do f.object.errors.inspect end
#    end
  end # form

  index do
    selectable_column
    column :preview_picture do |reference|
      image_tag(reference.preview_picture_image_url(:small_thumb)) unless reference.preview_picture_image_url(:small_thumb).nil?
    end
    column :category
    column :name
    column :published
    column :created_at
    column :updated_at
    actions
  end # index

  show :title => :to_s do
    panel Ecm::References::Reference.human_attribute_name(:description) do
      ecm_references_reference.description
    end # panel

    panel_for_pictureable
  end # show

  sidebar Ecm::References::Reference.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_references_reference do
      row :category
      row :name
      row :published
      row :markup_language
      row :created_at
      row :updated_at
    end
  end # sidebar
end # ActiveAdmin.register Ecm::References::Reference
