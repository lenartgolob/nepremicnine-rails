ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    st_estates=0;
    st_users=0;
    st_nakup=0;
    st_prodaja=0;
    st_najem=0;
    st_oddaja=0;


    Estate.all.map do |estate|
      st_estates = st_estates + 1;
      if estate.posredovanje == "Nakup"
        st_nakup = st_nakup + 1;
      end
      if estate.posredovanje == "Prodaja"
        st_prodaja = st_prodaja + 1;
      end
      if estate.posredovanje == "Najem"
        st_najem = st_najem + 1;
      end
      if estate.posredovanje == "Oddaja"
        st_oddaja = st_oddaja + 1;
      end
    end
    User.all.map do |user|
      st_users = st_users + 1;
    end
    
    columns do

      column do
        panel "Statistika" do
          para "Število nepremičnin: " + st_estates.to_s;
          para "Število uporabnikov: " + st_users.to_s;
          para "Število nepremičnin, ki so naprodaj: " + st_prodaja.to_s;
          para "Število nepremičnin za nakup: " + st_nakup.to_s;
          para "Število nepremičnin, ki se oddajajo: " + st_oddaja.to_s;
          para "Število nepremičnin za najem: " + st_najem.to_s;
        end
      end
      column do
        panel "Seznam uporabnikov" do
          ul do

            User.all.map do |user|
              li link_to(user.email, admin_user_path(user));
            end
          end
        end
      end


    end

    columns do
      column do
        panel "Seznam nepremicnin" do
          ul do

            Estate.all.map do |estate|
              li link_to(estate.ime, admin_estate_path(estate));
            end
          end
        end
      end

    end

    columns do

      column do
        panel "Seznam nepremicnin, ki so naprodaj" do
          ul do
            Estate.all.map do |estate|
              if estate.posredovanje == "Prodaja"
                li link_to(estate.ime, admin_estate_path(estate));
              end
            end
          end
        end
      end

      column do
        panel "Seznam nepremicnin za nakup" do
          ul do
            Estate.all.map do |estate|
              if estate.posredovanje == "Nakup"
                li link_to(estate.ime, admin_estate_path(estate));
              end
            end
          end
        end
      end

      column do
        panel "Seznam nepremicnin, ki se oddajajo" do
          ul do
            Estate.all.map do |estate|
              if estate.posredovanje == "Oddaja"
                li link_to(estate.ime, admin_estate_path(estate));
              end
            end
          end
        end
      end

      column do
        panel "Seznam nepremicnin za najem" do
          ul do
            Estate.all.map do |estate|
              if estate.posredovanje == "Najem"
                li link_to(estate.ime, admin_estate_path(estate));
              end
            end
          end
        end
      end


    end
  end # content
end
