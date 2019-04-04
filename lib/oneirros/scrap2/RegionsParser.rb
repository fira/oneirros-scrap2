require 'nokogiri'

module Oneirros
  module Scrap2
    class RegionsParser

      def initialize()
        @rumap = Hash.new
        @rumap["РЕГИОН"] = "name"
        @rumap["АВТ"] = "isautonomy"
        @rumap["да"] = true
        @rumap["нет"] = false
        @rumap["НАС"] = "citizens"
        @rumap["ПРО"] = "residents"
        @rumap["ВА"] = "initialatk"
        @rumap["УЗ"] = "initialdef"
        @rumap["ГО"] = "hospital"
        @rumap["ВО"] = "militarybase"
        @rumap["ШК"] = "school"
        @rumap["ПВ"] = "missile"
        @rumap["ПО"] = "port"
        @rumap["ЭЛ"] = "powerplant"
        @rumap["КО"] = "spaceport"
        @rumap["АЭ"] = "airport"
        @rumap["ЖФ"] = "housing"
        @rumap["ЗОЛ"] = "goldnow"
        @rumap["НЕФ"] = "oilnow"
        @rumap["РУД"] = "orenow"
        @rumap["УРА"] = "uranow"
        @rumap["АЛМ"] = "dianow"
        @rumap["ЗОЛ Р"] = "goldbase"
        @rumap["НЕФ Р"] = "oilbase"
        @rumap["РУД Р"] = "orebase"
        @rumap["УРА Р"] = "urabase"
        @rumap["АЛМ Р"] = "diabase"
        @rumap["ЗОЛ В"] = "goldmax"
        @rumap["НЕФ В"] = "oilmax"
        @rumap["РУД В"] = "oremax"
        @rumap["УРА В"] = "uramax"
        @rumap["АЛМ В"] = "diamax"
        @rumap["ИНД О"] = "eduindex"
        @rumap["ИНД В"] = "milindex"
        @rumap["ИНД М"] = "medindex"
        @rumap["ИНД Р"] = "devindex"
      end

      def parse(mechanizedpage)
        colnames = Array.new
        data = Array.new

        # Get column names first
        mechanizedpage.css('th').each do |col|
          colnames << col.text.gsub(/[[:space:]]/, ' ').strip
        end

        # Map actual values
        mechanizedpage.css('tr').each do |row|
          rowdata = Hash.new
          colidx = 0
 
          row.search('td').each do |col|
            colname = colnames.at(colidx)
            coldata = col.text.gsub(/[[:space:]]/, ' ').strip

            if @rumap.has_key?(colname)
              colnamet = @rumap[colname]
              
              if colnamet == "isautonomy"
                rowdata[colnamet] = @rumap[coldata]
              elsif colnamet == "name"
                rowdata["runame"] = coldata[/^(.*?),/, 1]
                rowdata["regionid"] = coldata.split(':').last.strip.to_i
              else
                rowdata[colnamet] = coldata
              end
              
              if colnamet == "devindex"
                break
              end
            end
 
            colidx += 1 
          end

          data << rowdata
        end

        return data
      end

    end
  end
end
