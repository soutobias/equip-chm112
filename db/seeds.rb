# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

HistoricSensor.destroy_all
User.destroy_all
Sensor.destroy_all
ItemType.destroy_all
Item.destroy_all
Situation.destroy_all
Place.destroy_all


users = ['tobias', 'lellis', 'natalia', 'michelle', 'felippe', 'marlon', 'castro', 'chaves', 'henrique', 'felix', 'dias']


users.each_with_index do |user, idx|
  if idx == 0
    admin = true
  else
    admin = false
  end
  u = User.new(
    email: "#{idx}@gmail.com",
    username: user,
    password: 'marinha',
  )
  u.admin = admin
  u.save!
end

tables = CSV.parse(File.read("db/items.csv"), headers: true, :col_sep => "\t")

tables.each do |row|
  u = Item.new(
    id: row['id'].to_i,
    item: row['item']
  )
  u.save!
end

tables = CSV.parse(File.read("db/item_types.csv"), headers: true, :col_sep => "\t")

tables.each do |row|
  u = ItemType.new(
    id: row['id'].to_i,
    item_id: row['item_id'].to_i,
    item_type: row['item_type'].downcase,
  )
  u.save!
end

tables = CSV.parse(File.read("db/places.csv"), headers: true, :col_sep => "\t")

tables.each do |row|
  u = Place.new(
    id: row['id'].to_i,
    place: row['place'].downcase,
  )
  u.save!
end

tables = CSV.parse(File.read("db/situations.csv"), headers: true, :col_sep => "\t")

tables.each do |row|
  u = Situation.new(
    id: row['id'].to_i,
    status: row['status'].downcase,
  )
  u.save!
end


tables = CSV.parse(File.read("db/sensors.csv"), headers: true, :col_sep => ",")

tables.each do |row|
  if row['observation']
    r = row['observation'].downcase
  else
    r = row['observation']
  end
  u = Sensor.new(
    id: row['id'].to_i,
    item_type_id: row['item_type_id'].to_i,
    serial_number: row['serial_number'],
    owner: row['owner'],
    register_number: row['register_number'],
    model: row['model'].downcase,
    manufacturer: row['manufacturer'].downcase,
    place_id: row['place_id'].to_i,
    situation_id: row['situation_id'].to_i,
    manual: row['manual'],
    datasheet: row['datasheet'],
    acquisition_date: row['acquisition_date'],
    maintenance_date: row['maintenance_date'],
    calibration_date: row['calibration_date'],
    observation: r
  )
  p row['id'].to_i
  if row['foto']
    file = URI.open(row['foto'])
    u.photo.attach(io: file, filename: "1.jpg", content_type: 'image/jpg')
  end
  u.save!

  hs = HistoricSensor.new(
    sensor_id: row['id'].to_i,
    item_type_id: row['item_type_id'].to_i,
    serial_number: row['serial_number'],
    owner: row['owner'],
    register_number: row['register_number'],
    model: row['model'].downcase,
    manufacturer: row['manufacturer'].downcase,
    place_id: row['place_id'].to_i,
    situation_id: row['situation_id'].to_i,
    manual: row['manual'],
    datasheet: row['datasheet'],
    acquisition_date: row['acquisition_date'],
    maintenance_date: row['maintenance_date'],
    calibration_date: row['calibration_date'],
    if row['observation']
      observation: r
  )
  hs.user = User.first
  hs.save!
end

