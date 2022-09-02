class CsvBuilder < BaseBuilder
  require 'csv'
  
  def initialize(company_id)
    @company_id = company_id
  end
  
  def built_bids
    bids = Bid.where(company_id: @company_id)
    generate_csv("Bid", bids)
  end

  def built_line_item_dates
    
  end

  def built_line_items
    
  end

  private

  def generate_csv(model_name, data)
    headers = model_name.constantize.column_names
    CSV.generate do |csv|
      csv << headers
      data.each do |d|
        csv << d.attributes.values_at(*headers)
      end
    end
  end

end