class ApplicationController < ActionController::Base
  before_action :set_locale
  
  private
    def set_locale
      I18n.locale = match_locale || I18n.default_locale
    end
    
    def match_locale
      I18n.available_locales.map(&:to_s).include?(cookies[:locale]) ? cookies[:locale] : nil
    end
end
