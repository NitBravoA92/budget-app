module ApplicationHelper
  def generate_navigation
    content = ''
    return if controller_name == 'welcome_pages'
    sign_out = user_signed_in? ? "#{link_to 'Sign Out', destroy_user_session_path, data: { turbo_method: :delete } }" : ''

    navbar = "<nav class='w-full bg-main-700'>
      <div class='container mx-auto py-6 px-4'>
        <ul class='w-full flex justify-between items-center gap-2 text-lg'>
          <li class='w-1/6 text-white'>
            #{generate_navbar_data['back'] unless generate_navbar_data.nil?}
          </li>
          <li class='w-3/6 text-white text-semibold uppercase text-center'>
            #{generate_navbar_data['title'] unless generate_navbar_data.nil?}
          </li>
          <li class='w-2/6 text-white text-right'>#{sign_out}</li>
        </ul>
      </div>
    </nav>"
    content << navbar
    content.html_safe
  end

  def generate_navbar_data
    sessions = generate_devise_links
    generals = generate_general_links
    header = sessions.merge(generals)
    header[controller_name][action_name]
  end

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
