require 'activesupport'

class Newsletter < ActiveRecord::Base
  
  def newsletter=(newsletter_field)
    self.name = base_part_of(newsletter_field.original_filename)
    #  self.content_type = newsletter_field.content_type.chomp
    self.data = newsletter_field.read
  end
  
  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end
  
  def str_month
    Date::MONTHNAMES[month] 
  end

  
end
