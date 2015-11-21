module Ecm::References
  class Routing
    def self.routes(router, options = {})
      options.reverse_merge!({})

      router.resources :ecm_references_categories, :controller => 'ecm/references/categories'
      router.resources :ecm_references_references, :controller => 'ecm/references/references'
    end # def
  end # class Routing
end # module Ecm::References

