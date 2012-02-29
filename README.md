Prawn based form filler

## DESCRIPTION
This Gem allows you to describe a fillable paper form using a simple DSL. Then, you can fill out the form by supplying the appropriate data.

This gem works with Prawn to generate PDFs, and it requires that the original form is in PDF format.

## BASIC USAGE
1. Define data
2. Define form
3. Generate pdf (using form as template) and call #form

```
@data = {
  #... => ...
}
include PrawnForm::DSL
Prawn::Document.generate :template => "form.pdf" do |pdf|
# OR: pdf = Prawn::Docuemnt.new

  pdf.form :data => @data do |f|
    # Form definition here!
  end
end

```

### Valid Types
text
multiline
boolean (checkbox)

### Attributes
- type

- lines (multiline only) array of y coordinates 
  - Only allows sizeof array lines lines if present
  - otherwise, wraps automatically based on width


## THE DSL (BY EXAMPLE)
```
pdf = Prawn::Document.new :template => "form.pdf"

pdf.form :data => @payment_request do |f|
  #SUBMITTER
  f.organization_name "167x305"
  f.submitter_name "162x347"
  f.authorized_signer "153x374"
  f.date "427x277"
  f.org "466x303", :type => :boolean
  f.org_amount "516x305"
  f.gift "466x326" #:type => :boolean
  f.gift_amount "516x328"
  f.andrew_id "446x348"

  #PAYEE
  f.payee_name "104x427"
  f.payee_address_line_1 "149x460"
  f.payee_address_line_2 "149x485"
  f.payee_address_line_3 "149x510"

  f.business_contact "270x539"
  f.business_email "455x539"
  f.business_phone "72x561"
  f.business_fax "386x561"


  # PURCHASE DETAILS
  f.purchase_details "31x626", :type => :multiline, :lines => [626, 640, 653, 667]
  f.due_date "167x691"
  f.amount_due "165x306"
end

```

## WISHLIST
max_width attribute
prawn_options attribute
implicit and explicit typing
multi-line handling
