#include "register_types.h"
#include "ios/src/vungle.h"
#include "core/class_db.h"
#include "core/engine.h"

void register_vungle_types() {
    Engine::get_singleton()->add_singleton(Engine::Singleton("GodotVungle", memnew(GodotVungle)));
}

void unregister_vungle_types() {
    
}
