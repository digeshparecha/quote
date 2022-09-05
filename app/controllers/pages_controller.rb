class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def export_csv
    begin
      company = Company.find_by_id(params[:company])
      csv_builder = CsvBuilder.new(company&.id)
      respond_to do |format|
        format.csv { send_data csv_builder.send(("built_" + params[:type]).to_sym), filename: "#{params[:type]}-#{company&.name}-#{DateTime.now.strftime("%d-%m-%Y,%H:%M")}.csv"}
      end
    rescue
      redirect_to bids_path, notice: "Something went wrong. please try again."
    end
  end
end