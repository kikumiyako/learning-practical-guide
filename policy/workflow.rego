package main

# ワークフローレベルのpermissionsが省略されていたら拒否
deny contains msg if {
    not input.permissions
    msg := "Workflow permissions are missing."
}

# ワークフローレベルのpermissionsで空以外が指定されていたら拒否
deny contains msg if {
    input.permissions != {}
    msg = sprintf("Workflow permissions are not empty: %v", [input.permissions])
}
