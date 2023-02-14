require_relative './road_logistics.rb'
require_relative './sea_logistics.rb'

l = SeaLogistics.new
l.plan_delivery

l = RoadLogistics.new
l.plan_delivery
