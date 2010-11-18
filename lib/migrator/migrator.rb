module JobListingJsonModels
  class Migrator
    def self.migrate(json_hash, version)
      path = File.expand_path(File.dirname(__FILE__) + '/..')

      Dir[File.join(path, 'job_listing_json_models', 'migrations', '*.rb')].each do |migration_file|
        require migration_file

        filename = File.basename(migration_file, ".rb")

        chunks   = filename.split(/^([0-9])+_/)
        file_version = chunks[1].to_i
        class_name   = chunks[2]

        klass = ActiveSupport::Inflector.classify(class_name)
        klass = ActiveSupport::Inflector.constantize(klass)

        json_hash = klass.migrate(json_hash)

        break if file_version == version
      end

      json_hash
    end
  end
end
