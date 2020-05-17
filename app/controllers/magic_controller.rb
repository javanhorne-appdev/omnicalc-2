class MagicController < ApplicationController
  def new_text
    render({ :template => "magic/text.html.erb"})
  end

  def process_text

    @params = params
    
    require "google/cloud/vision"
  
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    
    uploaded_data = params.fetch("user_upload")

    a_file = File.open(uploaded_data)

    vision_api_results = image_annotator.text_detection({ :image => a_file })

    @responses = vision_api_results.responses

    @first_result = vision_api_results.responses.at(0)
    
    render({ :template => "magic/process_text.html.erb"})
  end

end