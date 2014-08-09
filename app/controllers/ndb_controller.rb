class NdbController < ApplicationController
  def index
    @weights = Weight.limit(10)
    @src_cds = SrcCd.limit(10)
    @fd_groups = FdGroup.limit(10)
    @nut_datas = NutData.limit(10)
    @fd_descs = FdDesc.limit(10)
    @languals = Langual.limit(10)
    @langdescs = Langdesc.limit(10)
    @nutr_defs = NutrDef.limit(10)
    @deriv_cds = Deriv_cd.limit(10)
    @footnotes = Footnote.limit(10)
  end
  def oneoff
    @fd_desc = FdDesc.find("02048")
  end
end
