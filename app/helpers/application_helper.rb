# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def feed_links
    links_html = []
    
    # add category RSS feed
    if @category
      links_html << auto_discovery_link_tag(:atom, category_url(@category, :format => "atom"), :title => "Jobs for #{@category.name}")
    end

    # add site RSS feed
    links_html << auto_discovery_link_tag(:atom, jobs_url(:format => "atom"), :title => "All Jobs")
    
    # join html and return
    return links_html.join("\n")
  end
  
  def error_message_for(record, attribute, error_msg = nil)
    if record and record.respond_to? :errors
      error_list = [record.errors.on(attribute)].flatten
      return content_tag(:div, error_msg || error_list.join(", "), :class => "error-message")
    end
  end
  
  def display_notice    
    page.insert_html :after, 'footer', :partial => 'layouts/admin_flash_boxes'
  end
  
  # Additional View Helpers
  
  def bull
    "<li>&bull;</li>"
  end
  
  def nbsp
    "&nbsp;"
  end
  
  def add_class_if(condition, css_class)
    if condition
      {:class => css_class}
    else
      {}
    end
  end
  
  
  def link_to_image(image_path, label, url, options={})
    link_to(image_tag(image_path, :class => "vert-middle"), url, options) +
    nbsp +
    link_to(label, url, options)
  end
end
