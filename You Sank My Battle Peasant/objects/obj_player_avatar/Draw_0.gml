
shader_set(sh_shadow);
gpu_set_texfilter(false);
draw_self()
image_xscale=_size
image_yscale=_size

shader_reset();
gpu_set_texfilter(true);