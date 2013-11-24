module UI
  module Photoport
    module UploadPanel
      include Capybara::DSL
      def show_file_input(visible=true)
        display = visible ? 'inline' : 'none'
        page.execute_script <<-JS
          var file_input = document.querySelector('.photoport-cms-upload-panel form input[type="file"]');
          file_input.style.display = "#{display}";
        JS
      end
    end
    def upload_panel
      find(:css, '.photoport-cms-upload-panel').extend(UploadPanel)
    end
  end
end