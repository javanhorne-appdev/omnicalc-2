Rails.application.routes.draw do

  get("/text", { :controller => "magic", :action => "new_text"})
  
  post("/process_text", { :controller => "magic", :action => "process_text"})
  

  


  # =============================

  root("vision#homepage")

  get("/vision/:detector", { :controller => "vision", :action => "form" })
  post("/vision/:detector", { :controller => "vision", :action => "magic" })

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
