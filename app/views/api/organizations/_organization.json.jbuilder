# frozen_string_literal: true

json.key_format! camelize: :lower
json.deep_format_keys!

json.organization organization.as_json
json.users organization.users if usersInfo
