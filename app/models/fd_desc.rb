class FdDesc < ActiveRecord::Base
  self.table_name = "fd_desc"
  self.primary_key = "ndb_no"
  belongs_to :fd_group, class_name: "FdGroup", primary_key: "fdgrp_cd", foreign_key: "fdgrp_cd"
  has_many :nut_datas, class_name: "NutData", foreign_key: "ndb_no"
  has_many :footnotes, class_name: "Footnote", foreign_key: "ndb_no"
  has_many :weights, class_name: "Weight", foreign_key: "ndb_no"
end