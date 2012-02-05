require 'spec_helper'

describe User do
  subject { Factory :user }

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should allow_value("valid@email.com").for(:email) }
  it { should allow_value("some.user@email.com").for(:email) }
  it { should allow_value("user@subdomain.email.com").for(:email) }

  it { should_not allow_value("asdf").for(:email) }

  it { should validate_confirmation_of :password }
  it { should ensure_length_of(:password).is_at_least(6).is_at_most(15)}

  it { should_not allow_mass_assignment_of :user }
  it { should_not allow_mass_assignment_of :password }
  it { should_not allow_mass_assignment_of :password_confirmation }
  it { should allow_mass_assignment_of :remember_me }
end
