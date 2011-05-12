if defined?(ReviewSweeper)
  ReviewSweeper.class_eval do
    private
    
    def expire_cache_for(review)
      review.product.recalculate_rating
      review.product.taxons.each do |taxon|
        expire_fragment([taxon, 'preview'])
      end
    end
  end
end
