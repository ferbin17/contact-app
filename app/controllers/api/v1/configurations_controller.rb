class Api::V1::ConfigurationsController < ApplicationController
  
  def change_locale
    render json: { success: match_locale_and_set_locale, locale: I18n.locale }
  end
  
  private
    def configuration_params
      params.require(:configuration).permit(:locale)      
    end
    
    def match_locale_and_set_locale
      changed = false
      if I18n.available_locales.map(&:to_s).include?(configuration_params[:locale])
        unless cookies[:locale] == configuration_params[:locale]
          I18n.locale = cookies[:locale] = configuration_params[:locale] 
          changed = true
        end
        changed
      end
    end
end
