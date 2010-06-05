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
  
  # http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm
  # http://napkin.highgroove.com/articles/2006/10/03/mini-file-uploads
  
  
  def self.save_to_directory(upload)
    file = upload['newsletter']
    name =  file.original_filename.sub(/[^\w\.\-]/,'_') 
    directory = "public/data/newsletters"
    # create the file path
    path = File.join(directory, name)
    # write the file
    if file.is_a? Tempfile
      FileUtils.cp(file.path, path)
    elsif file.is_a? StringIO
      File.open(path, "wb") { |f| f.write(file.read) }
    end
  end 
  
end
