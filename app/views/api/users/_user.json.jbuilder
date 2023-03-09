# frozen_string_literal: true

json.key_format! camelize: :lower
json.deep_format_keys!

json.user user.as_json
json.organization do
  json.partial! 'api/organizations/organization', organization: user.organization
end
