# xsdtests
W3C XML Schema 1.1 test suite

## History

This is a copy of the current state of the W3C XSD test suite as at 2018-03-06, 
made from Michael Kay's working copy of the CVS repository. These tests were
contributed at various times by members of the XML Schema Working Group, and the
top-level organization is by original contributor.

The CVS history has not been preserved in the Github repository. However, the metadata
associated with tests includes change history in many cases.

In fact many of the individual files were not stored separately in CVS; they existed
only within a large ZIP file representing the test suite base line at some particular date.
Subsequent changes to the tests (notably, all tests developed specifically for XSD 1.1)
were added to the repository individually.

## Process

To gain commit access to this repository, please apply to Liam Quin at W3C.

If you have commit access, there is no formal process for agreeing changes to tests,
but you should respect the fact that the test suite is stable. Some tests are marked
as "queried", which means the results have been challenged; these will normally include
a reference to a W3C bugzilla entry. If the bugzilla entry indicates consensus that a 
bug needs fixing, and on how it should be fixed, then feel free to apply the required
change. Otherwise, don't change any tests without gaining consensus from interested and
knowledgeable parties.

You are welcome to add new tests. Just make sure you observe the process for documenting
them, and be prepared for them to be challenged.

## Running the tests

No test driver is supplied; you are expected to write your own.

The file `suite.xml` contains links to `.testSet` files. Each `.testSet` file
contains a number of test groups; each test group typically contains a schema
and one or more instances to be validated against that schema; both the schema
and the instances are labeled as valid or invalid. A test driver should validate
all the instances against the schema and confirm that the validity reported by
a schema processor is the same as that recorded in the test metadata.

A schema for the test metadata, with additional documentation, can be found in
the file `nistMeta/annotatedTSSchema.xsd`.

The `introspection` test set checks that all the test metadata files are valid
against the schema for test metadata.

The test suite only checks that the top-level outcome reported by a validator
(valid or invalid) is correct. It makes no attempt to check for other conformance
requirements in the XSD specification: for example, that a correct PSVI is generated,
or that error reporting meets the requirements of the specification.
