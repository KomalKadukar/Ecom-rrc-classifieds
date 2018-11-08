ActiveAdmin.register Classified do
  permit_params :item, :price, :description, :category_id, :student_id, :admin_ad, :sold, :image, program_classifieds_attributes: [:id, :program_id, :classified_id, :_destroy]

  index do
    selectable_column
    column :item
    column :price
    column :description
    column :category_id
    column :student_id
    column :admin_ad
    column :sold
    column :image

    column :programs do |classified|
      classified.programs.map { |prog| prog.name }.join(", ").html_safe
    end
    actions

  end

  show do |classifed|
    attributes_table do
      row :item
      row :price
      row :description
      row :category_id
      row :student_id
      row :admin_ad
      row :sold
      row :image

      row :programs do |classified|
        classifed.programs.map { |prog| prog.name }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Classified" do
      f.input :item
      f.input :price
      f.input :description
      f.input :category_id
      f.input :student_id
      f.input :admin_ad
      f.input :sold
      f.input :image

      f.has_many :program_classifieds, allow_destroy: true do |n_f|
        n_f.input :program
      end

    end

    f.actions
  end

end
