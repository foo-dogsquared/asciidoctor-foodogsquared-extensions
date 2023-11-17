{
  asciidoctor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yblqlbix3is5ihiqrpbfazb44in7ichfkjzdbsqibp48paanpl3";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.20";
  };
  asciidoctor-foodogsquared-extensions = {
    dependencies = ["asciidoctor" "mime-types" "nokogiri" "rugged"];
    groups = ["default"];
    platforms = [];
    source = {
      path = ".";
      type = "path";
    };
    targets = [];
    version = "1.3.0";
  };
  ast = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.2";
  };
  diff-lcs = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rwvjahnp7cpmracd8x732rjgnilqv2sx7d1gfrysslc3h039fa9";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.5.0";
  };
  json = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nalhin1gda4v8ybk6lq8f407cgfrj6qzn234yra4ipkmlbfmal6";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.6.3";
  };
  language_server-protocol = {
    groups = ["default" "development" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.17.0.3";
  };
  mime-types = {
    dependencies = ["mime-types-data"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0q8d881k1b3rbsfcdi3fx0b5vpdr5wcrhn88r2d9j7zjdkxp5mw5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.5.1";
  };
  mime-types-data = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yjv0apysnrhbc70ralinfpcqn9382lxr643swp7a5sdwpa9cyqg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2023.1003";
  };
  nokogiri = {
    dependencies = ["racc"];
    groups = ["default"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0hhqzm7p4lww7v3i33im26bmiryfqr0p3iknbadyv5ypf8yysb47";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.15.4";
  };
  parallel = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jcc512l38c0c163ni3jgskvq1vc3mr8ly5pvjijzwvfml9lf597";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.23.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r69dbh6h6j4d54isany2ir4ni4gf2ysvk3k44awi6amz18nggpd";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.2.4";
  };
  prism = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kfb29152jd9glga3w06ljcfzkb63yfhrviihibwvbin5kgqcgz6";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.17.1";
  };
  racc = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01b9662zd2x9bp4rdjfid07h09zxj7kvn7f5fghbqhzc625ap1dp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.3";
  };
  rainbow = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.1.1";
  };
  rake = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ilr853hawi09626axx0mps4rkkmxcs54mapz9jnqvpnlwd3wsmy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "13.1.0";
  };
  regexp_parser = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d9a5s3qrjdy50ll2s32gg3qmf10ryp3v2nr5k718kvfadp50ray";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.8.2";
  };
  rexml = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05i8518ay14kjbma550mv0jm8a6di8yp5phzrd8rj44z9qnrlrp0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.6";
  };
  rspec = {
    dependencies = ["rspec-core" "rspec-expectations" "rspec-mocks"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "171rc90vcgjl8p1bdrqa92ymrj8a87qf6w20x05xq29mljcigi6c";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.12.0";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l95bnjxdabrn79hwdhn2q1n7mn26pj7y1w5660v5qi81x458nqm";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.12.2";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05j44jfqlv7j2rpxb5vqzf9hfv7w8ba46wwgxwcwd8p0wzi1hg89";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.12.3";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gq7gviwpck7fhp4y5ibljljvxgjklza18j62qf6zkm2icaa8lfy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.12.6";
  };
  rspec-support = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ky86j3ksi26ng9ybd7j0qsdf1lpr8mzrmn98yy9gzv801fvhsgr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.12.1";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06qnp5zs233j4f59yyqrg8al6hr9n4a7vcdg3p31v0np8bz9srwg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.57.2";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cs9cc5p9q70valk4na3lki4xs88b52486p2v46yx3q1n5969bgs";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.30.0";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "prism" "sorbet-runtime"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rs5vd93il0hz1c2dl6j0mf7hgw1mw3k2vjmg0xnzh90rg6q57g4";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.12.3";
  };
  ruby-progressbar = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.13.0";
  };
  rugged = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02m9zksfy3dwzhbv56xq2wwmlghca5209hdg895pi2x2d2sbkahi";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.1";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1krfwpmvbzamlmw8p0cyyma53byvxw1mgg109dxnpfl3gdpknw45";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11139";
  };
  unicode-display_width = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d0azx233nags5jx3fqyr23qa2rhgzbhv8pxp46dgbg1mpf82xky";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.5.0";
  };
}