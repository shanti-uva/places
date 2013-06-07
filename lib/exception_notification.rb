ExceptionNotification::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "[#{ts 'app.short'} Error] ",
    :sender_address => "#{ts 'app.short'} Application Error <do-not-respond@#{APP_DOMAIN}>",
    :exception_recipients => %w(logs@gaugeus.com tombenner.logs@gmail.com)