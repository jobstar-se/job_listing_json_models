module JobListingJsonModels

  class Category
    include JsonModel
    
    MAIN_CATEGORY = 1 # not supported in search
    SUB_CATEGORY  = 2 # ok
    LEAF_CATEGORY = 4 # recommended
    
    attribute :level, String # The level of specificity of the category
    attribute :id,    String # The JobStar.se code of the category
    attribute :level3, String # Temporary hack before we have category mapping
  end

end
