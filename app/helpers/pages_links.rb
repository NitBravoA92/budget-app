module PagesLinks
  def generate_devise_links(icon)
    {
      'sessions' => {
        'new' => {
          'back' => link_to(icon, root_path).to_s,
          'title' => 'LOG IN',
          'right' => 'Log in'
        }
      },
      'passwords' => {
        'new' => {
          'back' => link_to(icon, new_user_session_path).to_s,
          'title' => 'FORGOT YOUR PASSWORD',
          'right' => 'Reset'
        },
        'edit' => {
          'back' => link_to(icon, new_user_session_path).to_s,
          'title' => 'CHANGE YOUR PASSWORD',
          'right' => 'Save'
        }
      },
      'confirmations' => {
        'new' => {
          'back' => link_to(icon, new_user_session_path).to_s,
          'title' => 'RESEND CONFIRMATION',
          'right' => 'Resent'
        }
      },
      'registrations' => {
        'new' => {
          'back' => link_to(icon, root_path).to_s,
          'title' => 'SIGN UP',
          'right' => 'Next'
        }
      }
    }
  end

  def generate_general_links(icon)
    {
      'categories' => {
        'index' => {
          'back' => '',
          'title' => 'CATEGORIES'
        },
        'new' => {
          'back' => link_to(icon, categories_path).to_s,
          'title' => 'ADD CATEGORY'
        }
      },
      'payments' => {
        'index' => {
          'back' => link_to(icon, categories_path).to_s,
          'title' => 'PAYMENTS'
        },
        'new' => {
          'back' => link_to(icon, :back).to_s,
          'title' => 'ADD PAYMENT'
        }
      }
    }
  end
end
