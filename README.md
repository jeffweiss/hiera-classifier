# Hiera Classifier Backend

A data backend for Hiera that can query Puppet Classifier data.

## Installation

    gem install hiera-classifier

## Configuration

Enable the classifier backend in `/etc/hiera.yaml`

    ---
    # Example Hiera configuration file with support for the Classifier backend.
    :backends:
      - "classifier"

    :hierarchy:
      - "%{fqdn}"
      - "%{environment}"
      - "global"

    # See the Sequel gem documentation for valid connect strings:
    # http://sequel.rubyforge.org/rdoc/files/doc/opening_databases_rdoc.html
    #
    # :database: should be a well-formed URI as described in the Sequel docs.
    :classifier:
      :database: "jdbc:sqlite:/var/lib/classifier/data/classifier.db"


