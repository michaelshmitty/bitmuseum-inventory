namespace :inventory do
  desc "Migrate storage blobs from S3 to local storage"
  task migrate_storage: :environment do
    configs = Rails.configuration.active_storage.service_configurations
    from_service = ActiveStorage::Service.configure :amazon, configs
    to_service   = ActiveStorage::Service.configure :local, configs

    ActiveStorage::Blob.service = from_service

    puts "#{ActiveStorage::Blob.count} Blobs to go..."
    ActiveStorage::Blob.find_each do |blob|
      print '.'
      blob.open do |tf|
        checksum = blob.checksum
        to_service.upload(blob.key, tf, checksum: checksum)
      end
    end
  end
end
