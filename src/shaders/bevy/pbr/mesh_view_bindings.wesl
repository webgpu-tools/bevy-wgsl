import package::pbr::mesh_view_types as types;
import package::render::{
    view::View,
    globals::Globals,
};

@group(0) @binding(0) public var<uniform> view: View;
@group(0) @binding(1) public var<uniform> lights: types::Lights;

@if(NO_CUBE_ARRAY_TEXTURES_SUPPORT)
@group(0) @binding(2) public var point_shadow_textures: texture_depth_cube;
@else
@group(0) @binding(2) public var point_shadow_textures: texture_depth_cube_array;

@group(0) @binding(3) public var point_shadow_textures_comparison_sampler: sampler_comparison;

@if(PCSS_SAMPLERS_AVAILABLE)
@group(0) @binding(4) public var point_shadow_textures_linear_sampler: sampler;

@if(NO_ARRAY_TEXTURES_SUPPORT)
@group(0) @binding(5) public var directional_shadow_textures: texture_depth_2d;
@else
@group(0) @binding(5) public var directional_shadow_textures: texture_depth_2d_array;

@group(0) @binding(6) public var directional_shadow_textures_comparison_sampler: sampler_comparison;

@if(PCSS_SAMPLERS_AVAILABLE)
@group(0) @binding(7) public var directional_shadow_textures_linear_sampler: sampler;

@if(AVAILABLE_STORAGE_BUFFER_BINDINGS__GE_3)
@group(0) @binding(8) public var<storage> clusterable_objects: types::ClusterableObjects;
@else
@group(0) @binding(8) public var<uniform> clusterable_objects: types::ClusterableObjects;

@if(AVAILABLE_STORAGE_BUFFER_BINDINGS__GE_3)
@group(0) @binding(9) public var<storage> clusterable_object_index_lists: types::ClusterLightIndexLists;
@else
@group(0) @binding(9) public var<uniform> clusterable_object_index_lists: types::ClusterLightIndexLists;

@if(AVAILABLE_STORAGE_BUFFER_BINDINGS__GE_3)
@group(0) @binding(10) public var<storage> cluster_offsets_and_counts: types::ClusterOffsetsAndCounts;
@else
@group(0) @binding(10) public var<uniform> cluster_offsets_and_counts: types::ClusterOffsetsAndCounts;

@group(0) @binding(11) public var<uniform> globals: Globals;
@group(0) @binding(12) public var<uniform> fog: types::Fog;
@group(0) @binding(13) public var<uniform> light_probes: types::LightProbes;

public const VISIBILITY_RANGE_UNIFORM_BUFFER_SIZE: u32 = 64u;
@if(AVAILABLE_STORAGE_BUFFER_BINDINGS__GE_6)
@group(0) @binding(14) public var<storage> visibility_ranges: array<vec4<f32>>;
@else
@group(0) @binding(14) public var<uniform> visibility_ranges: array<vec4<f32>, VISIBILITY_RANGE_UNIFORM_BUFFER_SIZE>;

@group(0) @binding(15) public var<uniform> ssr_settings: types::ScreenSpaceReflectionsSettings;
@group(0) @binding(16) public var screen_space_ambient_occlusion_texture: texture_2d<f32>;

@if(MULTIPLE_LIGHT_PROBES_IN_ARRAY)
@group(0) @binding(17) public var diffuse_environment_maps: binding_array<texture_cube<f32>, 8u>;
@else
@group(0) @binding(17) public var diffuse_environment_map: texture_cube<f32>;

@if(MULTIPLE_LIGHT_PROBES_IN_ARRAY)
@group(0) @binding(18) public var specular_environment_maps: binding_array<texture_cube<f32>, 8u>;
@else
@group(0) @binding(18) public var specular_environment_map: texture_cube<f32>;

@group(0) @binding(19) public var environment_map_sampler: sampler;
@group(0) @binding(20) public var<uniform> environment_map_uniform: types::EnvironmentMapUniform;

@if(IRRADIANCE_VOLUMES_ARE_USABLE && MULTIPLE_LIGHT_PROBES_IN_ARRAY)
@group(0) @binding(21) public var irradiance_volumes: binding_array<texture_3d<f32>, 8u>;
@elif(IRRADIANCE_VOLUMES_ARE_USABLE)
@group(0) @binding(21) public var irradiance_volume: texture_3d<f32>;
@if(IRRADIANCE_VOLUMES_ARE_USABLE)
@group(0) @binding(22) public var irradiance_volume_sampler: sampler;

@if(CLUSTERED_DECALS_ARE_USABLE)
@group(0) @binding(23) public var<storage> clustered_decals: types::ClusteredDecals;

@if(CLUSTERED_DECALS_ARE_USABLE)
@group(0) @binding(24) public var clustered_decal_textures: binding_array<texture_2d<f32>, 8u>;

@if(CLUSTERED_DECALS_ARE_USABLE)
@group(0) @binding(25) public var clustered_decal_sampler: sampler;

// NB: If you change these, make sure to update `tonemapping_shared.wgsl` too.
@group(0) @binding(26) public var dt_lut_texture: texture_3d<f32>;
@group(0) @binding(27) public var dt_lut_sampler: sampler;

@if(MULTISAMPLED && DEPTH_PREPASS)
@group(0) @binding(28) public var depth_prepass_texture: texture_depth_multisampled_2d;

@if(MULTISAMPLED && NORMAL_PREPASS)
@group(0) @binding(29) public var normal_prepass_texture: texture_multisampled_2d<f32>;

@if(MULTISAMPLED && MOTION_VECTOR_PREPASS)
@group(0) @binding(30) public var motion_vector_prepass_texture: texture_multisampled_2d<f32>;

@if(!MULTISAMPLED && DEPTH_PREPASS)
@group(0) @binding(28) public var depth_prepass_texture: texture_depth_2d;

@if(!MULTISAMPLED && NORMAL_PREPASS)
@group(0) @binding(29) public var normal_prepass_texture: texture_2d<f32>;

@if(!MULTISAMPLED && MOTION_VECTOR_PREPASS)
@group(0) @binding(30) public var motion_vector_prepass_texture: texture_2d<f32>;

@if(DEFERRED_PREPASS)
@group(0) @binding(31) public var deferred_prepass_texture: texture_2d<u32>;

@group(0) @binding(32) public var view_transmission_texture: texture_2d<f32>;
@group(0) @binding(33) public var view_transmission_sampler: sampler;

@if(OIT_ENABLED)
@group(0) @binding(34) public var<storage, read_write> oit_layers: array<vec2<u32>>;
@if(OIT_ENABLED)
@group(0) @binding(35) public var<storage, read_write> oit_layer_ids: array<atomic<i32>>;
@if(OIT_ENABLED)
@group(0) @binding(36) public var<uniform> oit_settings: types::OrderIndependentTransparencySettings;
