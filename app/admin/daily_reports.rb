ActiveAdmin.register DailyReport do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :subuh, :dhuha, :tadarus, :keterangan, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:subuh, :dhuha, :tadarus, :keterangan, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :user_firstname_or_user_lastname_cont, label: 'Cari Berdasarkan Nama'
  filter :major, label: 'Cari Berdasarkan Kelas'
  filter :pendamping_laporan, label: 'Cari Berdasarkan Pendamping Laporan'
  filter :tanggal

  controller do
    def index
      index! do |format|
        format.html
        format.csv { send_data @daily_reports.to_csv }
        format.pdf do
      #   pdf = Prawn::Document.new
      #   pdf.text "Hellow World!"
      #   send_data pdf.render,
      #     filename: "export.pdf",
      #     type: 'application/pdf',
      #     disposition: 'inline'
      # end
        # format.pdf do
          pdf = DailyReportsPdf.new(@daily_reports)
          send_data pdf.render,
              filename: "Laporan Harian.pdf"
          end
      end
    end
  end

   index :download_links => [:pdf, :csv]

  index do
    selectable_column
    id_column
    column "Nama" do |m|
      user = User.find(m.user_id).firstname
      user2 = User.find(m.user_id).lastname
      user +" "+user2
    end
    column "Jurusan" do |m|
      user = User.find(m.user_id).major
    end
    column :pendamping_laporan
    column :subuh
    column :dhuha
    column :tadarus
    column :tanggal
    actions
  end
  # perm

   csv do
    column(:Nama) { |r| r.user.firstname + r.user.lastname  }
    column(:pendamping_laporan) { |r| r.pendamping_laporan }
    column(:major) { |r| r.user.major  }
    column(:tanggal) { |r| r.user.created_at  }
    column(:subuh) { |r| r.subuh }
    column(:dhuha) { |r| r.dhuha }
    column(:tadarus) { |r| r.tadarus }
    # column(:files) { |r| URI.parse(r.files.first.service_url).open }

  end

  show do
   attributes_table do
      # row :files do |av|
      #   image_tag av.files, width: "50%" if av.files.attached?
      # end

      row :documentations do |av|
        ul do
          if av.documentations.attached?
            av.documentations.each do |img|
              li do
                image_tag img, width: "40%"
              end
            end
          end
        end
      end

      row :user
      row :major
      row :pendamping_laporan
      row :subuh
      row :dhuha
      row :tadarus

      row :keterangan
      row :tanggal


    end
  end

end
