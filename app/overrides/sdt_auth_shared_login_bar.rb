Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :name => "sdt_auth_shared_login_bar",
                     :insert_bottom => "[data-hook='shared_login_bar']",
                     :partial => "shared/login_bar",
                     :disabled => false,
                     :original => '5eaaa38550c9e66c315518efc85a0fec2e259f2f')

