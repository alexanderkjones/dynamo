class DatapointsController < ApplicationController
	
	# GET /datapoints
  	# GET /datapoints.json
	def index
		# connect to DB
		db = AWS::DynamoDB.new
		table = db.tables['hive_data_store']
		table.hash_key = [:hive_id, :string]
		table.range_key = [:date_time, :number]

		# initialize data array
		datapoints = []

		# request a maximum of 10 items from Amazon DynamoDB
		table.items.select(:limit => 10).each do |item_data|
			datapoints.push(item_data.attributes)
		end
		
		# pass datapoints to /index
		@var = datapoints
	end

	# POST /datapoints
  	# POST /datapoints.json
	def create
		# connect to DB
		db = AWS::DynamoDB.new
		table = db.tables['hive_data_store']
		table.hash_key = [:hive_id, :string]
		table.range_key = [:date_time, :number]

		# initialize batch
		batch = AWS::DynamoDB::BatchWrite.new

		# batch test
		/batch.put(table, [
			{:hive_id => 'HID100', :date_time => 2322323232, :color => 'green'}
		])
		batch.process!/

		@dataset = params[:value]

		@parsed_json = ActiveSupport::JSON.decode(@dataset)

		my_id = @parsed_json["hive_id"];
		my_time = @parsed_json["date_time"];

		@parsed_json["data"].each do |datapoint|
			dataHash = Hash[:hive_id => my_id, :date_time => my_time];
			datapoint.each_pair do |k,v|
				dataHash.merge!(k => v);
			end
			my_time = my_time -1;
			File.open('test.txt', 'a') {|f| f.write(batch.inspect)};
			thisa = Array.new();
			thisa.push(dataHash)
			batch.put(table, [dataHash]);
		end
		batch.process!


		/@dataset[:datapoints].each do |datapoint|
			@data = {
						:hive_id => @dataset[:id], 
						:date_time => @dataset[:datetime],
						:voltage => @dataset[:voltage],
						:fxpoint => datapoint
					}
			batch.put(table, @data)
			File.open('test.txt', 'a') {|f| f.write(@data) }
		end

		batch.process!/

		#File.open('test.txt', 'a') {|f| f.write(@parsed_json["data"]) }

		
	
	end

	def show
		@body = File.open("test.txt", "rb") {|io| io.read}
	end

end
