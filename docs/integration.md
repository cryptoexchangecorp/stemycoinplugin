# Integration.

For Peatio stemycoin plugin integration you need to do the following steps:

## Image Build.

1. Add peatio-stemycoin gem into your Gemfile.plugin
```ruby
gem 'peatio-stemycoin', '~> 0.1.0'
```

2. Run `bundle install` for updating Gemfile.lock

3. Build custom Peatio [docker image with Stemycoin plugin](https://github.com/rubykube/peatio/blob/master/docs/plugins.md#build)

4. Push your image using `docker push`

5. Update your deployment to use image with peatio-stemycoin gem

## Peatio Configuration.

1. Create Stemycoin Blockchain [config example](../config/blockchains.yml).
    * No additional steps are needed

2. Create Stemycoin Currency [config example](../config/currencies.yml).
    * No additional steps are needed

3. Create Stemycoin Wallets [config example](../config/wallets.yml)(deposit and hot wallets are required).
    * No additional steps are needed
