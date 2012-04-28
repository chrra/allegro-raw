#include <string.h>
#include "allegro-raw.h"

/* {{{ Bitmap: */
void al_draw_tinted_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float dx, float dy, int flags)
{
	return al_draw_tinted_bitmap(bitmap, *tint, dx, dy, flags);
}
void al_draw_tinted_bitmap_region_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float sx, float sy, float sw, float sh, float dx, float dy, int flags)
{
	return al_draw_tinted_bitmap_region(bitmap, *tint, sx, sy, sw, sh, dx, dy, flags);
}
void al_draw_tinted_scaled_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float sx, float sy, float sw, float sh, float dx, float dy, float dw, float dh, int flags)
{
	return al_draw_tinted_scaled_bitmap(bitmap, *tint, sx, sy, sw, sh, dx, dy, dw, dh, flags);
}
void al_draw_tinted_rotated_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float cx, float cy, float dx, float dy, float angle, int flags)
{
	return al_draw_tinted_rotated_bitmap(bitmap, *tint, cx, cy, dx, dy, angle, flags);
}
void al_draw_tinted_scaled_rotated_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float cx, float cy, float dx, float dy, float xscale, float yscale, float angle, int flags)
{
	return al_draw_tinted_scaled_rotated_bitmap(bitmap, *tint, cx, cy, dx, dy, xscale, yscale, angle, flags);
}

void al_put_pixel_w(int x, int y, ALLEGRO_COLOR *color)
{
	return al_put_pixel(x, y, *color);
}
void al_put_blended_pixel_w(int x, int y, ALLEGRO_COLOR *color)
{
	return al_put_blended_pixel(x, y, *color);
}
void al_get_pixel_w(ALLEGRO_BITMAP *bitmap, int x, int y, ALLEGRO_COLOR *color)
{
	*color = al_get_pixel(bitmap, x, y);
}

void al_convert_mask_to_alpha_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *mask_color)
{
	return al_convert_mask_to_alpha(bitmap, *mask_color);
}

/* }}} */
/* {{{ System */
int al_init_()
{
	return al_init();
}
/* }}} */
/* {{{ Display */

void al_clear_to_color_w(ALLEGRO_COLOR *color)
{
	return al_clear_to_color(*color);
}

void al_draw_pixel_w(float x, float y, ALLEGRO_COLOR *color)
{
	return al_draw_pixel(x, y, *color);
}
/* }}} */
/* {{{ Memory: */
void al_free_in_finalizer(void *ptr)
{
	return al_free_with_context(ptr, 0, "ghc.hs", "some finalizer");
}
/* }}} */
/* {{{ Addon.Color: */
void al_color_yuv_w(float y, float u, float v, ALLEGRO_COLOR *color)
{
	*color = al_color_yuv(y, u, v);
}
void al_color_cmyk_w(float c, float m, float y, float k, ALLEGRO_COLOR *color)
{
	*color = al_color_cmyk(c, m, y, k);
}
void al_color_hsl_w(float h, float s, float l, ALLEGRO_COLOR *color)
{
	*color = al_color_hsl(h, s, l);
}
void al_color_hsv_w(float h, float s, float v, ALLEGRO_COLOR *color)
{
	*color = al_color_hsv(h, s, v);
}
void al_color_name_w(char const *name, ALLEGRO_COLOR *color)
{
	*color = al_color_name(name);
}
void al_color_html_w(char const *string, ALLEGRO_COLOR *color)
{
	*color = al_color_html(string);
}
/* }}} */
/* {{{ Addon.Font: */
void al_draw_ustr_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x, float y, int flags, ALLEGRO_USTR const *ustr)
{
	al_draw_ustr(font, *color, x, y, flags, ustr);
}
void al_draw_text_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x, float y, int flags, char const *text)
{
	al_draw_text(font, *color, x, y, flags, text);
}
void al_draw_justified_text_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x1, float x2, float y, float diff, int flags, char const *text)
{
	al_draw_justified_text(font, *color, x1, x2, y, diff, flags, text);
}
void al_draw_justified_ustr_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x1, float x2, float y, float diff, int flags, ALLEGRO_USTR const *text)
{
	al_draw_justified_ustr(font, *color, x1, x2, y, diff, flags, text);
}
/* }}} */
/* {{{ Addon.NativeDialog: */
void al_append_native_text_log_w(ALLEGRO_TEXTLOG *textlog, char const *format)
{
	al_append_native_text_log(textlog, format);
}
/* }}} */
/* {{{ Addon.Primitives: */
void al_draw_line_w(float x1, float y1, float x2, float y2, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_line(x1, y1, x2, y2, *color, thickness);
}
void al_draw_triangle_w(float x1, float y1, float x2, float y2, float x3, float y3, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_triangle(x1, y1, x2, y2, x3, y3, *color, thickness);
}
void al_draw_rectangle_w(float x1, float y1, float x2, float y2, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_rectangle(x1, y1, x2, y2, *color, thickness);
}
void al_draw_rounded_rectangle_w(float x1, float y1, float x2, float y2, float rx, float ry, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_rounded_rectangle(x1, y1, x2, y2, rx, ry, *color, thickness);
}
void al_draw_circle_w(float cx, float cy, float r, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_circle(cx, cy, r, *color, thickness);
}
void al_draw_ellipse_w(float cx, float cy, float rx, float ry, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_ellipse(cx, cy, rx, ry, *color, thickness);
}
void al_draw_arc_w(float cx, float cy, float r, float start_theta, float delta_theta, ALLEGRO_COLOR *color, float thickness)
{
	al_draw_arc(cx, cy, r, start_theta, delta_theta, *color, thickness);
}
void al_draw_spline_w(float a, float b, float c, float d, float e, float f, float g, float h, ALLEGRO_COLOR *color, float thickness)
{
	float points[8] = {a, b, c, d, e, f, g, h};
	al_draw_spline(points, *color, thickness);
}
void al_draw_ribbon_w(const float *points, int points_stride, ALLEGRO_COLOR *color, float thickness, int num_segments)
{
	return al_draw_ribbon(points, points_stride, *color, thickness, num_segments);
}
void al_draw_filled_triangle_w(float x1, float y1, float x2, float y2, float x3, float y3, ALLEGRO_COLOR *color)
{
	al_draw_filled_triangle(x1, y1, x2, y2, x3, y3, *color);
}
void al_draw_filled_rectangle_w(float x1, float y1, float x2, float y2, ALLEGRO_COLOR *color)
{
	al_draw_filled_rectangle(x1, y1, x2, y2, *color);
}
void al_draw_filled_ellipse_w(float cx, float cy, float rx, float ry, ALLEGRO_COLOR *color)
{
	al_draw_filled_ellipse(cx, cy, rx, ry, *color);
}
void al_draw_filled_circle_w(float cx, float cy, float r, ALLEGRO_COLOR *color)
{
	al_draw_filled_circle(cx, cy, r, *color);
}
void al_draw_filled_rounded_rectangle_w(float x1, float y1, float x2, float y2, float rx, float ry, ALLEGRO_COLOR *color)
{
	al_draw_filled_rounded_rectangle(x1, y1, x2, y2, rx, ry, *color);
}
/* }}} */
