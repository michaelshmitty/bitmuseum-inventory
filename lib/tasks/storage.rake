namespace :storage do
  task reupload: :environment do
    [Item].each do |clazz|
      collection = clazz.with_attached_images

      collection.find_each do |item|
        next unless item.images.any?
        item.images.each do |image|
          next unless image
          puts image.blob.filename
          image.blob.open do |f|
            item.images.attach(io: f, filename: image.blob.filename)
          end
        end
        print "."
      end

      puts
    end
  end
end
