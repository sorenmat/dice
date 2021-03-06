// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

library dice_example;

import "../lib/dice.dart";

part "example_classes.dart";

main() {
  var injector = new Injector(new ExampleModule());
  injector.getInstance(BillingService).then((BillingService billing) {
    var creditCard = new CreditCard("VISA");
    var order = new Order("Dart: Up and Running");
    billing.chargeOrder(order, creditCard);
  });
}

class ExampleModule extends Module {
  configure() {
    // bind CreditCardProcessor to a singleton
    bind(CreditProcessor).toInstance(new CreditProcessorImpl());
    // bind BillingService to a type
    bind(BillingService).toType(new BillingServiceImpl());
  }
}

