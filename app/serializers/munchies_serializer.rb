class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :restaurants

end
