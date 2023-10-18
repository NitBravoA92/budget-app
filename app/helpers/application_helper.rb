module ApplicationHelper
  def generate_devise_links
    btn_back = 'B'
    session_data = {
      'sessions' => {
        'new' => {
          'back' => "#{link_to btn_back, root_path }",
          'title' => 'LOG IN'
        }
      },
      'passwords' => {
        'new' => {
          'back' => "#{link_to btn_back, new_user_session_path }",
          'title' => 'FORGOT YOUR PASSWORD'
        },
        'edit' => {
          'back' => "#{link_to btn_back, new_user_session_path }",
          'title' => 'CHANGE YOUR PASSWORD'
        }
      },
      'confirmations' => {
        'new' => {
          'back' => "#{link_to btn_back, new_user_session_path }",
          'title' => 'RESEND CONFIRMATION'
        }
      },
      'registrations' => {
        'new' => {
          'back' => "#{link_to btn_back, root_path }",
          'title' => 'SIGN UP'
        }
      },
    }
  end

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
