OrdersHelper.module_eval do
  def truncate(text, options = {})
    super(strip_tags(text), options)
  end
end