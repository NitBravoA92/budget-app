module ApplicationHelper
  def generate_arrow
    '<svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 -960 960 960" width="30"><path fill="white" d="m313-440 224 224-57 56-320-320 320-320 57 56-224 224h487v80H313Z"/></svg>'
  end

  def generate_navigation
    content = ''
    return if controller_name == 'welcome_pages'
    sign_out = user_signed_in? ? "#{link_to 'Sign Out', destroy_user_session_path, data: { turbo_method: :delete } }" : ''

    navbar = "<nav class='w-full bg-main-700'>
      <div class='container mx-auto py-4 px-4'>
        <ul class='w-full flex justify-between items-center gap-2'>
          <li class='w-1/6 text-white'>
            #{generate_navbar_data['back'] unless generate_navbar_data.nil?}
          </li>
          <li class='w-3/6 text-white text-semibold uppercase text-center text-xl'>
            #{generate_navbar_data['title'] unless generate_navbar_data.nil?}
          </li>
          <li class='w-2/6 text-white text-right text-lg'>#{sign_out}</li>
        </ul>
      </div>
    </nav>"
    content << navbar
    content.html_safe
  end

  def generate_navbar_data
    icon = "#{generate_arrow}".html_safe
    sessions = generate_devise_links(icon)
    generals = generate_general_links(icon)
    header = sessions.merge(generals)
    header[controller_name][action_name]
  end

  def generate_devise_links(icon)
    session_data = {
      'sessions' => {
        'new' => {
          'back' => "#{link_to icon, root_path }",
          'title' => 'LOG IN'
        }
      },
      'passwords' => {
        'new' => {
          'back' => "#{link_to icon, new_user_session_path }",
          'title' => 'FORGOT YOUR PASSWORD'
        },
        'edit' => {
          'back' => "#{link_to icon, new_user_session_path }",
          'title' => 'CHANGE YOUR PASSWORD'
        }
      },
      'confirmations' => {
        'new' => {
          'back' => "#{link_to icon, new_user_session_path }",
          'title' => 'RESEND CONFIRMATION'
        }
      },
      'registrations' => {
        'new' => {
          'back' => "#{link_to icon, root_path }",
          'title' => 'SIGN UP'
        }
      },
    }
  end

  def generate_general_links(icon)
    authenticated_data = {
      'categories' => {
        'index' => {
          'back' => "#{link_to icon, categories_path }",
          'title' => 'CATEGORIES'
        },
        'new' => {
          'back' => "#{link_to icon, categories_path }",
          'title' => 'NEW CATEGORY'
        }
      },
      'payments' => {
        'index' => {
          'back' => "#{link_to icon, categories_path }",
          'title' => 'TRANSACTIONS'
        },
        'new' => {
          'back' => "#{link_to icon, :back }",
          'title' => 'NEW TRANSACTION'
        }
      },
    }
  end
end
