Deface::Override.new(
    :virtual_path => "admin/taxonomies/_form",
    :insert_bottom => "[data-hook='admin_inside_taxonomy_form']",
    :partial => "admin/taxonomies/comparable_field",
    :name => "sdt_scp_admin_inside_taxonomy_form") if defined?(SpreeCompareProducts)