ProductsController.class_eval do
  helper :reviews if defined?(SpreeReviews)
end
