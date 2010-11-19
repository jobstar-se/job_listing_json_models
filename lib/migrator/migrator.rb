module JobListingJsonModels
  class Migrator
    def self.migrate(json_hash, from_version, to_version)
      path = File.expand_path(File.dirname(__FILE__) + '/..')

      Dir[File.join(path, 'job_listing_json_models', 'migrations', '*.rb')].each do |migration_file|
        filename = File.basename(migration_file, ".rb")

        chunks   = filename.split(/^([0-9])+_/)
        file_version = chunks[1].to_i
        class_name   = chunks[2]

        next if file_version < from_version

        require migration_file

        klass = ActiveSupport::Inflector.classify(class_name)
        klass = ActiveSupport::Inflector.constantize(klass)

        json_hash = klass.migrate(json_hash)

        break if file_version == to_version
      end

      json_hash
    end

    def self.latest_version
      unless @latest_version
        path      = File.expand_path(File.dirname(__FILE__) + '/..')
        last_file = Dir[File.join(path, 'job_listing_json_models', 'migrations', '*.rb')].last
        filename  = File.basename(last_file, ".rb").split(/^([0-9])+_/)

        @latest_version = filename[1].to_i
      end

      @latest_version
    end
  end
end
