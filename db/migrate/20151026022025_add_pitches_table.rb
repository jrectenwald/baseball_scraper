class AddPitchesTable < ActiveRecord::Migration
  def change
    create_table(:pitches, id: false) do |t|
      t.primary_key :id, :integer
      t.string :des
      t.string :des_es
      t.string :result
      t.string :tfs
      t.string :tfs_zulu
      t.string :x
      t.string :y
      t.string :event_numb
      t.string :on_1b
      t.string :on_2b
      t.string :on_3b
      t.string :sv_id
      t.string :play_guid
      t.string :start_speed
      t.string :end_speed
      t.string :sz_top
      t.string :sz_bot
      t.string :pfx_x
      t.string :pfx_z
      t.string :px
      t.string :pz
      t.string :x0
      t.string :y0
      t.string :z0
      t.string :vx0
      t.string :vy0
      t.string :vz0
      t.string :ax
      t.string :ay
      t.string :az
      t.string :break_y
      t.string :break_angle
      t.string :break_length
      t.string :pitch_type
      t.string :type_confidence
      t.string :zone
      t.string :nasty
      t.string :spin_dir
      t.string :spin_rate
      t.string :cc
      t.string :mt
    end
  end
end