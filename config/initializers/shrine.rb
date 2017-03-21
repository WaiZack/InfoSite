require "shrine"
require "shrine/storage/s3"

s3_options = {
    access_key_id:     'AKIAIDGH5CPGVWNNUKBA',
    secret_access_key: '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',
    region:            'ap-southeast-1',
    bucket:            'elasticbeanstalk-ap-southeast-1-354987281312',
}

Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :backgrounding
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type