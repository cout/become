#include <ruby.h>

static void become_impl(VALUE obj1, VALUE obj2) {
  struct RObject * robj1 = ROBJECT(obj1);
  struct RObject * robj2 = ROBJECT(obj2);
  struct RObject tmp_obj;

  tmp_obj = *robj1;
  *robj1  = *robj2;
  *robj2  = tmp_obj;
}

/* call-seq:
 *   obj1.become(obj2)
 *
 * Swaps obj1 and obj2.
 */
static VALUE ruby_become(VALUE self, VALUE newobj) {
  rb_secure(1);

  if(TYPE(self) != T_OBJECT || TYPE(newobj) != T_OBJECT) {
    rb_raise(
        rb_eTypeError,
        "%s cannot become %s",
        STR2CSTR(rb_mod_name(rb_obj_class(self))),
        STR2CSTR(rb_mod_name(rb_obj_class(newobj))));
  }

  if(OBJ_FROZEN(self) || OBJ_FROZEN(newobj)) {
    rb_error_frozen("object");
  }

  become_impl(self, newobj);

  return self;
}

void Init_become(void) {
  rb_define_method(rb_cObject, "become", ruby_become, 1);
}

