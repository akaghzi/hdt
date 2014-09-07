class NutData < ActiveRecord::Base
  self.table_name = "nut_data"
  belongs_to :nutr_def, class_name: "NutrDef", primary_key: "nutr_no", foreign_key: "nutr_no"
  belongs_to :fd_desc, class_name: "FdDesc", primary_key: "ndb_no", foreign_key: "ndb_no"
  belongs_to :src_cd, class_name: "SrcCd", primary_key: "src_cd", foreign_key: "src_cd"
  belongs_to :list_item, primary_key: "ndb_no", foreign_key: "ndb_no"
  scope :hasval, -> {where("nutr_val > ?", 0)}
    
end