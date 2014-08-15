class Footnote < ActiveRecord::Base
  self.table_name = "footnote"
  belongs_to :fd_desc, class_name: "FdDesc", primary_key: "ndb_no", foreign_key: "ndb_no"
  belongs_to :nutr_def, class_name: "NutrDef", primary_key: "nutr_no", foreign_key: "nutr_no"
end