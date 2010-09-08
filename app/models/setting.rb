class Setting < ActiveRecord::Base
  
  protected
    
  def self.method_missing method_name
    begin
      Setting.find(:first, :conditions => ["settings.`key` = ?", method_name.to_s]).value
    rescue NoMethodError
      nil
    rescue 
      fail "属性不存在"
    end
  end
end