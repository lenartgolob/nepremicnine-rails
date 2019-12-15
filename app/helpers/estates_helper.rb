module EstatesHelper
    def show_estate_buttons(estate)
        html = '<td>'
        html += link_to 'Show', estate
        html += '</td>'
        if estate.user == current_user
          html += '<td>'
          html += link_to 'Edit', edit_estate_path(estate)
          html += '</td>'
          html += '<td>'
          html += link_to 'Destroy', estate, method: :delete, data: { confirm: 'Are you sure?' }
          html += '</td>'
        end
    
        html.html_safe
      end
    
      def show_edit_button(estate)
        link_to 'Edit', edit_estate_path(estate) if estate.user == current_user
      end
end
