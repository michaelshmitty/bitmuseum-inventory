# NOTE(m): Don't destroy existing files when uploading additional files.
Rails.application.config.active_storage.replace_on_assign_to_many = false
