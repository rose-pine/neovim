lua << EOF
package.loaded['rose-pine'] = nil
package.loaded['rose-pine.util'] = nil
package.loaded['rose-pine.palette'] = nil
package.loaded['rose-pine.theme'] = nil
package.loaded['rose-pine.functions'] = nil

require('rose-pine').set()
EOF
