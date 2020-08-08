
class RoomScraper

    def initialize(url)
        @doc = Nokogiri::HTML(open(url))
    end 

    def rows
        @rows ||= @doc.search("li.result-row")
    end 

    def call
        rows.each do |row_doc| 
            Room.create_from_hash(scrape_row(row_doc))
        end
    end

    def scrape_row(row)
        {
            :date_created => row.search("time").attribute("datetime").text,
            :title => row.search("a.result-title").text,
            :url => row.search("a.result-title").attribute("href").value,
            :price => row.search("span.result-price").text
        }
    end

end 