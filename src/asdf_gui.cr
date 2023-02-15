require "gtk4"
require "./menu_builder.cr"
require "./asdf.cr"
require "./asdf_parser.cr"


app = Gtk::Application.new("dev.asdf_gui", Gio::ApplicationFlags::None)
style = Gtk::CssProvider.new
style.load_from_path("#{__DIR__}/resources/style.css")
app.activate_signal.connect do
  app_window = Gtk::ApplicationWindow.new(app)
  app_window.titlebar = Gtk::HeaderBar.new
  app_window.title = "ASDF"
  Gtk::StyleContext.add_provider_for_display(app_window.display, style, 1000)
  main_container = Gtk::Box.new(orientation: Gtk::Orientation::Vertical)

  text_area = Gtk::TextView.new
  text_area.add_css_class("logger")
  text_scrolled_view = Gtk::ScrolledWindow.new
  text_scrolled_view.child = text_area
  main_container.append(text_scrolled_view)
  menu = MenuBuilder.new.build

  menu.button.clicked_signal.connect do
		ASDFParser.parse(:info, "TEST")
  end

  text_area.buffer.text = ASDF.info

  base_container = Gtk::Box.new
  base_container.orientation = Gtk::Orientation::Vertical
  base_container.append(menu.menu_container)
  base_container.append(main_container)

  app_window.child = base_container
  app_window.set_default_size(200, 200)
  app_window.present
end

exit(app.run)
