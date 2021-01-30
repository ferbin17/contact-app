class ApplicationController < ActionController::Base
  before_action :set_locale
  rescue_from ActionController::RoutingError, with: :not_found
  
  # Every route error will be handled by below function and redirected to root
  def not_found
    respond_to do |format|
      format.html { redirect_to :root }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end
  
  private
    # Locale before every request
    def set_locale
      I18n.locale = match_locale || I18n.default_locale
    end
    
    # Match locale code in cookies to one's available
    def match_locale
      I18n.available_locales.map(&:to_s).include?(cookies[:locale]) ? cookies[:locale] : nil
    end
end
