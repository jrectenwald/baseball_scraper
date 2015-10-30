# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151028224800) do

  create_table "at_bats", force: :cascade do |t|
    t.integer "at_bat_num"
    t.integer "balls"
    t.integer "strikes"
    t.integer "outs"
    t.string  "start_tfs_zulu"
    t.string  "stand"
    t.string  "b_height"
    t.string  "p_throws"
    t.integer "batter_id"
    t.integer "pitcher_id"
    t.string  "description"
    t.string  "top_or_bottom"
    t.integer "home_team_runs"
    t.integer "away_team_runs"
    t.integer "inning_id"
  end

  create_table "games", force: :cascade do |t|
  end

  create_table "innings", force: :cascade do |t|
    t.string  "number"
    t.string  "away_team"
    t.string  "home_team"
    t.string  "next_inning"
    t.integer "game_id"
  end

  create_table "pitches", force: :cascade do |t|
    t.integer "batter_id"
    t.integer "pitcher_id"
    t.integer "at_bat_num"
    t.string  "des"
    t.string  "des_es"
    t.string  "result"
    t.string  "tfs"
    t.string  "tfs_zulu"
    t.string  "x"
    t.string  "y"
    t.string  "event_numb"
    t.string  "on_1b"
    t.string  "on_2b"
    t.string  "on_3b"
    t.string  "sv_id"
    t.string  "play_guid"
    t.string  "start_speed"
    t.string  "end_speed"
    t.string  "sz_top"
    t.string  "sz_bot"
    t.string  "pfx_x"
    t.string  "pfx_z"
    t.string  "px"
    t.string  "pz"
    t.string  "x0"
    t.string  "y0"
    t.string  "z0"
    t.string  "vx0"
    t.string  "vy0"
    t.string  "vz0"
    t.string  "ax"
    t.string  "ay"
    t.string  "az"
    t.string  "break_y"
    t.string  "break_angle"
    t.string  "break_length"
    t.string  "pitch_type"
    t.string  "type_confidence"
    t.string  "zone"
    t.string  "nasty"
    t.string  "spin_dir"
    t.string  "spin_rate"
    t.string  "cc"
    t.string  "mt"
    t.integer "at_bat_id"
  end

end
