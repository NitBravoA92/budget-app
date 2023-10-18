module ApplicationHelper
  def generate_general_links
    btn_back = 'B'
    authenticated_data = {
      'categories' => {
        'index' => {
          'back' => "#{link_to btn_back, categories_path }",
          'title' => 'CATEGORIES'
        },
        'new' => {
          'back' => "#{link_to btn_back, categories_path }",
          'title' => 'NEW CATEGORY'
        }
      },
      'payments' => {
        'index' => {
          'back' => "#{link_to btn_back, categories_path }",
          'title' => 'TRANSACTIONS'
        },
        'new' => {
          'back' => "#{link_to btn_back, categories_path }",
          'title' => 'NEW TRANSACTION'
        }
      },
    }
  end
end
