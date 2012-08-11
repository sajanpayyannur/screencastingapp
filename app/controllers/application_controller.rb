class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_marks_and_models
  before_filter :force_change_email_if_needed
  before_filter :completed_registration, if: "user_signed_in?"
  before_filter :load_content_blocks
  before_filter :load_menu_entries
  before_filter :load_banners
  before_filter :load_logo
  before_filter :load_links
  before_filter :mailer_set_url_options

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

    def force_change_email_if_needed
      if user_signed_in? && current_user.needs_update_email?
        unless controller_name == "registrations"
          redirect_to edit_user_registration_path, alert: 'Please update your email!'
        end
      end
    end

    # User should pay a fee in order to complete registration
    def completed_registration
      if user_signed_in?
        unless current_user.has_role?('admin') || request.fullpath =~ /sign_out/ || current_user.needs_update_email?
          redirect_to new_setup_fee_payment_payments_url unless current_user.is_setup_fee_paid?
        end
      end
    end

    def load_marks_and_models
      @marks_list = Auction.select('mark').uniq
      @models_list = Auction.select('model').uniq
    end

    def load_content_blocks
      @sidebar_block = Admin::Page.where(slug: 'sidebar', publish: true).first
      @footer_block = Admin::Page.where(slug: 'footer', publish: true).first
      @footer_rights_block = Admin::Page.where(slug: 'footer-rights', publish: true).first
      @between_slide = Admin::Page.where(slug: 'between-slide-6-list', publish: true).first
      @banner_one = Admin::Page.where(slug: 'banner-one', publish: true).first
      @banner_two = Admin::Page.where(slug: 'banner-two', publish: true).first
    end

    def load_menu_entries
      @menu_entry1 = Admin::MenuEntry.find_by_order(1)
      @menu_entry2 = Admin::MenuEntry.find_by_order(2)
      @menu_entry3 = Admin::MenuEntry.find_by_order(3)
      @menu_entry4 = Admin::MenuEntry.find_by_order(4)
      @menu_entry5 = Admin::MenuEntry.find_by_order(5)
      @menu_entry6 = Admin::MenuEntry.find_by_order(6)
    end

    def load_banners
      @banner_header = Banner.header
      @banner_under_menu = Banner.under_menu
    end

    def load_logo
      @logo = Admin::Logo.last
    end

    def load_links
      @links = Admin::Link.all
    end

    def mailer_set_url_options
      ActionMailer::Base.default_url_options[:host] = request.host_with_port
    end
end
