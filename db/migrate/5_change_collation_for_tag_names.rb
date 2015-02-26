# This migration is added to circumvent issue #623 and have special characters
# work properly
class ChangeCollationForTagNames < ActiveRecord::Migration

  def self.up
    if ActsAsTaggableOn::Utils.using_mysql?
      execute("ALTER TABLE tags MODIFY name varchar(255) CHARACTER SET utf8 COLLATE utf8_bin;")
    end
  end

  def self.down
    if ActsAsTaggableOn::Utils.using_mysql?
      execute("ALTER TABLE tags MODIFY name varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci;")
    end
  end

end
