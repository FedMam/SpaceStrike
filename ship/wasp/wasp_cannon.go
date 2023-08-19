components {
  id: "fire_script"
  component: "/ship/common/cannon_fire.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
components {
  id: "animation_script"
  component: "/ship/common/cannon_pushback_animation.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "pushback_duration"
    value: "0.04"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "return_duration"
    value: "0.16"
    type: PROPERTY_TYPE_NUMBER
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "tile_set: \"/assets/spaceships/wasp/wasp.atlas\"\n"
  "default_animation: \"cannon\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: -19.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "shooter"
  type: "factory"
  data: "prototype: \"/ship/wasp/wasp_bullet.go\"\n"
  "load_dynamically: false\n"
  "dynamic_prototype: false\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
