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
ALLEGRO_COLOR *al_get_pixel_w(ALLEGRO_BITMAP *bitmap, int x, int y)
{
	ALLEGRO_COLOR *color = (ALLEGRO_COLOR *) al_malloc(sizeof(ALLEGRO_COLOR));
	ALLEGRO_COLOR tmp = al_get_pixel(bitmap, x, y);
	memcpy(color, &tmp, sizeof(ALLEGRO_COLOR));
	return color;
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
