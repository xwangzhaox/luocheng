module ApplicationHelper
  def get_menu
    Menu.all
  end

  def get_partner
    Article.where(en_title: "partner").first
  end

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge renderer: WillPaginate::ActionView::BootstrapLinkRenderer
    end
    super *[collection_or_options, options].compact
  end
end
