public class pokemon {
  public Integer height; //5
  public Integer id; //56
  public String name; //mankey
  public Integer order; //95
  public cls_sprites sprites;
  public cls_types[] types;
  public Integer weight; //280
  public class cls_sprites {
    public String front_default;
  }

  public class cls_types {
    public Integer slot; //1
    public cls_type type;
  }
  public class cls_type {
    public String name; //fighting
    public String url; //https://pokeapi.co/api/v2/type/2/
  }
  public static pokemon parse(String json) {
    return (pokemon) System.JSON.deserialize(json, pokemon.class);
  }
}
