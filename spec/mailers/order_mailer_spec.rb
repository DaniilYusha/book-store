RSpec.describe OrderMailer, type: :mailer do
  describe '.thank_for_order' do
    let(:email) { FFaker::Internet.free_email }
    let(:mail) { described_class.thank_for_order(email) }

    it 'has email recipient' do
      expect(mail.to).to eq([email])
    end

    it 'has email sender' do
      expect(mail.from).to eq([described_class::MAIL_FROM])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(I18n.t('checkout.confirm.thank_for_order'))
    end
  end
end
