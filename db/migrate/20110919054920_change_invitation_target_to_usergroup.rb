class ChangeInvitationTargetToUsergroup < ActiveRecord::Migration
  def change
    rename_column :invitations, :target_id, :user_group_id
    rename_column :invitations, :target_type, :user_group_type
  end

end
