class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :end,
             :restaurants

end
