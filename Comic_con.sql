
vehicles[icon:car,color:blue]{
  vehicle_id varchar(20) PK
  vehicle_number varchar(20)
  vehicle_category_id varchar(20) FK
}

vehicle_categories[icon:tag,color:green]{
  category_id varchar(20) PK
  name enum('bike','car','suv','cab','ev')
}

parking_zones[icon:map,color:yellow]{
  zone_id varchar(20) PK
  name varchar(50)
}

parking_levels[icon:layers,color:orange]{
  level_id varchar(20) PK
  zone_id varchar(20) FK
  level_number int
}

spot_categories[icon:key,color:red]{
  spot_category_id varchar(20) PK
  name enum('general','vip','staff','exhibitor','cosplayer','ev')
}

parking_spots[icon:parking,color:purple]{
  spot_id varchar(20) PK
  level_id varchar(20) FK
  spot_category_id varchar(20) FK
  is_available boolean
}

parking_sessions[icon:clock,color:blue]{
  session_id varchar(20) PK
  vehicle_id varchar(20) FK
  spot_id varchar(20) FK
  entry_time datetime
  exit_time datetime
  status enum('active','completed')
}

tickets[icon:file-text,color:grey]{
  ticket_id varchar(20) PK
  session_id varchar(20) FK
  issued_at datetime
}

payments[icon:dollar-sign,color:green]{
  payment_id varchar(20) PK
  session_id varchar(20) FK
  amount int
  status enum('paid','pending','failed')
  method enum('cash','upi','card')
  paid_at datetime
}



vehicle_categories.category_id < vehicles.vehicle_category_id

parking_zones.zone_id < parking_levels.zone_id
parking_levels.level_id < parking_spots.level_id

spot_categories.spot_category_id < parking_spots.spot_category_id

vehicles.vehicle_id < parking_sessions.vehicle_id
parking_spots.spot_id < parking_sessions.spot_id

parking_sessions.session_id < tickets.session_id
parking_sessions.session_id < payments.session_id