class AddUpdateRole < ActiveRecord::Migration
  def change
  	controller = ControllerAction.where(name: 'users', controller_action_id: nil).first
    action = controller.controller_actions.where(name: 'update').first
    ControllerAction.create(:name => "update role_id", :controller_action_id => action.id)
    ControllerAction.create(:name => "update password", :controller_action_id => action.id)
    ControllerAction.create(:name => "update other users", :controller_action_id => action.id)
    ControllerAction.create(:name => "update itself", :controller_action_id => action.id)
    admin = Role.find(1);
    client = Role.find(2);

    admin.controller_actions << action.controller_actions.where(name: 'update role_id').first
    admin.controller_actions << action.controller_actions.where(name: 'update password').first
    admin.controller_actions << action.controller_actions.where(name: 'update other users').first
    admin.controller_actions << action.controller_actions.where(name: 'update itself').first

    client.controller_actions << action.controller_actions.where(name: 'update itself').first
  end
end
