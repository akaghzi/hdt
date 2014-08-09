class FdGroup < ActiveRecord::Base
  self.table_name = "fd_group"
  self.primary_key = "fdgrp_cd"
  has_many :fd_descs, class_name: "FdDesc", foreign_key: "fdgrp_cd"
end