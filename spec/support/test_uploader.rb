class TestUploader < CarrierWave::Uploader::Base
  include CurrentProcessor
  include CarrierWave::Meta

  def store_dir
    "tmp/store"
  end

  def cache_dir
    "tmp/cache"
  end

  process :store_meta => [{sha1sum: true}]
  version :version do
    process :resize_to_fill => [200, 200]
    process :store_meta
  end
end