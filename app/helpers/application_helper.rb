module ApplicationHelper
  def generate_arrow
    '<svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 -960 960 960" width="30"><path fill="white" d="m313-440 224 224-57 56-320-320 320-320 57 56-224 224h487v80H313Z"/></svg>'
  end

  def generate_general_navigation
    content = ''
    return if controller_name == 'welcome_pages'

    data = generate_navbar_data(true)

      navbar = "<nav class='w-full bg-main-700 fixed top-0 left-0 right-0 z-10'>
        <div class='container mx-auto py-4 px-4'>
          <ul class='w-full flex justify-between items-center gap-2'>
            <li class='w-1/6 text-white'>
              #{data['back'] unless data.nil?}
            </li>
            <li class='w-3/6 text-white text-semibold uppercase text-center text-xl'>
              #{data['title'] unless data.nil?}
            </li>
            <li class='w-2/6 text-white text-right text-lg'>
              #{link_to 'Sign Out', destroy_user_session_path, data: { turbo_method: :delete } }
            </li>
          </ul>
        </div>
      </nav>"
      content << navbar
    content.html_safe
  end

  def generate_auth_navigation(form)
    content = ''
    data = generate_navbar_data(false)

    navbar = "<nav class='w-full bg-main-700 fixed top-0 left-0 right-0 z-10'>
      <div class='container mx-auto py-4 px-4'>
        <ul class='w-full flex justify-between items-center gap-2'>
          <li class='w-1/6 text-white'>
            #{data['back'] unless data.nil?}
          </li>
          <li class='w-3/6 text-white text-semibold uppercase text-center text-xl'>
            #{data['title'] unless data.nil?}
          </li>
          <li class='w-2/6 text-white text-right text-lg'>
            #{ form.submit data['right'] }
          </li>
        </ul>
      </div>
    </nav>"
    content << navbar

    content.html_safe
  end

  def generate_navbar_data(is_auth)
    icon = "#{generate_arrow}".html_safe
    header = is_auth ? generate_general_links(icon) : generate_devise_links(icon)
    header[controller_name][action_name]
  end

  def generate_devise_links(icon)
    session_data = {
      'sessions' => {
        'new' => {
          'back' => "#{link_to icon, root_path }",
          'title' => 'LOG IN',
          'right' => 'Log in'
        }
      },
      'passwords' => {
        'new' => {
          'back' => "#{link_to icon, new_user_session_path }",
          'title' => 'FORGOT YOUR PASSWORD',
          'right' => 'Reset'
        },
        'edit' => {
          'back' => "#{link_to icon, new_user_session_path }",
          'title' => 'CHANGE YOUR PASSWORD',
          'right' => 'Save'
        }
      },
      'confirmations' => {
        'new' => {
          'back' => "#{link_to icon, new_user_session_path }",
          'title' => 'RESEND CONFIRMATION',
          'right' => 'Resent'
        }
      },
      'registrations' => {
        'new' => {
          'back' => "#{link_to icon, root_path }",
          'title' => 'SIGN UP',
          'right' => 'Next'
        }
      },
    }
  end

  def generate_general_links(icon)
    authenticated_data = {
      'categories' => {
        'index' => {
          'back' => "",
          'title' => 'CATEGORIES'
        },
        'new' => {
          'back' => "#{link_to icon, categories_path }",
          'title' => 'ADD CATEGORY'
        }
      },
      'payments' => {
        'index' => {
          'back' => "#{link_to icon, categories_path }",
          'title' => 'PAYMENTS'
        },
        'new' => {
          'back' => "#{link_to icon, :back }",
          'title' => 'ADD PAYMENT'
        }
      },
    }
  end
end
