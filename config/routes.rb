Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "application", :action => "home" })
  get("/forex", { :controller => "application", :action => "forex" })
  get("/forex/:conversion_1", { :controller => "application", :action => "conversion_1" })
  get("/forex/:conversion_1/:conversion_2", { :controller => "application", :action => "conversion_2" })

  get("/covid", { :controller => "application", :action => "covid" })
end
