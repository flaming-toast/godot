//
//  appodeal.h
//  
//
//  Created by Poq Xert on 09.06.2020.
//

#ifndef vungle_h
#define vungle_h

#include "core/object.h"
#include "core/array.h"
#include "core/dictionary.h"

class GodotVungle : public Object {
    GDCLASS(GodotVungle, Object);

    static void _bind_methods();

public:
    GodotVungle();
    ~GodotVungle();
    
    
    // Base
    void initialize();
//    bool isInitializedForAdType(int adType);
};

#endif /* vungle_h */
