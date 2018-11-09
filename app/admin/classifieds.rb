ActiveAdmin.register Classified do
  permit_params :item, :price, :description,
                :category_id, :student_id,
                :admin_ad, :sold, :image,
                program_classifieds_attributes: [:id, :program_id, :classified_id, :_destroy]

  index do
    selectable_column
    column :item
    column :price
    column :description

    column :category do |classified|
      classified.category.name.html_safe
    end

    column :student do |classified|
      classified.student.name.html_safe
    end

    column :admin_ad
    column :sold
    column :image

    column :programs do |classified|
      classified.programs.map { |prog| prog.name }.join(", ").html_safe
    end
    actions

  end

  show do |classified|
    attributes_table do
      row :item
      row :price
      row :description

      row :categories do |classified|
        classified.category.name.html_safe
      end

      row :student do |classified|
        classified.student.name.html_safe
      end

      row :admin_ad
      row :sold
      row :image

      row :programs do |classified|
        classified.programs.map { |prog| prog.name }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Classified" do
      f.input :item
      f.input :price
      f.input :description

      f.input :category
      f.input :student

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
