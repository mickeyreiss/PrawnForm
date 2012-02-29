Prawn based form filler

## DESCRIPTION

### Valid Types
text_field
multiline
boolean (checkbox)

### Attributes
- type

- lines (multiline only) array of y coordinates 
  - Only allows sizeof array lines lines if present
  - otherwise, wraps automatically based on width


## THE DSL (BY EXAMPLE)
```
prawn_form :form => "paymentrequest11-12.pdf", :data => @payment_request do |f|
  #SUBMITTER
  f.organization_name, "167x305"
  f.submitter_name, "162x347"
  f.authorized_signer, "153x374"
  f.date, "427x277"
  f.org, "466x303", :type => :boolean
  f.org_amount, "516x305"
  f.gift, "466x326" #:type => :boolean
  f.gift_amount, "516x328"
  f.andrew_id, "446x348"

  #PAYEE
  f.payee_name, "104x427"
  f.payee_address_line_1, "149x460"
  f.payee_address_line_2, "149x485"
  f.payee_address_line_3, "149x510"

  f.business_contact, "270x539"
  f.business_email, "455x539"
  f.business_phone, "72x561"
  f.business_fax, "386x561


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
