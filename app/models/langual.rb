class Langual < ActiveRecord::Base
  self.table_name = "langual"
  belongs_to :langdesc, class_name: "Langdesc", primary_key: "factor_code", foreign_key: "factor_code"
  belongs_to :fd_desc, class_name: "FdDesc", primary_key: "ndb_no", foreign_key: "ndb_no"
end