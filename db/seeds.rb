# frozen_string_literal: true
require 'factory_bot_rails'

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
AdminUser.create!(email: 'nomad@nomad.com', password: 'password') if Rails.env.development?
Setting.create_or_find_by!(key: 'min_version', value: '0.0')
