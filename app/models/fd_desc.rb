class FdDesc < ActiveRecord::Base
  
  self.table_name = "fd_desc"
  self.primary_key = "ndb_no"
  
  belongs_to :fd_group, class_name: "FdGroup", primary_key: "fdgrp_cd", foreign_key: "fdgrp_cd"
  has_many :nut_datas, class_name: "NutData", foreign_key: "ndb_no"
  has_many :footnotes, class_name: "Footnote", foreign_key: "ndb_no"
  has_many :weights, class_name: "Weight", foreign_key: "ndb_no"
  has_many :languals, class_name: "Langual", foreign_key: "ndb_no"
  
  def self.search(query)
    where("lower(long_desc) like ?","%#{query}%".downcase)
  end
  
  def self.tsearch(term)
    where("lower(long_desc) like ?","#{term}%".downcase)
  end
  
end