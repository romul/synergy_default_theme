Deface::Override.new(
    :virtual_path => "admin/taxonomies/_form",
    :insert_bottom => "[data-hook='admin_inside_taxonomy_form']",
    :partial => "admin/taxonomies/show_on_homepage_field",
    :name => "sdt_admin_inside_taxonomy_form")