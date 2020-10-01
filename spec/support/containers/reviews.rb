module Sections
  class Reviews < SitePrism::Section
    elements :reviews, 'div.general-message-wrap.divider-lg'
    elements :reviewers_names, '.general-message-name'
    elements :reviewers_messages, '.reviwer-message'
  end
end
