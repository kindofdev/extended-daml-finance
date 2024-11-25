.PHONY: build-all
build-all:
	# daml build --all  # every now and then it fails - the workaround above seems to work when vscode keeps closed.
	cd src/extended-daml-finance-interface-account; daml build; cd ../..;
	cd src/extended-daml-finance-interface-settlement; daml build; cd ../..;
	cd src/extended-daml-finance-account; daml build; cd ../..;
	cd src/extended-daml-finance-settlement; daml build; cd ../..;
	cd src/extended-daml-finance-test-util; daml build; cd ../..;
	cd src/extended-daml-finance-settlement-test; daml build; cd ../..;
	cd src/extended-daml-finance-account-test; daml build; cd ../..;
	cd src/extended-daml-finance-app; daml build; cd ../..;

.PHONY: clean
clean:
	daml clean --all

.PHONY: test
test: build-all
	daml test --project-root ./src/extended-daml-finance-settlement-test
	daml test --project-root ./src/extended-daml-finance-account-test
	daml test --project-root ./src/extended-daml-finance-app
