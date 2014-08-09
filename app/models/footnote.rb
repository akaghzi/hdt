class Footnote < ActiveRecord::Base
  self.table_name = "footnote"
  belongs_to :nutr_def, class_name: "NutrDef", primary_key: "nutr_no", foreign_key: "nutr_no"
end