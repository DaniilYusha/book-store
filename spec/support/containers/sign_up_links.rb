module Sections
  class SignUpLinks < SitePrism::Section
    element :log_in_link, '.log_in>a'
    element :confirm_account_link, '.confirm>a'
  end
end
