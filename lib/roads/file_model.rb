require 'multi_json'

module Roads
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename

        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      ## Class Methods ##
      def self.find(id)
        begin
          FileModel.new("db/quotes/#{id}.json")
        rescue
          return nil
        end
      end

      def self.all
        files = Dir['db/quotes/*.json']
        files.map { |f| FileModel.new(f) }
      end

      def self.create(attrs)
        hash = {}
        hash["submitter"] = attrs[:submitter] || ""
        hash["quote"] = attrs[:quote] || ""
        hash["attribution"] = attrs[:attribution] || ""

        file_names = Dir["db/quotes/*.json"].map { |f| File.split(f)[-1] }
        highest = file_names.map { |b| b.to_i }.max
        id = highest + 1

        File.write(
          "db/quotes/#{id}.json",
          MultiJson.dump(hash, pretty: true)
        )

        FileModel.new("db/quotes/#{id}.json")
      end
    end
  end
end
