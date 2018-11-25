ActiveAdmin.register Order do
  permit_params :status_id

  index do
    selectable_column

    column :student do |order|
      link_to order.student.name.html_safe, admin_student_path(order.student)
    end

    column "Sub-Total", :order_amount

    column "Province" do |order|
      link_to order.student.province.name.html_safe, admin_province_path(order.student.province)
    end

    column :province_rate
    column :canada_rate

    column "Total" do |order|
      order.order_amount +  (order.order_amount * (order.province_rate + order.canada_rate))
    end

    column :status do |order|
      order.status.name.html_safe
    end

    column :classifieds do |order|
      order.classifieds.map { |classified| link_to classified.item, admin_classified_path(classified) }.join(", ").html_safe
    end
    actions
  end

  show do |order|
    attributes_table do
      row :student do |order|
        link_to order.student.name.html_safe, admin_student_path(order.student)
      end

      row "Sub-Total" do |order|
        number_to_currency(order.order_amount)
      end

      row "Province" do |order|
        link_to order.student.province.name.html_safe, admin_province_path(order.student.province)
      end

      row :province_rate
      row :canada_rate

      row "Total" do |order|
        number_to_currency(order.order_amount +  (order.order_amount * (order.province_rate + order.canada_rate)))
      end

      row :status do |order|
        order.status.name.html_safe
      end

      row :classifieds do |order|
        order.classifieds.map { |classified| link_to classified.item, admin_classified_path(classified) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Order" do
      f.input :status
    end

    f.actions
  end
end
