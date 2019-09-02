Hyperstack.cancel_import 'react/react-source-browser' # bring your own React and ReactRouter via Yarn/Webpacker
Hyperstack.import 'hyperstack/hotloader', client_only: true if Rails.env.development?
# set the component base class

Hyperstack.component_base_class = 'HyperComponent' # i.e. 'ApplicationComponent'

# prerendering is default :off, you should wait until your
# application is relatively well debugged before turning on.

Hyperstack.prerendering = :off # or :on

# transport controls how push (websocket) communications are
# implemented.  The default is :action_cable.
# Other possibilities are :pusher (see www.pusher.com) or
# :simple_poller which is sometimes handy during system debug.

Hyperstack.transport = :action_cable # or :none, :pusher,  :simple_poller

# add this line if you need jQuery AND ARE NOT USING WEBPACK
# Hyperstack.import 'hyperstack/component/jquery', client_only: true

# change definition of on_error to control how errors such as validation
# exceptions are reported on the server
module Hyperstack
  def self.on_error(operation, err, params, formatted_error_message)
    ::Rails.logger.debug(
      "#{formatted_error_message}\n\n" +
      Pastel.new.red(
        'To further investigate you may want to add a debugging '\
        'breakpoint to the on_error method in config/initializers/hyperstack.rb'
      )
    )
  end
end if Rails.env.development?
