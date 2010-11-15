module JobListingJsonModels

  class Category
    include JsonModel
    
    MAIN_CATEGORY = 1 # not supported in search
    SUB_CATEGORY  = 2 # ok
    LEAF_CATEGORY = 3 # recommended
    
    attribute :id,    Integer # The JobStar.se code of the category
    attribute :name,  String # Temporary hack before we have category mapping
  end

end
