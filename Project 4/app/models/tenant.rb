class Tenant
  def initialize user
    @user = user
  end

  def restaurants
    owner? ? Restaurant.all.all : Restaurant.where('organization_id = ?', user.organizations.first.id).all
  end

  private

    def admin?
      @user.has_role? "admin"
    end

    def owner?
      @user.has_role? "owner"
    end
end