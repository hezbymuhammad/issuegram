describe Issuegram::Config do
  context 'default values' do
    it '#api_url' do
      expect(Issuegram.config.api_url).to eq('https://api.github.com')
    end

    it '#connection' do
      expect(Issuegram.config.connection.class).to eq(Faraday::Connection)
    end

    it '#per_page' do
      expect(Issuegram.config.per_page).to eq(100)
    end

    it '#state' do
      expect(Issuegram.config.state).to eq(:all)
    end
  end

  context 'using regular assigner' do
    before do
      Issuegram.config do
	config.api_url = 'https://api.example.com'
      end
    end

    it '#api_url' do
      expect(Issuegram.config.api_url).to eq('https://api.example.com')
    end
  end

  context 'use file config' do
    before do
      Issuegram.config do
        config.load_config('./spec/config/config.yml')
      end
    end

    it '#per_page' do
      expect(Issuegram.config.per_page).to eq(10)
    end
  end
end
