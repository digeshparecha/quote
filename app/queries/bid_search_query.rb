class BidSearchQuery
  def self.search(company_id, params)
    current_company_bids = "company_id = #{company_id}" 
    current_company_bids += " AND name LIKE '%#{Bid.sanitize_sql_like(params[:query])}%'" unless params[:query].blank?
    Bid.includes(:line_item_dates).where(current_company_bids).ordered
  end
end