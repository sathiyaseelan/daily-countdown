require 'rest-client'
class PagesController < ApplicationController
    
    
    def home
        @bg_image_url = get_image_url
    end


    private
    
    def get_image_url
        response = RestClient.get 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=12'
        if response.code == 200
            response_json = JSON.parse(response.body)
            puts response_json
            # 'http://www.bing.com/az/hprichbg/rb/Paraglider_EN-US7985350118_1920x1080.jpg'
            random = Random.new
            img_index = random.rand(0...8)
            return "http://www.bing.com" << response_json["images"][img_index]["url"]
        else
             return ActionController::Base.helpers.asset_path('timer_bg.jpg')
        end
    end
end