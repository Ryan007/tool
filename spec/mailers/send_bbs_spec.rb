require "spec_helper"

describe SendBbs do
  describe "core_customer_mailer" do
    let(:mail) { SendBbs.core_customer_mailer }

    it "renders the headers" do
      mail.subject.should eq("Core customer mailer")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
