Deface::Override.new(
    :virtual_path => "products/show",
    :name => "product_review",
    :insert_after => "[data-hook='product_properties']",
    :partial => "shared/reviews",
    :disabled => true)