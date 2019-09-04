class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :with_tenant, -> (tenant) { where(user_id: tenant.id) }
end
