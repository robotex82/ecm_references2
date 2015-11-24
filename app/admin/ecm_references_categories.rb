ActiveAdmin.register Ecm::References::Category do
  menu parent: proc { I18n.t('ecm.references.active_admin.menu') }.call

  permit_params :description,
                :locale,
                :markup_language,
                :name,
                :parent_id,
                :slug

  # Nested set settings
  config.sort_order = 'lft_asc'
  sortable_tree_member_actions

  form do |f|
    f.inputs do
      f.input :parent, as: :select, collection: nested_set_options(Ecm::References::Category, f.object) { |c| "#{'&#160;&#160;&#160;&#160;' * c.depth}&bull; #{c}".html_safe }
    end # f.inputs

    f.inputs do
      f.input :locale, as: :select, collection: I18n.available_locales.map(&:to_s)
      f.input :name
      f.input :description
    end # f.inputs

    f.inputs do
      f.input :markup_language, as: :select, collection: Ecm::References::Configuration.markup_languages.map(&:to_s)
    end # f.inputs

    f.actions
  end # form

  index as: :nested_set do
    selectable_column
    sortable_tree_columns
    sortable_tree_indented_column :name
    column :locale
    column :reference_count
    column :created_at
    column :updated_at
    actions
  end # index

  show title: :to_s do
    panel Ecm::References::Category.human_attribute_name(:description) do
      ecm_references_category.description
    end # panel

    panel Ecm::References::Category.human_attribute_name(:children) do
      table_for ecm_references_category.descendants, i18n: Ecm::References::Category do
        sortable_tree_columns
        sortable_tree_indented_column :name
        column :locale
        column :reference_count
        column :created_at
        column :updated_at
        column do |child|
          link_to(I18n.t('active_admin.view'), [:admin, child], class: 'member_link view_link') +
            link_to(I18n.t('active_admin.edit'), [:edit, :admin, child], class: 'member_link edit_link')
        end
      end # table_for
    end # panel

    panel Ecm::References::Category.human_attribute_name(:references) do
      table_for ecm_references_category.references, i18n: Ecm::References::Reference do
        sortable_columns
        column :preview_picture do |reference|
          image_tag(reference.preview_picture_image_url(:small_thumb)) unless reference.preview_picture_image_url(:small_thumb).nil?
        end
        column :name
        column :published
        column :created_at
        column :updated_at
        column do |child|
          link_to(I18n.t('active_admin.view'), [:admin, child], class: 'member_link view_link') +
            link_to(I18n.t('active_admin.edit'), [:edit, :admin, child], class: 'member_link edit_link')
        end
      end # table_for
    end # panel
  end # show

  sidebar Ecm::References::Category.human_attribute_name(:details), only: :show do
    attributes_table_for ecm_references_category do
      row :parent
      row :name
      row :locale
      row :reference_count
      row :created_at
      row :updated_at
    end
  end # sidebar
end # ActiveAdmin.register Ecm::References::Category
