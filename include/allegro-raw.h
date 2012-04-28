#include "allegro5/allegro.h"
#include "allegro5/allegro_audio.h"
#include "allegro5/allegro_acodec.h"
#include "allegro5/allegro_color.h"
#include "allegro5/allegro_font.h"
#include "allegro5/allegro_image.h"
#include "allegro5/allegro_memfile.h"
#include "allegro5/allegro_native_dialog.h"
#include "allegro5/allegro_physfs.h"
#include "allegro5/allegro_primitives.h"
#include "allegro5/allegro_ttf.h"

/* Bitmap: */
void al_draw_tinted_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float dx, float dy, int flags);
void al_draw_tinted_bitmap_region_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float sx, float sy, float sw, float sh, float dx, float dy, int flags);
void al_draw_tinted_scaled_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float sx, float sy, float sw, float sh, float dx, float dy, float dw, float dh, int flags);
void al_draw_tinted_rotated_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float cx, float cy, float dx, float dy, float angle, int flags);
void al_draw_tinted_scaled_rotated_bitmap_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *tint, float cx, float cy, float dx, float dy, float xscale, float yscale, float angle, int flags);

void al_put_pixel_w(int x, int y, ALLEGRO_COLOR *color);
void al_put_blended_pixel_w(int x, int y, ALLEGRO_COLOR *color);
void al_get_pixel_w(ALLEGRO_BITMAP *bitmap, int x, int y, ALLEGRO_COLOR *color);

void al_convert_mask_to_alpha_w(ALLEGRO_BITMAP *bitmap, ALLEGRO_COLOR *mask_color);

/* Config: */
typedef ALLEGRO_CONFIG_SECTION *ALLEGRO_CONFIG_SECTION_ITERATOR;
typedef ALLEGRO_CONFIG_ENTRY *ALLEGRO_CONFIG_ENTRY_ITERATOR;

/* System: */
int al_init_();

/* Display: */

void al_clear_to_color_w(ALLEGRO_COLOR *color);
void al_draw_pixel_w(float x, float y, ALLEGRO_COLOR *color);

/* Memory: */
void al_free_in_finalizer(void *ptr);

/* Addon.Color: */
void al_color_yuv_w(float y, float u, float v, ALLEGRO_COLOR *color);
void al_color_cmyk_w(float c, float m, float y, float k, ALLEGRO_COLOR *color);
void al_color_hsl_w(float h, float s, float l, ALLEGRO_COLOR *color);
void al_color_hsv_w(float h, float s, float v, ALLEGRO_COLOR *color);
void al_color_name_w(char const *name, ALLEGRO_COLOR *color);
void al_color_html_w(char const *string, ALLEGRO_COLOR *color);

/* Addon.Font: */
void al_draw_ustr_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x, float y, int flags, ALLEGRO_USTR const *ustr);
void al_draw_text_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x, float y, int flags, char const *text);
void al_draw_justified_text_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x1, float x2, float y, float diff, int flags, char const *text);
void al_draw_justified_ustr_w(const ALLEGRO_FONT *font, ALLEGRO_COLOR *color, float x1, float x2, float y, float diff, int flags, ALLEGRO_USTR const *text);

/* Addon.NativeDialog */
void al_append_native_text_log_w(ALLEGRO_TEXTLOG *textlog, char const *format);

/* Addon.Primitives */
void al_draw_line_w(float x1, float y1, float x2, float y2, ALLEGRO_COLOR *color, float thickness);
void al_draw_triangle_w(float x1, float y1, float x2, float y2, float x3, float y3, ALLEGRO_COLOR *color, float thickness);
void al_draw_rectangle_w(float x1, float y1, float x2, float y2, ALLEGRO_COLOR *color, float thickness);
void al_draw_rounded_rectangle_w(float x1, float y1, float x2, float y2, float rx, float ry, ALLEGRO_COLOR *color, float thickness);
void al_draw_circle_w(float cx, float cy, float r, ALLEGRO_COLOR *color, float thickness);
void al_draw_ellipse_w(float cx, float cy, float rx, float ry, ALLEGRO_COLOR *color, float thickness);
void al_draw_arc_w(float cx, float cy, float r, float start_theta, float delta_theta, ALLEGRO_COLOR *color, float thickness);
void al_draw_spline_w(float a, float b, float c, float d, float e, float f, float g, float h, ALLEGRO_COLOR *color, float thickness);
void al_draw_ribbon_w(const float *points, int points_stride, ALLEGRO_COLOR *color, float thickness, int num_segments);
void al_draw_filled_triangle_w(float x1, float y1, float x2, float y2, float x3, float y3, ALLEGRO_COLOR *color);
void al_draw_filled_rectangle_w(float x1, float y1, float x2, float y2, ALLEGRO_COLOR *color);
void al_draw_filled_ellipse_w(float cx, float cy, float rx, float ry, ALLEGRO_COLOR *color);
void al_draw_filled_circle_w(float cx, float cy, float r, ALLEGRO_COLOR *color);
void al_draw_filled_rounded_rectangle_w(float x1, float y1, float x2, float y2, float rx, float ry, ALLEGRO_COLOR *color);
