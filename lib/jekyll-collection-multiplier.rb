module Jekyll

  class Collection
    def docs=(docs)
      @docs = docs
    end
  end

  class Document
    alias :old_cleaned_relative_path :cleaned_relative_path

    def cleaned_relative_path
      og_rp = old_cleaned_relative_path
      og_rp.sub(%r{\A_[^/]+/}, '')
    end

  end


  class CollectionMultiplier < Generator
    def generate(site)
      return if site.config['collection_multiplier'].nil?

      pairs = []

      site.config['collection_multiplier'].each do |multiplier|
        site.collections.each_pair do |collection_name, collection|
          next unless multiplier['type'] == collection_name
          renamed = multiplier['rename']
          duped_collection = Jekyll::Collection.new(site, renamed)
          duped_collection.docs = collection.docs.dup.map do |doc|
            duped_doc = Jekyll::Document.new(doc.path, { :site => site, :collection => duped_collection })
            duped_doc.content = doc.content
            duped_doc.read
            duped_doc
          end

          pairs << { renamed => duped_collection }
        end
      end
      pairs.each do |pair|
        site.collections[pair.keys.first] = pair.values.first
      end
    end
  end
end
