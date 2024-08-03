# Users
ap "Adding bands ..."
Band.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("bands")
Band.create!(
  key: "2200m",
  name: "2200-meters",
  range: "LF",
  frequency_start_mhz: 0.1357,
  frequency_end_mhz: 0.1378,
  is_active: false,
  order: 1
)
Band.create!(
  key: "630m",
  name: "630-meters",
  range: "MF",
  frequency_start_mhz: 0.472,
  frequency_end_mhz: 0.479,
  is_active: false,
  order: 2
)
Band.create!(
  key: "160m",
  name: "160-meters",
  range: "MF",
  frequency_start_mhz: 1.8,
  frequency_end_mhz: 2.0,
  is_active: true,
  order: 3
)
Band.create!(
  key: "80m",
  name: "80-meters",
  range: "HF",
  frequency_start_mhz: 3.5,
  frequency_end_mhz: 4.0,
  is_active: true,
  order: 4
)
Band.create!(
  key: "60m",
  name: "60-meters",
  range: "HF",
  frequency_start_mhz: 5.3515,
  frequency_end_mhz: 5.3665,
  is_active: true,
  order: 5
)
Band.create!(
  key: "40m",
  name: "40-meters",
  range: "HF",
  frequency_start_mhz: 7.0,
  frequency_end_mhz: 7.3,
  is_active: true,
  order: 6
)
Band.create!(
  key: "30m",
  name: "30-meters",
  range: "HF",
  frequency_start_mhz: 10.0,
  frequency_end_mhz: 10.150,
  is_active: true,
  order: 7
)
Band.create!(
  key: "20m",
  name: "20-meters",
  range: "HF",
  frequency_start_mhz: 14.0,
  frequency_end_mhz: 14.35,
  is_active: true,
  order: 8
)
Band.create!(
  key: "17m",
  name: "17-meters",
  range: "HF",
  frequency_start_mhz: 18.068,
  frequency_end_mhz: 18.168,
  is_active: true,
  order: 9
)
Band.create!(
  key: "12m",
  name: "12-meters",
  range: "HF",
  frequency_start_mhz: 24.890,
  frequency_end_mhz: 24.990,
  is_active: true,
  order: 10
)
Band.create!(
  key: "10m",
  name: "10-meters",
  range: "HF",
  frequency_start_mhz: 28.000,
  frequency_end_mhz: 29.700,
  is_active: true,
  order: 10
)
Band.create!(
  key: "8m",
  name: "8-meters",
  range: "VHF",
  frequency_start_mhz: 40.000,
  frequency_end_mhz: 45.000,
  is_active: false,
  order: 11
)
Band.create!(
  key: "6m",
  name: "6-meters",
  range: "VHF",
  frequency_start_mhz: 50.000,
  frequency_end_mhz: 54.000,
  is_active: true,
  order: 12
)
Band.create!(
  key: "4m",
  name: "4-meters",
  range: "VHF",
  frequency_start_mhz: 70.000,
  frequency_end_mhz: 70.500,
  is_active: false,
  order: 11
)
Band.create!(
  key: "2m",
  name: "2-meters",
  range: "VHF",
  frequency_start_mhz: 144.000,
  frequency_end_mhz: 148.000,
  is_active: false,
  order: 12
)
Band.create!(
  key: "70cm",
  name: "70-centimeters",
  range: "VHF",
  frequency_start_mhz: 430.000,
  frequency_end_mhz: 440.000,
  is_active: false,
  order: 13
)