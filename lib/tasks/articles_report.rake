require "csv"

HEADERS = ["Created At", "Title", "Comments Count"].freeze
PATH = "tmp/reports/".freeze

namespace :articles_report do
  desc "Export articles report in csv format"
  task csv: :environment do
    create_dir
    CSV.open "#{PATH}#{Time.current.to_i}.csv", "wb" do |csv|
      csv << HEADERS
      articles.each do |row|
        csv << row.data
      end
    end
  end

  desc "Export articles report in xlsx format"
  task xlsx: :environment do
    create_dir
    p = Axlsx::Package.new
    p.workbook.add_worksheet(name: "Report") do |sheet|
      sheet.add_row HEADERS
      articles.each do |row|
        sheet.add_row row.data
      end
    end
    p.use_shared_strings = true
    p.serialize("#{PATH}#{Time.current.to_i}.xlsx")
    puts "xlsx"
  end

  def articles
    Article.where("created_at > ?", 1.month.ago)
  end

  def create_dir
    Dir.mkdir(PATH) unless File.exist?(PATH)
  end
end
