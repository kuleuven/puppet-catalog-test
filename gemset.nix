{
  ast = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l3468czzjmxl93ap40hp7z94yxp4nbag0bxqs789bm30md90m2a";
      type = "gem";
    };
    version = "2.4.1";
  };
  builder = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "045wzckxpwcqzrjr353cxnyaxgf0qg22jh00dcx7z38cys5g1jlr";
      type = "gem";
    };
    version = "3.2.4";
  };
  concurrent-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vnxrbhi7cq3p4y2v9iwd10v1c7l15is4var14hwnb2jip4fyjzz";
      type = "gem";
    };
    version = "1.1.7";
  };
  deep_merge = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1q3picw7zx1xdkybmrnhmk2hycxzaa0jv4gqrby1s90dy5n7fmsb";
      type = "gem";
    };
    version = "1.2.1";
  };
  facter = {
    dependencies = ["hocon" "thor"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d6gkyk7c5r6sfhbx73254ysihhkd4avxymfhlxkkknv5z5hjjdk";
      type = "gem";
    };
    version = "4.0.46";
  };
  fast_gettext = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02s9qrvxi9fcvsrwz4hisrv0q13gdv5vr1rjn2ywpdw0kjg9csb6";
      type = "gem";
    };
    version = "1.8.0";
  };
  hiera = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m7rxky6v9vjwl5pjm3jf3y9sm7y2l6ch7808js5ajd0fck1hyx7";
      type = "gem";
    };
    version = "3.6.0";
  };
  hiera-puppet = {
    dependencies = ["hiera"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k69fp2fx59kqicwgw5a6m6wlnkbsjljf6x9k36kmvvcvd5lkr5h";
      type = "gem";
    };
    version = "0.1.0";
  };
  hocon = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mifv4vfvppfdpkd0cwgy634sj0aplz6ys84sp8s11qrnm6vlnmn";
      type = "gem";
    };
    version = "1.3.1";
  };
  locale = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0997465kxvpxm92fiwc2b16l49mngk7b68g5k35ify0m3q0yxpdn";
      type = "gem";
    };
    version = "2.1.3";
  };
  metaclass = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hp99y2b1nh0nr8pc398n3f8lakgci6pkrg4bf2b2211j1f6hsc5";
      type = "gem";
    };
    version = "0.0.4";
  };
  mocha = {
    dependencies = ["metaclass"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0id1x7g46fzy8f4jna20ys329ydaj3sad75qs9db2a6nd7f0zc2b";
      type = "gem";
    };
    version = "0.14.0";
  };
  multi_json = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pb1g1y3dsiahavspyzkdy39j4q377009f6ix0bh1ag4nqw43l0z";
      type = "gem";
    };
    version = "1.15.0";
  };
  parallel = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0055br0mibnqz0j8wvy20zry548dhkakws681bhj3ycb972awkzd";
      type = "gem";
    };
    version = "1.20.1";
  };
  parser = {
    dependencies = ["ast"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1f7gmm60yla325wlnd3qkxs59qm2y0aan8ljpg6k18rwzrrfil6z";
      type = "gem";
    };
    version = "2.7.2.0";
  };
  puppet = {
    dependencies = ["concurrent-ruby" "deep_merge" "facter" "fast_gettext" "hiera" "locale" "multi_json" "puppet-resource_api" "semantic_puppet"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lfmzv9i854xlxhraxjxgis877lrrlm7vd4441bpaps3zif5chl0";
      type = "gem";
    };
    version = "7.0.0";
  };
  puppet-resource_api = {
    dependencies = ["hocon"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gd3q7ayp305dj7ld8hcr2hknl664ang2fbbylabvins8q06lafv";
      type = "gem";
    };
    version = "1.8.13";
  };
  rainbow = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bb2fpjspydr6x0s8pn1pqkzmxszvkfapv0p4627mywl7ky4zkhk";
      type = "gem";
    };
    version = "3.0.0";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w6qza25bq1s825faaglkx1k6d59aiyjjk3yw3ip5sb463mhhai9";
      type = "gem";
    };
    version = "13.0.1";
  };
  regexp_parser = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1racz3w9s4w0ls32bvjypfifk4a7qxngm2cv1rh16jyz0c1wjd70";
      type = "gem";
    };
    version = "2.0.0";
  };
  rexml = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mkvkcw9fhpaizrhca0pdgjcrbns48rlz4g6lavl5gjjq3rk2sq3";
      type = "gem";
    };
    version = "3.2.4";
  };
  rubocop = {
    dependencies = ["parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lis26av2fl66bq8gsx8nvls5vaxza59l7dyqmni4c62mw0m271b";
      type = "gem";
    };
    version = "1.5.0";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1z9253d7hwdlqr3g7rwx6x6n0qwv8niq6r2ppgry2lbfvb4czypm";
      type = "gem";
    };
    version = "1.3.0";
  };
  rubocop-rake = {
    dependencies = ["rubocop"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04q3qa9qnzm70yqay0qxc41a8v166apc8172f7jfvswx38akhnxw";
      type = "gem";
    };
    version = "0.5.1";
  };
  rubocop-rspec = {
    dependencies = ["rubocop" "rubocop-ast"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1avq0ffi3ashz5pd991916mr20xxfbrgflxjgl3if9drmxjpb76v";
      type = "gem";
    };
    version = "2.0.1";
  };
  ruby-progressbar = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k77i0d4wsn23ggdd2msrcwfy0i376cglfqypkk2q77r2l3408zf";
      type = "gem";
    };
    version = "1.10.1";
  };
  semantic_puppet = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "046m45rdwpvfz77s7bxid27c89w329c1nj593p74wdd8kknf0nv0";
      type = "gem";
    };
    version = "1.0.2";
  };
  thor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xbhkmyhlxwzshaqa7swy2bx6vd64mm0wrr8g3jywvxy7hg0cwkm";
      type = "gem";
    };
    version = "1.0.1";
  };
  unicode-display_width = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06i3id27s60141x6fdnjn5rar1cywdwy64ilc59cz937303q3mna";
      type = "gem";
    };
    version = "1.7.0";
  };
}