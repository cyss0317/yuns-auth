# frozen_string_literal: true

json.key_format! camelize: :lower
json.deep_format_keys!

# json.user user.as_json
json.user do
  json.createAt user.created_at
  json.updatedAt user.updated_at
  json.firstName user.first_name
  json.lastName user.last_name
  json.email user.email
  json.id user.id
  json.orgId user.org_id
  json.phone user.phone

end
json.organization do
  json.partial! 'api/organizations/organization', organization: user.organization, usersInfo: false
end
