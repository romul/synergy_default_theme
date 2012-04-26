Deface::Override.new(
    :virtual_path => "layouts/spree_application",
    :insert_bottom => "[data-hook='inside_head']",
    :partial => "shared/compare_product_javascript",
    :name => "sdt_scp_inside_head") if defined?(SpreeCompareProducts)