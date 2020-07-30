ActiveAdmin.register Artikel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :judul, :thumbnail, :isi

  form do |f|
    f.inputs 'Artikel' do
       f.input :thumbnail, as: :file
      f.input :judul
      f.input :isi, as: :quill_editor
    end
    f.actions
  end

  show do
   attributes_table do
      # row :files do |av|
      #   image_tag av.files, width: "50%" if av.files.attached?
      # end

      row :thumbnail do |ad|
        image_tag ad.thumbnail, width: "50%"
      end
      row :judul
      row :isi
      row :created_at


    end
  end
  # or
  #
  # permit_params do
  #   permitted = [:judul]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
