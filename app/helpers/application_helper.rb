module ApplicationHelper
  def create_nav_item(name, url)
    #if the controller name is equal to the page it is on, then the link will be active.
    is_active = (name.downcase == controller.controller_name) 
    #the below reads: if is_active = true (represented by '?'), then make the link active, else (represented by the ':' make the link "") - ternary operator 
    link = "<li class='#{is_active ? "active" : ""}'>"+ link_to(name, url)+"</li>"
    link.html_safe #hey rails, this link is safe
  end
end
