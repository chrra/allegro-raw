#include "allegro5/allegro.h"

/* Bitmap: */
void al_draw_tinted_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float dx, float dy, int flags);
void al_draw_tinted_bitmap_region_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float sx, float sy, float sw, float sh, float dx, float dy, int flags);
void al_draw_tinted_scaled_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float sx, float sy, float sw, float sh, float dx, float dy, float dw, float dh, int flags);
void al_draw_tinted_rotated_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float cx, float cy, float dx, float dy, float angle, int flags);
void al_draw_tinted_scaled_rotated_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float cx, float cy, float dx, float dy, float xscale, float yscale, float angle, int flags);

void al_put_pixel_w(int x, int y, ALLEGRO_COLOR *color);
void al_put_blended_pixel_w(int x, int y, ALLEGRO_COLOR *color);
ALLEGRO_COLOR *al_get_pixel_w(ALLEGRO_BITMAP *bitmap, int x, int y);

void al_convert_mask_to_alpha_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *mask_color);

/* Config: */
typedef ALLEGRO_CONFIG_SECTION *ALLEGRO_CONFIG_SECTION_ITERATOR;
typedef ALLEGRO_CONFIG_ENTRY *ALLEGRO_CONFIG_ENTRY_ITERATOR;

/* System: */
int al_init_();

/* Display: */

void al_clear_to_color_w(ALLEGRO_COLOR *color);
void al_draw_pixel_w(float x, float y, ALLEGRO_COLOR *color);
