# Extended Daml Finance

This project extends the capabilities of the DAML Finance library by introducing advanced functionality for managing accounts and settling transfers.

https://github.com/digital-asset/daml-finance/

## Description

The project is organized into 8 packages, each adding specific functionality to extend the DAML Finance library. Below is an overview of each package:

1. **extended-daml-finance-interface-account**

This interface package defines an extension of the DAML Finance `Account` module, enhancing it with functionality to set **mandatory observers** on the holdings it credits.

**Key features:**

- **Custom Observers**: Specify a set of parties required to observe a holding.
- **Instrument Issuer/Depository Inclusion**: Optionally include the instrument's issuer and/or its depository as mandatory observers.

This ensures better control and compliance over the observation of credited holdings.

2. **extended-daml-finance-account**

   This package provides a default implementation for the extended DAML Finance interface `Account`, as defined in the `extended-daml-finance-interface-account` package.

   **Key Features:**
   - Implements the logic for mandatory observers on credited holdings.
   - Ensures compatibility with the DAML Finance library for seamless integration.

3. **extended-daml-finance-account-test**

   This package tests the default implementations provided in the
   `extended-daml-finance-account` package.


4. **extended-daml-finance-interface-settlement**

   This extension interface package defines two key components:
   - An extended `Batch` that supports disclosure and its corresponding `Factory`.
   - A new `TransferProposal` interface that outlines the transfer of holdings between parties, with optional pre-allocations and pre-approvals for the related instructions.

   **Key Features of the `TransferProposal`:**
   - Manages the authorization, instruction, and settlement processes of the transfer.
   - Optional pre-allocations and pre-approvals, which can only be performed by the authorizers involved in the generated instructions.

   **Key operations within the `TransferProposal`:**
   - Authorization of the proposal by relevant parties.
   - Instruction for settlement, including the creation of the batch and instructions.
   - Ability to cancel the proposal, if needed, and undo any disclosed holdings.
   - Settles the transfer, finalizing it and undisclosing any holdings disclosed in the pre-allocation process.

5. **extended-daml-finance-settlement**

   This package provides a default implementation for the interfaces defined in the
   `extended-daml-finance-interface-settlement` package.

6. **extended-daml-finance-settlement-test**

   This package tests the default implementations provided in the
   `extended-daml-finance-settlement` package.

7. **extended-daml-finance-test-util**

   This package provides several utilities for testing using DAML script.
   Some of these utilities have been copied from the `daml-finance` source code,
   as they are not exposed as a separate package.

8. **extended-daml-finance-app**

   This package is intended to showcase a scenario (DAML script) where all the extended functionality from the above packages, along with the DAML Finance library itself, are integrated.


## Dependencies

This project depends on the following DAML SDK and DAML Finance packages:

- **DAML SDK**: 2.9.4
- **DAML Finance Packages**:
  - `daml-finance-account-3.0.0.dar`
  - `daml-finance-holding-3.0.0.dar`
  - `daml-finance-instrument-token-3.0.0.dar`
  - `daml-finance-interface-account-3.0.0.dar`
  - `daml-finance-interface-holding-3.0.0.dar`
  - `daml-finance-interface-instrument-base-3.0.0.dar`
  - `daml-finance-interface-instrument-token-3.0.0.dar`
  - `daml-finance-interface-instrument-types-1.0.0.dar`
  - `daml-finance-interface-settlement-3.0.0.dar`
  - `daml-finance-interface-types-common-2.0.0.dar`
  - `daml-finance-interface-util-2.1.0.dar`
  - `daml-finance-settlement-3.0.0.dar`
  - `daml-finance-util-3.1.0.dar`

## Building

To build the library, run the following command in the root folder of the project.

```bash
make build-all
```

## Testing

To test the library, run the following command in the root folder of the project.

```bash
make test
```

## TODO

- Currently, the DAML Finance DAR files are stored inside the `lib` folder. Ideally, these DAR files should be downloaded locally using a bash script, based on the data dependencies declared in the `daml.yaml` files of the different packages.

- The project leverages the DAML multi-package feature. However, there seems to be some incompatibility with the DAML Finance DARs when the project is built using `daml build --all`. To workaround this issue, a custom build process has been created in the Makefile.

## License

This project is licensed under the Apache License 2.0. See the LICENSE file for more details.

This project extends the DAML Finance library, which is also licensed under the Apache License 2.0.
You can find the original DAML Finance library here: [daml-finance GitHub](https://github.com/digital-asset/daml-finance).
