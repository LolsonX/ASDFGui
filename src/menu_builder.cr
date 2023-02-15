require "gtk4"

class MenuBuilder
  getter menu_container : Gtk::Box
  getter button : Gtk::Button

  def initialize
    @menu_container = Gtk::Box.new
    @button = Gtk::Button.new_with_label("Test")
  end

  def build : MenuBuilder
    menu_container.orientation = Gtk::Orientation::Horizontal
    menu_container.append(button)
    self
  end

  private getter :app
end
