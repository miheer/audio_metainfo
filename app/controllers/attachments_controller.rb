class AttachmentsController < ApplicationController
 
  def new
    @attachment = Attachment.new
  end

  def create
    
    respond_to do |format|
      
      begin
        @attachment_url = Attachment.create(params[:attachment])
        require 'taglib'

        # Load a file
        TagLib::FileRef.open("#{Rails.root.to_s+"/public/"+@attachment_url.audio_file.url(:original, timestamp: false)}") do |fileref|
          unless fileref.null?

            tag = fileref.tag

            @tag_title = tag.title
            @tag_artist = tag.artist 
            @tag_album = tag.album   
            @tag_year = tag.year    
            @tag_track = tag.track   
            @tag_genre = tag.genre   
            @tag_comment = tag.comment

            properties = fileref.audio_properties
           
            @length = properties.length
            @bit_rate = properties.bitrate
            @no_of_channels = properties.channels
            @sample_rate = properties.sample_rate
          end #unless end
        end  # File is automatically closed at block end
    
        format.js
      rescue Exception => e

      end #begin end
    end
  end
end
