{
  asciidoctor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yblqlbix3is5ihiqrpbfazb44in7ichfkjzdbsqibp48paanpl3";
      type = "gem";
    };
    version = "2.0.20";
  };
  asciidoctor-foodogsquared-extensions = {
    dependencies = ["asciidoctor" "rugged"];
    groups = ["default"];
    platforms = [];
    source = {
      path = ./.;
      type = "path";
    };
    version = "1.0.0";
  };
  ast = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      type = "gem";
    };
    version = "2.4.2";
  };
  diff-lcs = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rwvjahnp7cpmracd8x732rjgnilqv2sx7d1gfrysslc3h039fa9";
      type = "gem";
    };
    version = "1.5.0";
  };
  json = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nalhin1gda4v8ybk6lq8f407cgfrj6qzn234yra4ipkmlbfmal6";
      type = "gem";
    };
    version = "2.6.3";
  };
  language_server-protocol = {
    groups = ["default" "development" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      type = "gem";
    };
    version = "3.17.0.3";
  };
  parallel = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jcc512l38c0c163ni3jgskvq1vc3mr8ly5pvjijzwvfml9lf597";
      type = "gem";
    };
    version = "1.23.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1swigds85jddb5gshll1g8lkmbcgbcp9bi1d4nigwvxki8smys0h";
      type = "gem";
    };
    version = "3.2.2.3";
  };
  prettier_print = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ybgks9862zmlx71zd4j20ky86fsrp6j6m0az4hzzb1zyaskha57";
      type = "gem";
    };
    version = "1.2.1";
  };
  racc = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11v3l46mwnlzlc371wr3x6yylpgafgwdf0q7hc7c1lzx6r414r5g";
      type = "gem";
    };
    version = "1.7.1";
  };
  rainbow = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15whn7p9nrkxangbs9hh75q585yfn66lv0v2mhj6q6dl6x8bzr2w";
      type = "gem";
    };
    version = "13.0.6";
  };
  regexp_parser = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "136br91alxdwh1s85z912dwz23qlhm212vy6i3wkinz3z8mkxxl3";
      type = "gem";
    };
    version = "2.8.1";
  };
  rexml = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08ximcyfjy94pm1rhcx04ny1vx2sk0x4y185gzn86yfsbzwkng53";
      type = "gem";
    };
    version = "3.2.5";
  };
  rspec = {
    dependencies = ["rspec-core" "rspec-expectations" "rspec-mocks"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "171rc90vcgjl8p1bdrqa92ymrj8a87qf6w20x05xq29mljcigi6c";
      type = "gem";
    };
    version = "3.12.0";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l95bnjxdabrn79hwdhn2q1n7mn26pj7y1w5660v5qi81x458nqm";
      type = "gem";
    };
    version = "3.12.2";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05j44jfqlv7j2rpxb5vqzf9hfv7w8ba46wwgxwcwd8p0wzi1hg89";
      type = "gem";
    };
    version = "3.12.3";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gq7gviwpck7fhp4y5ibljljvxgjklza18j62qf6zkm2icaa8lfy";
      type = "gem";
    };
    version = "3.12.6";
  };
  rspec-support = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ky86j3ksi26ng9ybd7j0qsdf1lpr8mzrmn98yy9gzv801fvhsgr";
      type = "gem";
    };
    version = "3.12.1";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vklabd0510isqhikx4bfx5qn9g8pyj8h9jxryayp2wj8mx4kg74";
      type = "gem";
    };
    version = "1.54.1";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "188bs225kkhrb17dsf3likdahs2p1i1sqn0pr3pvlx50g6r2mnni";
      type = "gem";
    };
    version = "1.29.0";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "sorbet-runtime" "syntax_tree"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03jx0157jpfrnww5ww6hnkprgzfv4m7ahiqzpjdjjrcb67jp5nh1";
      type = "gem";
    };
    version = "0.6.2";
  };
  ruby-progressbar = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      type = "gem";
    };
    version = "1.13.0";
  };
  rugged = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "016bawsahkhxx7p8azxirpl7y2y7i8a027pj8910gwf6ipg329in";
      type = "gem";
    };
    version = "1.6.3";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0csmpdf05wp9ndb61vsnpbw2vkxsm888h2xwrddcz0p02laiz7s8";
      type = "gem";
    };
    version = "0.5.10902";
  };
  syntax_tree = {
    dependencies = ["prettier_print"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "162m5xhbiq315bncp49ziddws537dv09pqsgrzsrmhhsymhgy0zb";
      type = "gem";
    };
    version = "6.1.1";
  };
  unicode-display_width = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gi82k102q7bkmfi7ggn9ciypn897ylln1jk9q67kjhr39fj043a";
      type = "gem";
    };
    version = "2.4.2";
  };
}
