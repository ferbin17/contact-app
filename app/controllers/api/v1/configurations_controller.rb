class Api::V1::ConfigurationsController < ApplicationController
  
  # Changes locale and responds with cahnge status
  def change_locale
    render json: { success: match_locale_and_set_locale, locale: I18n.locale }
  end
  
  private
    # permit configuration params
    def configuration_params
      params.require(:configuration).permit(:locale)      
    end
    
    # Match locale code passed as to one's available and changes only if it is different
    # from the one in cookies
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
