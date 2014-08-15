class Langdesc < ActiveRecord::Base
  self.table_name = "langdesc"
  self.primary_key = "factor_code"
  has_many :languals, class_name: "Langual", foreign_key: "factor_code"
end