public class pokemon {
  public Integer height; //5
  public Integer id; //56
  public String name; //mankey
  public Integer order; //95
  public cls_sprites sprites;
  public cls_types[] types;
  public Integer weight; //280
  public class cls_sprites {
    public String front_default; //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png

    public cls_other other;
  }
  class cls_back_female {
  }
  class cls_back_shiny_female {
  }
  class cls_front_female {
  }
  class cls_front_shiny_female {
  }
  public class cls_types {
    public Integer slot; //1
    public cls_type type;
  }
  public class cls_other {
    public cls_home home;
  }
  public class cls_home {
    public String front_default;
  }
  public class cls_type {
    public String name; //fighting
    public String url; //https://pokeapi.co/api/v2/type/2/
  }
  public static Pokemon parse(String json) {
    return (Pokemon) System.JSON.deserialize(json, Pokemon.class);
  }
}
