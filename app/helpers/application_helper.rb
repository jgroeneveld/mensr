# coding: utf-8

module ApplicationHelper
  def flash_message_exists?
    !flash[:notice].blank? || !flash[:alert].blank? || !flash[:error].blank?
  end

  def show_flashes
    flashes_string = "$('no_js_flashes').hide();"
    flash.each do |key, value|
      flashes_string << " show_flash(\"#{value}\", \"#{key}\");"
    end

    flashes_string
  end

  def print_seperator
    raw "<center><span style='display: inline; font-size: 120px; color: #cdd4ed;'>…</span></center>"
  end
end
