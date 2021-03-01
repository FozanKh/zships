var request = require("request");
var options = {
  method: "POST",
  url: "https://api.shipengine.com/v1/shipments",
  headers: {
    Host: "api.shipengine.com",
    "API-Key": "__YOUR_API_KEY_HERE__",
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    shipments: [
      {
        validate_address: "no_validation",
        service_code: "usps_priority_mail",
        external_shipment_id: "1daa0c22-0519-46d0-8653-9f3dc62e7d2c",
        ship_to: {
          name: "Amanda Miller",
          phone: "555-555-5555",
          address_line1: "525 S Winchester Blvd",
          city_locality: "San Jose",
          state_province: "CA",
          postal_code: "95128",
          country_code: "US",
          address_residential_indicator: "yes",
        },
        ship_from: {
          company_name: "Example Corp.",
          name: "John Doe",
          phone: "111-111-1111",
          address_line1: "4009 Marathon Blvd",
          address_line2: "Suite 300",
          city_locality: "Austin",
          state_province: "TX",
          postal_code: "78756",
          country_code: "US",
          address_residential_indicator: "no",
        },
        confirmation: "none",
        advanced_options: {},
        insurance_provider: "none",
        tags: [],
        packages: [{ weight: { value: 1, unit: "ounce" } }],
      },
    ],
  }),
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
