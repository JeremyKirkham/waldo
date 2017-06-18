# Be sure to restart your server when you modify this file.
uri = URI.parse(ENV["REDIS_URL"] || "redis://redis:6379" )
Rails.application.config.session_store :redis_store, servers: {host: uri.host,
                                                               port: uri.port,
                                                               db: 0,
                                                               namespace: "session"
                                                             },
                                                             expires_in: 90.minutes
