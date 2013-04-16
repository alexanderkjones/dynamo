class DatapointsController < ApplicationController
	
	# GET /datapoints
  	# GET /datapoints.json
  	# Show last 10 Datapoints
	def index
		#connect to DB
		db = AWS::DynamoDB.new
		table = db.tables['hive_data_store']
		table.hash_key = [:hive_id, :string]
		table.range_key = [:date_time, :number]

		datapoints = []

		# request a maximum of 10 items from Amazon DynamoDB
		table.items.select(:limit => 10).each do |item_data|
			datapoints.push(item_data.attributes)
		end
		# Build Index
		@var = datapoints

		

	end

	# POST /datapoints
  	# POST /datapoints.json
	def create
		impresponse = params.inspect

		@params = impresponse

		File.open('test.txt', 'a') {|f| f.write(@params) }


	
	end

end
