describe ManageIQ::Providers::CloudManager::Provision::Configuration do
  context 'Userdata payload checks' do
    it "script is not encoded" do
      template  = FactoryGirl.build(:customization_template, :script => "#cloud-init")
      provision = ManageIQ::Providers::CloudManager::Provision.new
      allow(provision).to receive(:customization_template).and_return(template)
      allow(provision).to receive(:post_install_callback_url).and_return("")
      expect(provision.userdata_payload).to eq(template.script)
    end
  end
end
