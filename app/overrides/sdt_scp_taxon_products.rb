Deface::Override.new(
    :virtual_path => "taxons/show",
    :replace => "[data-hook='taxon_products']",
    :partial => "taxons/taxon_products",
    :name => "sdt_scp_taxon_products") if defined?(SpreeCompareProducts)