class Ndb < ActiveRecord::Migration

    create_table "data_src", id: false, force: true do |t|
      t.string "datasrc_id",  limit: 6
      t.string "authors",     limit: nil
      t.string "title",       limit: nil
      t.string "year",        limit: 4
      t.string "journal",     limit: nil
      t.string "vol_city",    limit: nil
      t.string "issue_state", limit: 5
      t.string "start_page",  limit: 5
      t.string "end_page",    limit: 5
    end

    create_table "datsrcln", id: false, force: true do |t|
      t.string "ndb_no",     limit: 5
      t.string "nutr_no",    limit: 3
      t.string "datasrc_id", limit: nil
    end

    create_table "deriv_cd", id: false, force: true do |t|
      t.string "deriv_cd",   limit: 4
      t.string "deriv_desc", limit: nil
    end

    create_table "fd_desc", id: false, force: true do |t|
      t.string  "ndb_no",      limit: 5
      t.string  "fdgrp_cd",    limit: 4
      t.string  "long_desc",   limit: nil
      t.string  "short_dest",  limit: nil
      t.string  "comname",     limit: nil
      t.string  "manufacname", limit: nil
      t.string  "survey",      limit: 1
      t.string  "ref_desc",    limit: nil
      t.decimal "refuse"
      t.string  "sciname",     limit: nil
      t.decimal "n_factor"
      t.decimal "pro_factor"
      t.decimal "fat_factor"
      t.decimal "cho_factor"
    end

    add_index "fd_desc", ["ndb_no"], name: "fddescndbno", using: :btree

    create_table "fd_group", id: false, force: true do |t|
      t.string "fdgrp_cd",   limit: 4
      t.string "fdgrp_desc", limit: nil
    end

    create_table "footnote", id: false, force: true do |t|
      t.string "ndb_no",     limit: 5
      t.string "footnt_no",  limit: 4
      t.string "footnt_typ", limit: 1
      t.string "nutr_no",    limit: 3
      t.string "footnt_txt", limit: nil
    end

    create_table "langdesc", id: false, force: true do |t|
      t.string "factor_code", limit: 5
      t.string "description", limit: nil
    end

    create_table "langual", id: false, force: true do |t|
      t.string "ndb_no",      limit: 5
      t.string "factor_code", limit: 5
    end

    create_table "nut_data", id: false, force: true do |t|
      t.string  "ndb_no",        limit: 5
      t.string  "nutr_no",       limit: 3
      t.decimal "nutr_val"
      t.decimal "num_data_pts"
      t.decimal "std_error"
      t.string  "src_cd",        limit: 2
      t.string  "deriv_cd",      limit: 4
      t.string  "ref_ndb_no",    limit: 5
      t.string  "add_nutr_mark", limit: 1
      t.decimal "num_studies"
      t.decimal "min"
      t.decimal "max"
      t.decimal "df"
      t.decimal "low_eb"
      t.decimal "up_eb"
      t.string  "stat_cmt",      limit: nil
      t.string  "addmod_date",   limit: nil
      t.string  "cc",            limit: 1
    end

    add_index "nut_data", ["nutr_val"], name: "nutdataval", using: :btree

    create_table "nutr_def", id: false, force: true do |t|
      t.string  "nutr_no",  limit: 3
      t.string  "units",    limit: 7
      t.string  "tagname",  limit: nil
      t.string  "nutrdesc", limit: nil
      t.string  "num_dec",  limit: 1
      t.decimal "sr_order"
    end

    create_table "src_cd", id: false, force: true do |t|
      t.string "src_cd",     limit: 2
      t.string "srccd_desc", limit: nil
    end

    create_table "weight", id: false, force: true do |t|
      t.string  "ndb_no",       limit: 5
      t.string  "seq",          limit: 2
      t.decimal "amount"
      t.string  "msre_desc",    limit: nil
      t.decimal "gm_weight"
      t.decimal "num_data_pts"
      t.decimal "std_dev"
    end

end