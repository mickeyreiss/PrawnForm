require 'rubygems'
require 'bundler/setup'
require 'prawn_form'

include PrawnForm::DSL

@payment_request = {
  :organization_name => "AB Tech",
  :submitter_name => "Joe Burgess",
  :authorized_signer => "Joseph Burgess",
  :date => "2/2/12",
  :org => true,
  :org_amount => 21003.88,
  :gift => true,
  :gift_amount => 123.01,
  :andrew_id => "jmburges",
  :payee_name => "Five Guys",
  :payee_address_line_1 => "123 Oakland Ave",
  :payee_address_line_2 => "Pittsburgh, PA 15232",
  :payee_address_line_3 => "Address line 3",
  :business_contact => "Business Contact",
  :business_email => "email",
  :business_phone => "phone",
  :business_fax => "fax",
  :purchase_details => "The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog ",
  :due_date => "3/1/2012",
  :amount_due => 213
}

Prawn::Document.generate "output.pdf", :template => "paymentrequest2011-12.pdf" do |pdf|
  pdf.form :data => @payment_request do |f|
    #SUBMITTER
    f.organization_name "130x463"
    f.submitter_name "128x421"
    f.authorized_signer "119x394"
    f.date "390x491"
    f.org "430x465", :type => :boolean
    f.org_amount "480x463"
    f.gift "430x441" #:type => :boolean
    f.gift_amount "480x439"
    f.andrew_id "413x422"

    #PAYEE
    f.payee_name "70x341"
    f.payee_address_line_1 "111x308"
    f.payee_address_line_2 "111x284"
    f.payee_address_line_3 "111x258"

    f.business_contact "185x229"
    f.business_email "420x229"
    f.business_phone "37x207"
    f.business_fax "351x207"

    # PURCHASE DETAILS
    f.purchase_details "0x143", :type => :multiline, :height => 55.5
    f.due_date "134x76"
    f.amount_due "81x36"
  end
end
