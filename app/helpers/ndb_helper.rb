module NdbHelper
  def getcalories(ndb_no,kc)
    kc=FdDesc.find(ndb_no).nut_datas.select("sum(nutr_val) as total").where(nutr_no: "208")
  end
end