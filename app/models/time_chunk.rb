class TimeChunk
  attr_accessor :source_id, :date_time, :hash, :db, :errors

  def initialize(attributes = {})
    @source_id  = attributes[:source_id]
    @date_time = attributes[:date_time]
    @hash = attributes[:hash]
    @db = attributes[:db]
    @errors = attributes[:errors]
  end

  def dynamo
  	dynamo_db = AWS::DynamoDB.new
    table = dynamo_db.tables.create('my-table', 10, 5)
    #sleep 1 while table.status
    return table.status
  end
end