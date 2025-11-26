.class Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "EventTypeArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/EventTypeArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/EventTypeArg;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2131
    new-instance v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 2130
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/EventTypeArg;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 4159
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 4161
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 4162
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 4166
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 4167
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_1f9

    .line 4172
    const-string v2, "admin_alerting_alert_state_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4173
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ADMIN_ALERTING_ALERT_STATE_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4175
    :cond_1
    const-string v2, "admin_alerting_changed_alert_config"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 4176
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ADMIN_ALERTING_CHANGED_ALERT_CONFIG:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4178
    :cond_2
    const-string v2, "admin_alerting_triggered_alert"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 4179
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ADMIN_ALERTING_TRIGGERED_ALERT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4181
    :cond_3
    const-string v2, "ransomware_restore_process_completed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 4182
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RANSOMWARE_RESTORE_PROCESS_COMPLETED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4184
    :cond_4
    const-string v2, "ransomware_restore_process_started"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 4185
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RANSOMWARE_RESTORE_PROCESS_STARTED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4187
    :cond_5
    const-string v2, "app_blocked_by_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 4188
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APP_BLOCKED_BY_PERMISSIONS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4190
    :cond_6
    const-string v2, "app_link_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 4191
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APP_LINK_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4193
    :cond_7
    const-string v2, "app_link_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 4194
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APP_LINK_USER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4196
    :cond_8
    const-string v2, "app_unlink_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 4197
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APP_UNLINK_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4199
    :cond_9
    const-string v2, "app_unlink_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 4200
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APP_UNLINK_USER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4202
    :cond_a
    const-string v2, "integration_connected"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 4203
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->INTEGRATION_CONNECTED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4205
    :cond_b
    const-string v2, "integration_disconnected"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 4206
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->INTEGRATION_DISCONNECTED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4208
    :cond_c
    const-string v2, "file_add_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 4209
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_ADD_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4211
    :cond_d
    const-string v2, "file_change_comment_subscription"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 4212
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_CHANGE_COMMENT_SUBSCRIPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4214
    :cond_e
    const-string v2, "file_delete_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 4215
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_DELETE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4217
    :cond_f
    const-string v2, "file_edit_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 4218
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_EDIT_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4220
    :cond_10
    const-string v2, "file_like_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 4221
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_LIKE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4223
    :cond_11
    const-string v2, "file_resolve_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 4224
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_RESOLVE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4226
    :cond_12
    const-string v2, "file_unlike_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 4227
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_UNLIKE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4229
    :cond_13
    const-string v2, "file_unresolve_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 4230
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_UNRESOLVE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4232
    :cond_14
    const-string v2, "governance_policy_add_folders"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 4233
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_ADD_FOLDERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4235
    :cond_15
    const-string v2, "governance_policy_add_folder_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 4236
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_ADD_FOLDER_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4238
    :cond_16
    const-string v2, "governance_policy_content_disposed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 4239
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_CONTENT_DISPOSED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4241
    :cond_17
    const-string v2, "governance_policy_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 4242
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4244
    :cond_18
    const-string v2, "governance_policy_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 4245
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4247
    :cond_19
    const-string v2, "governance_policy_edit_details"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 4248
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_EDIT_DETAILS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4250
    :cond_1a
    const-string v2, "governance_policy_edit_duration"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 4251
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_EDIT_DURATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4253
    :cond_1b
    const-string v2, "governance_policy_export_created"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 4254
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_EXPORT_CREATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4256
    :cond_1c
    const-string v2, "governance_policy_export_removed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 4257
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_EXPORT_REMOVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4259
    :cond_1d
    const-string v2, "governance_policy_remove_folders"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 4260
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_REMOVE_FOLDERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4262
    :cond_1e
    const-string v2, "governance_policy_report_created"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 4263
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_REPORT_CREATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4265
    :cond_1f
    const-string v2, "governance_policy_zip_part_downloaded"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 4266
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOVERNANCE_POLICY_ZIP_PART_DOWNLOADED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4268
    :cond_20
    const-string v2, "legal_holds_activate_a_hold"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 4269
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_ACTIVATE_A_HOLD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4271
    :cond_21
    const-string v2, "legal_holds_add_members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 4272
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_ADD_MEMBERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4274
    :cond_22
    const-string v2, "legal_holds_change_hold_details"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 4275
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_CHANGE_HOLD_DETAILS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4277
    :cond_23
    const-string v2, "legal_holds_change_hold_name"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 4278
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_CHANGE_HOLD_NAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4280
    :cond_24
    const-string v2, "legal_holds_export_a_hold"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 4281
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_EXPORT_A_HOLD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4283
    :cond_25
    const-string v2, "legal_holds_export_cancelled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 4284
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_EXPORT_CANCELLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4286
    :cond_26
    const-string v2, "legal_holds_export_downloaded"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 4287
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_EXPORT_DOWNLOADED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4289
    :cond_27
    const-string v2, "legal_holds_export_removed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 4290
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_EXPORT_REMOVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4292
    :cond_28
    const-string v2, "legal_holds_release_a_hold"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 4293
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_RELEASE_A_HOLD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4295
    :cond_29
    const-string v2, "legal_holds_remove_members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 4296
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_REMOVE_MEMBERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4298
    :cond_2a
    const-string v2, "legal_holds_report_a_hold"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 4299
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LEGAL_HOLDS_REPORT_A_HOLD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4301
    :cond_2b
    const-string v2, "device_change_ip_desktop"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 4302
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_CHANGE_IP_DESKTOP:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4304
    :cond_2c
    const-string v2, "device_change_ip_mobile"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 4305
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_CHANGE_IP_MOBILE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4307
    :cond_2d
    const-string v2, "device_change_ip_web"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 4308
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_CHANGE_IP_WEB:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4310
    :cond_2e
    const-string v2, "device_delete_on_unlink_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 4311
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_DELETE_ON_UNLINK_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4313
    :cond_2f
    const-string v2, "device_delete_on_unlink_success"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 4314
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_DELETE_ON_UNLINK_SUCCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4316
    :cond_30
    const-string v2, "device_link_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 4317
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_LINK_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4319
    :cond_31
    const-string v2, "device_link_success"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 4320
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_LINK_SUCCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4322
    :cond_32
    const-string v2, "device_management_disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 4323
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_MANAGEMENT_DISABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4325
    :cond_33
    const-string v2, "device_management_enabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 4326
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_MANAGEMENT_ENABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4328
    :cond_34
    const-string v2, "device_sync_backup_status_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_35

    .line 4329
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_SYNC_BACKUP_STATUS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4331
    :cond_35
    const-string v2, "device_unlink"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 4332
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_UNLINK:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4334
    :cond_36
    const-string v2, "dropbox_passwords_exported"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 4335
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DROPBOX_PASSWORDS_EXPORTED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4337
    :cond_37
    const-string v2, "dropbox_passwords_new_device_enrolled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 4338
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DROPBOX_PASSWORDS_NEW_DEVICE_ENROLLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4340
    :cond_38
    const-string v2, "emm_refresh_auth_token"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 4341
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_REFRESH_AUTH_TOKEN:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4343
    :cond_39
    const-string v2, "external_drive_backup_eligibility_status_checked"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 4344
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXTERNAL_DRIVE_BACKUP_ELIGIBILITY_STATUS_CHECKED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4346
    :cond_3a
    const-string v2, "external_drive_backup_status_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 4347
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXTERNAL_DRIVE_BACKUP_STATUS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4349
    :cond_3b
    const-string v2, "account_capture_change_availability"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 4350
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ACCOUNT_CAPTURE_CHANGE_AVAILABILITY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4352
    :cond_3c
    const-string v2, "account_capture_migrate_account"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 4353
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ACCOUNT_CAPTURE_MIGRATE_ACCOUNT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4355
    :cond_3d
    const-string v2, "account_capture_notification_emails_sent"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 4356
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ACCOUNT_CAPTURE_NOTIFICATION_EMAILS_SENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4358
    :cond_3e
    const-string v2, "account_capture_relinquish_account"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 4359
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ACCOUNT_CAPTURE_RELINQUISH_ACCOUNT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4361
    :cond_3f
    const-string v2, "disabled_domain_invites"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 4362
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DISABLED_DOMAIN_INVITES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4364
    :cond_40
    const-string v2, "domain_invites_approve_request_to_join_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 4365
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_INVITES_APPROVE_REQUEST_TO_JOIN_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4367
    :cond_41
    const-string v2, "domain_invites_decline_request_to_join_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_42

    .line 4368
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_INVITES_DECLINE_REQUEST_TO_JOIN_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4370
    :cond_42
    const-string v2, "domain_invites_email_existing_users"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    .line 4371
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_INVITES_EMAIL_EXISTING_USERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4373
    :cond_43
    const-string v2, "domain_invites_request_to_join_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_44

    .line 4374
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_INVITES_REQUEST_TO_JOIN_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4376
    :cond_44
    const-string v2, "domain_invites_set_invite_new_user_pref_to_no"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 4377
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_INVITES_SET_INVITE_NEW_USER_PREF_TO_NO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4379
    :cond_45
    const-string v2, "domain_invites_set_invite_new_user_pref_to_yes"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 4380
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_INVITES_SET_INVITE_NEW_USER_PREF_TO_YES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4382
    :cond_46
    const-string v2, "domain_verification_add_domain_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_47

    .line 4383
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_VERIFICATION_ADD_DOMAIN_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4385
    :cond_47
    const-string v2, "domain_verification_add_domain_success"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 4386
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_VERIFICATION_ADD_DOMAIN_SUCCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4388
    :cond_48
    const-string v2, "domain_verification_remove_domain"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_49

    .line 4389
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DOMAIN_VERIFICATION_REMOVE_DOMAIN:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4391
    :cond_49
    const-string v2, "enabled_domain_invites"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 4392
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ENABLED_DOMAIN_INVITES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4394
    :cond_4a
    const-string v2, "team_encryption_key_cancel_key_deletion"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 4395
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_CANCEL_KEY_DELETION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4397
    :cond_4b
    const-string v2, "team_encryption_key_create_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4c

    .line 4398
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_CREATE_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4400
    :cond_4c
    const-string v2, "team_encryption_key_delete_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 4401
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_DELETE_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4403
    :cond_4d
    const-string v2, "team_encryption_key_disable_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 4404
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_DISABLE_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4406
    :cond_4e
    const-string v2, "team_encryption_key_enable_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 4407
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_ENABLE_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4409
    :cond_4f
    const-string v2, "team_encryption_key_rotate_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 4410
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_ROTATE_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4412
    :cond_50
    const-string v2, "team_encryption_key_schedule_key_deletion"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 4413
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ENCRYPTION_KEY_SCHEDULE_KEY_DELETION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4415
    :cond_51
    const-string v2, "apply_naming_convention"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 4416
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APPLY_NAMING_CONVENTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4418
    :cond_52
    const-string v2, "create_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_53

    .line 4419
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CREATE_FOLDER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4421
    :cond_53
    const-string v2, "file_add"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_54

    .line 4422
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_ADD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4424
    :cond_54
    const-string v2, "file_add_from_automation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    .line 4425
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_ADD_FROM_AUTOMATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4427
    :cond_55
    const-string v2, "file_copy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 4428
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_COPY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4430
    :cond_56
    const-string v2, "file_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 4431
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4433
    :cond_57
    const-string v2, "file_download"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 4434
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_DOWNLOAD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4436
    :cond_58
    const-string v2, "file_edit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_59

    .line 4437
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_EDIT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4439
    :cond_59
    const-string v2, "file_get_copy_reference"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 4440
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_GET_COPY_REFERENCE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4442
    :cond_5a
    const-string v2, "file_locking_lock_status_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5b

    .line 4443
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_LOCKING_LOCK_STATUS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4445
    :cond_5b
    const-string v2, "file_move"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 4446
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_MOVE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4448
    :cond_5c
    const-string v2, "file_permanently_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 4449
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_PERMANENTLY_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4451
    :cond_5d
    const-string v2, "file_preview"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 4452
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_PREVIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4454
    :cond_5e
    const-string v2, "file_rename"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 4455
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_RENAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4457
    :cond_5f
    const-string v2, "file_restore"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_60

    .line 4458
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_RESTORE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4460
    :cond_60
    const-string v2, "file_revert"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_61

    .line 4461
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REVERT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4463
    :cond_61
    const-string v2, "file_rollback_changes"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_62

    .line 4464
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_ROLLBACK_CHANGES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4466
    :cond_62
    const-string v2, "file_save_copy_reference"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_63

    .line 4467
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_SAVE_COPY_REFERENCE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4469
    :cond_63
    const-string v2, "folder_overview_description_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_64

    .line 4470
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FOLDER_OVERVIEW_DESCRIPTION_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4472
    :cond_64
    const-string v2, "folder_overview_item_pinned"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_65

    .line 4473
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FOLDER_OVERVIEW_ITEM_PINNED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4475
    :cond_65
    const-string v2, "folder_overview_item_unpinned"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_66

    .line 4476
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FOLDER_OVERVIEW_ITEM_UNPINNED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4478
    :cond_66
    const-string v2, "object_label_added"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_67

    .line 4479
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OBJECT_LABEL_ADDED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4481
    :cond_67
    const-string v2, "object_label_removed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_68

    .line 4482
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OBJECT_LABEL_REMOVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4484
    :cond_68
    const-string v2, "object_label_updated_value"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_69

    .line 4485
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OBJECT_LABEL_UPDATED_VALUE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4487
    :cond_69
    const-string v2, "organize_folder_with_tidy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6a

    .line 4488
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ORGANIZE_FOLDER_WITH_TIDY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4490
    :cond_6a
    const-string v2, "replay_file_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6b

    .line 4491
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REPLAY_FILE_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4493
    :cond_6b
    const-string v2, "rewind_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6c

    .line 4494
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REWIND_FOLDER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4496
    :cond_6c
    const-string v2, "undo_naming_convention"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6d

    .line 4497
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->UNDO_NAMING_CONVENTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4499
    :cond_6d
    const-string v2, "undo_organize_folder_with_tidy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6e

    .line 4500
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->UNDO_ORGANIZE_FOLDER_WITH_TIDY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4502
    :cond_6e
    const-string v2, "user_tags_added"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 4503
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->USER_TAGS_ADDED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4505
    :cond_6f
    const-string v2, "user_tags_removed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_70

    .line 4506
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->USER_TAGS_REMOVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4508
    :cond_70
    const-string v2, "email_ingest_receive_file"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 4509
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMAIL_INGEST_RECEIVE_FILE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4511
    :cond_71
    const-string v2, "file_request_change"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_72

    .line 4512
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUEST_CHANGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4514
    :cond_72
    const-string v2, "file_request_close"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_73

    .line 4515
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUEST_CLOSE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4517
    :cond_73
    const-string v2, "file_request_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_74

    .line 4518
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUEST_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4520
    :cond_74
    const-string v2, "file_request_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_75

    .line 4521
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUEST_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4523
    :cond_75
    const-string v2, "file_request_receive_file"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_76

    .line 4524
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUEST_RECEIVE_FILE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4526
    :cond_76
    const-string v2, "group_add_external_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_77

    .line 4527
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_ADD_EXTERNAL_ID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4529
    :cond_77
    const-string v2, "group_add_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_78

    .line 4530
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_ADD_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4532
    :cond_78
    const-string v2, "group_change_external_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_79

    .line 4533
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_CHANGE_EXTERNAL_ID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4535
    :cond_79
    const-string v2, "group_change_management_type"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7a

    .line 4536
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_CHANGE_MANAGEMENT_TYPE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4538
    :cond_7a
    const-string v2, "group_change_member_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7b

    .line 4539
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_CHANGE_MEMBER_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4541
    :cond_7b
    const-string v2, "group_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7c

    .line 4542
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4544
    :cond_7c
    const-string v2, "group_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7d

    .line 4545
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4547
    :cond_7d
    const-string v2, "group_description_updated"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7e

    .line 4548
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_DESCRIPTION_UPDATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4550
    :cond_7e
    const-string v2, "group_join_policy_updated"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 4551
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_JOIN_POLICY_UPDATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4553
    :cond_7f
    const-string v2, "group_moved"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_80

    .line 4554
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_MOVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4556
    :cond_80
    const-string v2, "group_remove_external_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 4557
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_REMOVE_EXTERNAL_ID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4559
    :cond_81
    const-string v2, "group_remove_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_82

    .line 4560
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_REMOVE_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4562
    :cond_82
    const-string v2, "group_rename"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_83

    .line 4563
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_RENAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4565
    :cond_83
    const-string v2, "account_lock_or_unlocked"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_84

    .line 4566
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ACCOUNT_LOCK_OR_UNLOCKED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4568
    :cond_84
    const-string v2, "emm_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 4569
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_ERROR:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4571
    :cond_85
    const-string v2, "guest_admin_signed_in_via_trusted_teams"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_86

    .line 4572
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GUEST_ADMIN_SIGNED_IN_VIA_TRUSTED_TEAMS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4574
    :cond_86
    const-string v2, "guest_admin_signed_out_via_trusted_teams"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_87

    .line 4575
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GUEST_ADMIN_SIGNED_OUT_VIA_TRUSTED_TEAMS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4577
    :cond_87
    const-string v2, "login_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_88

    .line 4578
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LOGIN_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4580
    :cond_88
    const-string v2, "login_success"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_89

    .line 4581
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LOGIN_SUCCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4583
    :cond_89
    const-string v2, "logout"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8a

    .line 4584
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->LOGOUT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4586
    :cond_8a
    const-string v2, "reseller_support_session_end"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8b

    .line 4587
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RESELLER_SUPPORT_SESSION_END:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4589
    :cond_8b
    const-string v2, "reseller_support_session_start"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 4590
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RESELLER_SUPPORT_SESSION_START:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4592
    :cond_8c
    const-string v2, "sign_in_as_session_end"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8d

    .line 4593
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SIGN_IN_AS_SESSION_END:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4595
    :cond_8d
    const-string v2, "sign_in_as_session_start"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8e

    .line 4596
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SIGN_IN_AS_SESSION_START:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4598
    :cond_8e
    const-string v2, "sso_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8f

    .line 4599
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_ERROR:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4601
    :cond_8f
    const-string v2, "backup_admin_invitation_sent"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_90

    .line 4602
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BACKUP_ADMIN_INVITATION_SENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4604
    :cond_90
    const-string v2, "backup_invitation_opened"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_91

    .line 4605
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BACKUP_INVITATION_OPENED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4607
    :cond_91
    const-string v2, "create_team_invite_link"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_92

    .line 4608
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CREATE_TEAM_INVITE_LINK:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4610
    :cond_92
    const-string v2, "delete_team_invite_link"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_93

    .line 4611
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DELETE_TEAM_INVITE_LINK:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4613
    :cond_93
    const-string v2, "member_add_external_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_94

    .line 4614
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_ADD_EXTERNAL_ID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4616
    :cond_94
    const-string v2, "member_add_name"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_95

    .line 4617
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_ADD_NAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4619
    :cond_95
    const-string v2, "member_change_admin_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_96

    .line 4620
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_ADMIN_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4622
    :cond_96
    const-string v2, "member_change_email"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_97

    .line 4623
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_EMAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4625
    :cond_97
    const-string v2, "member_change_external_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_98

    .line 4626
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_EXTERNAL_ID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4628
    :cond_98
    const-string v2, "member_change_membership_type"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_99

    .line 4629
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_MEMBERSHIP_TYPE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4631
    :cond_99
    const-string v2, "member_change_name"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9a

    .line 4632
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_NAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4634
    :cond_9a
    const-string v2, "member_change_reseller_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9b

    .line 4635
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_RESELLER_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4637
    :cond_9b
    const-string v2, "member_change_status"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9c

    .line 4638
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_CHANGE_STATUS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4640
    :cond_9c
    const-string v2, "member_delete_manual_contacts"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9d

    .line 4641
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_DELETE_MANUAL_CONTACTS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4643
    :cond_9d
    const-string v2, "member_delete_profile_photo"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9e

    .line 4644
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_DELETE_PROFILE_PHOTO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4646
    :cond_9e
    const-string v2, "member_permanently_delete_account_contents"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9f

    .line 4647
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_PERMANENTLY_DELETE_ACCOUNT_CONTENTS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4649
    :cond_9f
    const-string v2, "member_remove_external_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a0

    .line 4650
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_REMOVE_EXTERNAL_ID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4652
    :cond_a0
    const-string v2, "member_set_profile_photo"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a1

    .line 4653
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SET_PROFILE_PHOTO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4655
    :cond_a1
    const-string v2, "member_space_limits_add_custom_quota"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a2

    .line 4656
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_ADD_CUSTOM_QUOTA:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4658
    :cond_a2
    const-string v2, "member_space_limits_change_custom_quota"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a3

    .line 4659
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_CHANGE_CUSTOM_QUOTA:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4661
    :cond_a3
    const-string v2, "member_space_limits_change_status"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a4

    .line 4662
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_CHANGE_STATUS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4664
    :cond_a4
    const-string v2, "member_space_limits_remove_custom_quota"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a5

    .line 4665
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_REMOVE_CUSTOM_QUOTA:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4667
    :cond_a5
    const-string v2, "member_suggest"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a6

    .line 4668
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SUGGEST:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4670
    :cond_a6
    const-string v2, "member_transfer_account_contents"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a7

    .line 4671
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_TRANSFER_ACCOUNT_CONTENTS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4673
    :cond_a7
    const-string v2, "pending_secondary_email_added"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a8

    .line 4674
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PENDING_SECONDARY_EMAIL_ADDED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4676
    :cond_a8
    const-string v2, "secondary_email_deleted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a9

    .line 4677
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SECONDARY_EMAIL_DELETED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4679
    :cond_a9
    const-string v2, "secondary_email_verified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_aa

    .line 4680
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SECONDARY_EMAIL_VERIFIED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4682
    :cond_aa
    const-string v2, "secondary_mails_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ab

    .line 4683
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SECONDARY_MAILS_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4685
    :cond_ab
    const-string v2, "binder_add_page"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ac

    .line 4686
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_ADD_PAGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4688
    :cond_ac
    const-string v2, "binder_add_section"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ad

    .line 4689
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_ADD_SECTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4691
    :cond_ad
    const-string v2, "binder_remove_page"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ae

    .line 4692
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_REMOVE_PAGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4694
    :cond_ae
    const-string v2, "binder_remove_section"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_af

    .line 4695
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_REMOVE_SECTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4697
    :cond_af
    const-string v2, "binder_rename_page"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b0

    .line 4698
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_RENAME_PAGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4700
    :cond_b0
    const-string v2, "binder_rename_section"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b1

    .line 4701
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_RENAME_SECTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4703
    :cond_b1
    const-string v2, "binder_reorder_page"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b2

    .line 4704
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_REORDER_PAGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4706
    :cond_b2
    const-string v2, "binder_reorder_section"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b3

    .line 4707
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->BINDER_REORDER_SECTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4709
    :cond_b3
    const-string v2, "paper_content_add_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b4

    .line 4710
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_ADD_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4712
    :cond_b4
    const-string v2, "paper_content_add_to_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b5

    .line 4713
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_ADD_TO_FOLDER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4715
    :cond_b5
    const-string v2, "paper_content_archive"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b6

    .line 4716
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_ARCHIVE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4718
    :cond_b6
    const-string v2, "paper_content_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b7

    .line 4719
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4721
    :cond_b7
    const-string v2, "paper_content_permanently_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b8

    .line 4722
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_PERMANENTLY_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4724
    :cond_b8
    const-string v2, "paper_content_remove_from_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b9

    .line 4725
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_REMOVE_FROM_FOLDER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4727
    :cond_b9
    const-string v2, "paper_content_remove_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ba

    .line 4728
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_REMOVE_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4730
    :cond_ba
    const-string v2, "paper_content_rename"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bb

    .line 4731
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_RENAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4733
    :cond_bb
    const-string v2, "paper_content_restore"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bc

    .line 4734
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CONTENT_RESTORE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4736
    :cond_bc
    const-string v2, "paper_doc_add_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bd

    .line 4737
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_ADD_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4739
    :cond_bd
    const-string v2, "paper_doc_change_member_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_be

    .line 4740
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_CHANGE_MEMBER_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4742
    :cond_be
    const-string v2, "paper_doc_change_sharing_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bf

    .line 4743
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_CHANGE_SHARING_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4745
    :cond_bf
    const-string v2, "paper_doc_change_subscription"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c0

    .line 4746
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_CHANGE_SUBSCRIPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4748
    :cond_c0
    const-string v2, "paper_doc_deleted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c1

    .line 4749
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_DELETED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4751
    :cond_c1
    const-string v2, "paper_doc_delete_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c2

    .line 4752
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_DELETE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4754
    :cond_c2
    const-string v2, "paper_doc_download"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c3

    .line 4755
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_DOWNLOAD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4757
    :cond_c3
    const-string v2, "paper_doc_edit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c4

    .line 4758
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_EDIT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4760
    :cond_c4
    const-string v2, "paper_doc_edit_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c5

    .line 4761
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_EDIT_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4763
    :cond_c5
    const-string v2, "paper_doc_followed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c6

    .line 4764
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_FOLLOWED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4766
    :cond_c6
    const-string v2, "paper_doc_mention"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c7

    .line 4767
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_MENTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4769
    :cond_c7
    const-string v2, "paper_doc_ownership_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c8

    .line 4770
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_OWNERSHIP_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4772
    :cond_c8
    const-string v2, "paper_doc_request_access"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c9

    .line 4773
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_REQUEST_ACCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4775
    :cond_c9
    const-string v2, "paper_doc_resolve_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ca

    .line 4776
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_RESOLVE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4778
    :cond_ca
    const-string v2, "paper_doc_revert"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cb

    .line 4779
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_REVERT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4781
    :cond_cb
    const-string v2, "paper_doc_slack_share"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cc

    .line 4782
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_SLACK_SHARE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4784
    :cond_cc
    const-string v2, "paper_doc_team_invite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cd

    .line 4785
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_TEAM_INVITE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4787
    :cond_cd
    const-string v2, "paper_doc_trashed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ce

    .line 4788
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_TRASHED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4790
    :cond_ce
    const-string v2, "paper_doc_unresolve_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cf

    .line 4791
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_UNRESOLVE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4793
    :cond_cf
    const-string v2, "paper_doc_untrashed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d0

    .line 4794
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_UNTRASHED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4796
    :cond_d0
    const-string v2, "paper_doc_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d1

    .line 4797
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DOC_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4799
    :cond_d1
    const-string v2, "paper_external_view_allow"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d2

    .line 4800
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_EXTERNAL_VIEW_ALLOW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4802
    :cond_d2
    const-string v2, "paper_external_view_default_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d3

    .line 4803
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_EXTERNAL_VIEW_DEFAULT_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4805
    :cond_d3
    const-string v2, "paper_external_view_forbid"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d4

    .line 4806
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_EXTERNAL_VIEW_FORBID:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4808
    :cond_d4
    const-string v2, "paper_folder_change_subscription"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d5

    .line 4809
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_FOLDER_CHANGE_SUBSCRIPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4811
    :cond_d5
    const-string v2, "paper_folder_deleted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d6

    .line 4812
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_FOLDER_DELETED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4814
    :cond_d6
    const-string v2, "paper_folder_followed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d7

    .line 4815
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_FOLDER_FOLLOWED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4817
    :cond_d7
    const-string v2, "paper_folder_team_invite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d8

    .line 4818
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_FOLDER_TEAM_INVITE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4820
    :cond_d8
    const-string v2, "paper_published_link_change_permission"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d9

    .line 4821
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_PUBLISHED_LINK_CHANGE_PERMISSION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4823
    :cond_d9
    const-string v2, "paper_published_link_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_da

    .line 4824
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_PUBLISHED_LINK_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4826
    :cond_da
    const-string v2, "paper_published_link_disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_db

    .line 4827
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_PUBLISHED_LINK_DISABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4829
    :cond_db
    const-string v2, "paper_published_link_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_dc

    .line 4830
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_PUBLISHED_LINK_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4832
    :cond_dc
    const-string v2, "password_change"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_dd

    .line 4833
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PASSWORD_CHANGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4835
    :cond_dd
    const-string v2, "password_reset"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_de

    .line 4836
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PASSWORD_RESET:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4838
    :cond_de
    const-string v2, "password_reset_all"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_df

    .line 4839
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PASSWORD_RESET_ALL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4841
    :cond_df
    const-string v2, "classification_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e0

    .line 4842
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CLASSIFICATION_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4844
    :cond_e0
    const-string v2, "classification_create_report_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e1

    .line 4845
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CLASSIFICATION_CREATE_REPORT_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4847
    :cond_e1
    const-string v2, "emm_create_exceptions_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e2

    .line 4848
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_CREATE_EXCEPTIONS_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4850
    :cond_e2
    const-string v2, "emm_create_usage_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e3

    .line 4851
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_CREATE_USAGE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4853
    :cond_e3
    const-string v2, "export_members_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e4

    .line 4854
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXPORT_MEMBERS_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4856
    :cond_e4
    const-string v2, "export_members_report_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e5

    .line 4857
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXPORT_MEMBERS_REPORT_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4859
    :cond_e5
    const-string v2, "external_sharing_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e6

    .line 4860
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXTERNAL_SHARING_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4862
    :cond_e6
    const-string v2, "external_sharing_report_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e7

    .line 4863
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXTERNAL_SHARING_REPORT_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4865
    :cond_e7
    const-string v2, "no_expiration_link_gen_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e8

    .line 4866
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NO_EXPIRATION_LINK_GEN_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4868
    :cond_e8
    const-string v2, "no_expiration_link_gen_report_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e9

    .line 4869
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NO_EXPIRATION_LINK_GEN_REPORT_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4871
    :cond_e9
    const-string v2, "no_password_link_gen_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ea

    .line 4872
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NO_PASSWORD_LINK_GEN_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4874
    :cond_ea
    const-string v2, "no_password_link_gen_report_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_eb

    .line 4875
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NO_PASSWORD_LINK_GEN_REPORT_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4877
    :cond_eb
    const-string v2, "no_password_link_view_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ec

    .line 4878
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NO_PASSWORD_LINK_VIEW_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4880
    :cond_ec
    const-string v2, "no_password_link_view_report_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ed

    .line 4881
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NO_PASSWORD_LINK_VIEW_REPORT_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4883
    :cond_ed
    const-string v2, "outdated_link_view_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ee

    .line 4884
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OUTDATED_LINK_VIEW_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4886
    :cond_ee
    const-string v2, "outdated_link_view_report_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ef

    .line 4887
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OUTDATED_LINK_VIEW_REPORT_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4889
    :cond_ef
    const-string v2, "paper_admin_export_start"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f0

    .line 4890
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_ADMIN_EXPORT_START:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4892
    :cond_f0
    const-string v2, "ransomware_alert_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f1

    .line 4893
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RANSOMWARE_ALERT_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4895
    :cond_f1
    const-string v2, "ransomware_alert_create_report_failed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f2

    .line 4896
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RANSOMWARE_ALERT_CREATE_REPORT_FAILED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4898
    :cond_f2
    const-string v2, "smart_sync_create_admin_privilege_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f3

    .line 4899
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SMART_SYNC_CREATE_ADMIN_PRIVILEGE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4901
    :cond_f3
    const-string v2, "team_activity_create_report"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f4

    .line 4902
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ACTIVITY_CREATE_REPORT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4904
    :cond_f4
    const-string v2, "team_activity_create_report_fail"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f5

    .line 4905
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_ACTIVITY_CREATE_REPORT_FAIL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4907
    :cond_f5
    const-string v2, "collection_share"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f6

    .line 4908
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->COLLECTION_SHARE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4910
    :cond_f6
    const-string v2, "file_transfers_file_add"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f7

    .line 4911
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_TRANSFERS_FILE_ADD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4913
    :cond_f7
    const-string v2, "file_transfers_transfer_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f8

    .line 4914
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_TRANSFERS_TRANSFER_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4916
    :cond_f8
    const-string v2, "file_transfers_transfer_download"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f9

    .line 4917
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_TRANSFERS_TRANSFER_DOWNLOAD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4919
    :cond_f9
    const-string v2, "file_transfers_transfer_send"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fa

    .line 4920
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_TRANSFERS_TRANSFER_SEND:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4922
    :cond_fa
    const-string v2, "file_transfers_transfer_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fb

    .line 4923
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_TRANSFERS_TRANSFER_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4925
    :cond_fb
    const-string v2, "note_acl_invite_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fc

    .line 4926
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NOTE_ACL_INVITE_ONLY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4928
    :cond_fc
    const-string v2, "note_acl_link"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fd

    .line 4929
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NOTE_ACL_LINK:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4931
    :cond_fd
    const-string v2, "note_acl_team_link"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_fe

    .line 4932
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NOTE_ACL_TEAM_LINK:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4934
    :cond_fe
    const-string v2, "note_shared"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ff

    .line 4935
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NOTE_SHARED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4937
    :cond_ff
    const-string v2, "note_share_receive"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_100

    .line 4938
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NOTE_SHARE_RECEIVE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4940
    :cond_100
    const-string v2, "open_note_shared"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_101

    .line 4941
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OPEN_NOTE_SHARED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4943
    :cond_101
    const-string v2, "replay_file_shared_link_created"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_102

    .line 4944
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REPLAY_FILE_SHARED_LINK_CREATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4946
    :cond_102
    const-string v2, "replay_file_shared_link_modified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_103

    .line 4947
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REPLAY_FILE_SHARED_LINK_MODIFIED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4949
    :cond_103
    const-string v2, "replay_project_team_add"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_104

    .line 4950
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REPLAY_PROJECT_TEAM_ADD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4952
    :cond_104
    const-string v2, "replay_project_team_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_105

    .line 4953
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REPLAY_PROJECT_TEAM_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4955
    :cond_105
    const-string v2, "sf_add_group"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_106

    .line 4956
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_ADD_GROUP:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4958
    :cond_106
    const-string v2, "sf_allow_non_members_to_view_shared_links"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_107

    .line 4959
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_ALLOW_NON_MEMBERS_TO_VIEW_SHARED_LINKS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4961
    :cond_107
    const-string v2, "sf_external_invite_warn"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_108

    .line 4962
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_EXTERNAL_INVITE_WARN:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4964
    :cond_108
    const-string v2, "sf_fb_invite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_109

    .line 4965
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_FB_INVITE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4967
    :cond_109
    const-string v2, "sf_fb_invite_change_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10a

    .line 4968
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_FB_INVITE_CHANGE_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4970
    :cond_10a
    const-string v2, "sf_fb_uninvite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10b

    .line 4971
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_FB_UNINVITE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4973
    :cond_10b
    const-string v2, "sf_invite_group"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10c

    .line 4974
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_INVITE_GROUP:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4976
    :cond_10c
    const-string v2, "sf_team_grant_access"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10d

    .line 4977
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_TEAM_GRANT_ACCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4979
    :cond_10d
    const-string v2, "sf_team_invite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10e

    .line 4980
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_TEAM_INVITE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4982
    :cond_10e
    const-string v2, "sf_team_invite_change_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10f

    .line 4983
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_TEAM_INVITE_CHANGE_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4985
    :cond_10f
    const-string v2, "sf_team_join"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_110

    .line 4986
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_TEAM_JOIN:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4988
    :cond_110
    const-string v2, "sf_team_join_from_oob_link"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_111

    .line 4989
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_TEAM_JOIN_FROM_OOB_LINK:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4991
    :cond_111
    const-string v2, "sf_team_uninvite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_112

    .line 4992
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SF_TEAM_UNINVITE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4994
    :cond_112
    const-string v2, "shared_content_add_invitees"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_113

    .line 4995
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_ADD_INVITEES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 4997
    :cond_113
    const-string v2, "shared_content_add_link_expiry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_114

    .line 4998
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_ADD_LINK_EXPIRY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5000
    :cond_114
    const-string v2, "shared_content_add_link_password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_115

    .line 5001
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_ADD_LINK_PASSWORD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5003
    :cond_115
    const-string v2, "shared_content_add_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_116

    .line 5004
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_ADD_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5006
    :cond_116
    const-string v2, "shared_content_change_downloads_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_117

    .line 5007
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_DOWNLOADS_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5009
    :cond_117
    const-string v2, "shared_content_change_invitee_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_118

    .line 5010
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_INVITEE_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5012
    :cond_118
    const-string v2, "shared_content_change_link_audience"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_119

    .line 5013
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_LINK_AUDIENCE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5015
    :cond_119
    const-string v2, "shared_content_change_link_expiry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11a

    .line 5016
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_LINK_EXPIRY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5018
    :cond_11a
    const-string v2, "shared_content_change_link_password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11b

    .line 5019
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_LINK_PASSWORD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5021
    :cond_11b
    const-string v2, "shared_content_change_member_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11c

    .line 5022
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_MEMBER_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5024
    :cond_11c
    const-string v2, "shared_content_change_viewer_info_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11d

    .line 5025
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CHANGE_VIEWER_INFO_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5027
    :cond_11d
    const-string v2, "shared_content_claim_invitation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11e

    .line 5028
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_CLAIM_INVITATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5030
    :cond_11e
    const-string v2, "shared_content_copy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11f

    .line 5031
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_COPY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5033
    :cond_11f
    const-string v2, "shared_content_download"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_120

    .line 5034
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_DOWNLOAD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5036
    :cond_120
    const-string v2, "shared_content_relinquish_membership"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_121

    .line 5037
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_RELINQUISH_MEMBERSHIP:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5039
    :cond_121
    const-string v2, "shared_content_remove_invitees"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_122

    .line 5040
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_REMOVE_INVITEES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5042
    :cond_122
    const-string v2, "shared_content_remove_link_expiry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_123

    .line 5043
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_REMOVE_LINK_EXPIRY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5045
    :cond_123
    const-string v2, "shared_content_remove_link_password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_124

    .line 5046
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_REMOVE_LINK_PASSWORD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5048
    :cond_124
    const-string v2, "shared_content_remove_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_125

    .line 5049
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_REMOVE_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5051
    :cond_125
    const-string v2, "shared_content_request_access"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_126

    .line 5052
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_REQUEST_ACCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5054
    :cond_126
    const-string v2, "shared_content_restore_invitees"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_127

    .line 5055
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_RESTORE_INVITEES:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5057
    :cond_127
    const-string v2, "shared_content_restore_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_128

    .line 5058
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_RESTORE_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5060
    :cond_128
    const-string v2, "shared_content_unshare"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_129

    .line 5061
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_UNSHARE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5063
    :cond_129
    const-string v2, "shared_content_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12a

    .line 5064
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_CONTENT_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5066
    :cond_12a
    const-string v2, "shared_folder_change_link_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12b

    .line 5067
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_CHANGE_LINK_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5069
    :cond_12b
    const-string v2, "shared_folder_change_members_inheritance_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12c

    .line 5070
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_CHANGE_MEMBERS_INHERITANCE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5072
    :cond_12c
    const-string v2, "shared_folder_change_members_management_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12d

    .line 5073
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_CHANGE_MEMBERS_MANAGEMENT_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5075
    :cond_12d
    const-string v2, "shared_folder_change_members_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12e

    .line 5076
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_CHANGE_MEMBERS_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5078
    :cond_12e
    const-string v2, "shared_folder_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12f

    .line 5079
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5081
    :cond_12f
    const-string v2, "shared_folder_decline_invitation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_130

    .line 5082
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_DECLINE_INVITATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5084
    :cond_130
    const-string v2, "shared_folder_mount"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_131

    .line 5085
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_MOUNT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5087
    :cond_131
    const-string v2, "shared_folder_nest"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_132

    .line 5088
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_NEST:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5090
    :cond_132
    const-string v2, "shared_folder_transfer_ownership"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_133

    .line 5091
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5093
    :cond_133
    const-string v2, "shared_folder_unmount"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_134

    .line 5094
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_FOLDER_UNMOUNT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5096
    :cond_134
    const-string v2, "shared_link_add_expiry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_135

    .line 5097
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_ADD_EXPIRY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5099
    :cond_135
    const-string v2, "shared_link_change_expiry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_136

    .line 5100
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_CHANGE_EXPIRY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5102
    :cond_136
    const-string v2, "shared_link_change_visibility"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_137

    .line 5103
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_CHANGE_VISIBILITY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5105
    :cond_137
    const-string v2, "shared_link_copy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_138

    .line 5106
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_COPY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5108
    :cond_138
    const-string v2, "shared_link_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_139

    .line 5109
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5111
    :cond_139
    const-string v2, "shared_link_disable"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13a

    .line 5112
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_DISABLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5114
    :cond_13a
    const-string v2, "shared_link_download"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13b

    .line 5115
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_DOWNLOAD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5117
    :cond_13b
    const-string v2, "shared_link_remove_expiry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13c

    .line 5118
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_REMOVE_EXPIRY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5120
    :cond_13c
    const-string v2, "shared_link_settings_add_expiration"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13d

    .line 5121
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_ADD_EXPIRATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5123
    :cond_13d
    const-string v2, "shared_link_settings_add_password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13e

    .line 5124
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_ADD_PASSWORD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5126
    :cond_13e
    const-string v2, "shared_link_settings_allow_download_disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13f

    .line 5127
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_ALLOW_DOWNLOAD_DISABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5129
    :cond_13f
    const-string v2, "shared_link_settings_allow_download_enabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_140

    .line 5130
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_ALLOW_DOWNLOAD_ENABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5132
    :cond_140
    const-string v2, "shared_link_settings_change_audience"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_141

    .line 5133
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_CHANGE_AUDIENCE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5135
    :cond_141
    const-string v2, "shared_link_settings_change_expiration"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_142

    .line 5136
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_CHANGE_EXPIRATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5138
    :cond_142
    const-string v2, "shared_link_settings_change_password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_143

    .line 5139
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_CHANGE_PASSWORD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5141
    :cond_143
    const-string v2, "shared_link_settings_remove_expiration"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_144

    .line 5142
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_REMOVE_EXPIRATION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5144
    :cond_144
    const-string v2, "shared_link_settings_remove_password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_145

    .line 5145
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SETTINGS_REMOVE_PASSWORD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5147
    :cond_145
    const-string v2, "shared_link_share"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_146

    .line 5148
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_SHARE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5150
    :cond_146
    const-string v2, "shared_link_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    .line 5151
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_LINK_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5153
    :cond_147
    const-string v2, "shared_note_opened"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_148

    .line 5154
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARED_NOTE_OPENED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5156
    :cond_148
    const-string v2, "shmodel_disable_downloads"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_149

    .line 5157
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHMODEL_DISABLE_DOWNLOADS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5159
    :cond_149
    const-string v2, "shmodel_enable_downloads"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14a

    .line 5160
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHMODEL_ENABLE_DOWNLOADS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5162
    :cond_14a
    const-string v2, "shmodel_group_share"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14b

    .line 5163
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHMODEL_GROUP_SHARE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5165
    :cond_14b
    const-string v2, "showcase_access_granted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14c

    .line 5166
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_ACCESS_GRANTED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5168
    :cond_14c
    const-string v2, "showcase_add_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14d

    .line 5169
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_ADD_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5171
    :cond_14d
    const-string v2, "showcase_archived"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14e

    .line 5172
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_ARCHIVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5174
    :cond_14e
    const-string v2, "showcase_created"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14f

    .line 5175
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_CREATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5177
    :cond_14f
    const-string v2, "showcase_delete_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_150

    .line 5178
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_DELETE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5180
    :cond_150
    const-string v2, "showcase_edited"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_151

    .line 5181
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_EDITED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5183
    :cond_151
    const-string v2, "showcase_edit_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_152

    .line 5184
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_EDIT_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5186
    :cond_152
    const-string v2, "showcase_file_added"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_153

    .line 5187
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_FILE_ADDED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5189
    :cond_153
    const-string v2, "showcase_file_download"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_154

    .line 5190
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_FILE_DOWNLOAD:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5192
    :cond_154
    const-string v2, "showcase_file_removed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_155

    .line 5193
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_FILE_REMOVED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5195
    :cond_155
    const-string v2, "showcase_file_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_156

    .line 5196
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_FILE_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5198
    :cond_156
    const-string v2, "showcase_permanently_deleted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_157

    .line 5199
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_PERMANENTLY_DELETED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5201
    :cond_157
    const-string v2, "showcase_post_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_158

    .line 5202
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_POST_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5204
    :cond_158
    const-string v2, "showcase_remove_member"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_159

    .line 5205
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_REMOVE_MEMBER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5207
    :cond_159
    const-string v2, "showcase_renamed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15a

    .line 5208
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_RENAMED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5210
    :cond_15a
    const-string v2, "showcase_request_access"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15b

    .line 5211
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_REQUEST_ACCESS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5213
    :cond_15b
    const-string v2, "showcase_resolve_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15c

    .line 5214
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_RESOLVE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5216
    :cond_15c
    const-string v2, "showcase_restored"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15d

    .line 5217
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_RESTORED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5219
    :cond_15d
    const-string v2, "showcase_trashed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15e

    .line 5220
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_TRASHED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5222
    :cond_15e
    const-string v2, "showcase_trashed_deprecated"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15f

    .line 5223
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_TRASHED_DEPRECATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5225
    :cond_15f
    const-string v2, "showcase_unresolve_comment"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_160

    .line 5226
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_UNRESOLVE_COMMENT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5228
    :cond_160
    const-string v2, "showcase_untrashed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_161

    .line 5229
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_UNTRASHED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5231
    :cond_161
    const-string v2, "showcase_untrashed_deprecated"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_162

    .line 5232
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_UNTRASHED_DEPRECATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5234
    :cond_162
    const-string v2, "showcase_view"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_163

    .line 5235
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_VIEW:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5237
    :cond_163
    const-string v2, "sso_add_cert"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_164

    .line 5238
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_ADD_CERT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5240
    :cond_164
    const-string v2, "sso_add_login_url"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_165

    .line 5241
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_ADD_LOGIN_URL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5243
    :cond_165
    const-string v2, "sso_add_logout_url"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_166

    .line 5244
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_ADD_LOGOUT_URL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5246
    :cond_166
    const-string v2, "sso_change_cert"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_167

    .line 5247
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_CHANGE_CERT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5249
    :cond_167
    const-string v2, "sso_change_login_url"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_168

    .line 5250
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_CHANGE_LOGIN_URL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5252
    :cond_168
    const-string v2, "sso_change_logout_url"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_169

    .line 5253
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_CHANGE_LOGOUT_URL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5255
    :cond_169
    const-string v2, "sso_change_saml_identity_mode"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16a

    .line 5256
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_CHANGE_SAML_IDENTITY_MODE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5258
    :cond_16a
    const-string v2, "sso_remove_cert"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16b

    .line 5259
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_REMOVE_CERT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5261
    :cond_16b
    const-string v2, "sso_remove_login_url"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16c

    .line 5262
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_REMOVE_LOGIN_URL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5264
    :cond_16c
    const-string v2, "sso_remove_logout_url"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16d

    .line 5265
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_REMOVE_LOGOUT_URL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5267
    :cond_16d
    const-string v2, "team_folder_change_status"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16e

    .line 5268
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_FOLDER_CHANGE_STATUS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5270
    :cond_16e
    const-string v2, "team_folder_create"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16f

    .line 5271
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_FOLDER_CREATE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5273
    :cond_16f
    const-string v2, "team_folder_downgrade"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_170

    .line 5274
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_FOLDER_DOWNGRADE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5276
    :cond_170
    const-string v2, "team_folder_permanently_delete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_171

    .line 5277
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_FOLDER_PERMANENTLY_DELETE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5279
    :cond_171
    const-string v2, "team_folder_rename"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_172

    .line 5280
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_FOLDER_RENAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5282
    :cond_172
    const-string v2, "team_selective_sync_settings_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_173

    .line 5283
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_SELECTIVE_SYNC_SETTINGS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5285
    :cond_173
    const-string v2, "account_capture_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_174

    .line 5286
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ACCOUNT_CAPTURE_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5288
    :cond_174
    const-string v2, "admin_email_reminders_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_175

    .line 5289
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ADMIN_EMAIL_REMINDERS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5291
    :cond_175
    const-string v2, "allow_download_disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_176

    .line 5292
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ALLOW_DOWNLOAD_DISABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5294
    :cond_176
    const-string v2, "allow_download_enabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_177

    .line 5295
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ALLOW_DOWNLOAD_ENABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5297
    :cond_177
    const-string v2, "app_permissions_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_178

    .line 5298
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->APP_PERMISSIONS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5300
    :cond_178
    const-string v2, "camera_uploads_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_179

    .line 5301
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CAMERA_UPLOADS_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5303
    :cond_179
    const-string v2, "capture_transcript_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17a

    .line 5304
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CAPTURE_TRANSCRIPT_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5306
    :cond_17a
    const-string v2, "classification_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17b

    .line 5307
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CLASSIFICATION_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5309
    :cond_17b
    const-string v2, "computer_backup_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17c

    .line 5310
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->COMPUTER_BACKUP_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5312
    :cond_17c
    const-string v2, "content_administration_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17d

    .line 5313
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CONTENT_ADMINISTRATION_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5315
    :cond_17d
    const-string v2, "data_placement_restriction_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17e

    .line 5316
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DATA_PLACEMENT_RESTRICTION_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5318
    :cond_17e
    const-string v2, "data_placement_restriction_satisfy_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17f

    .line 5319
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DATA_PLACEMENT_RESTRICTION_SATISFY_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5321
    :cond_17f
    const-string v2, "device_approvals_add_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_180

    .line 5322
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_APPROVALS_ADD_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5324
    :cond_180
    const-string v2, "device_approvals_change_desktop_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_181

    .line 5325
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_APPROVALS_CHANGE_DESKTOP_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5327
    :cond_181
    const-string v2, "device_approvals_change_mobile_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_182

    .line 5328
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_APPROVALS_CHANGE_MOBILE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5330
    :cond_182
    const-string v2, "device_approvals_change_overage_action"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_183

    .line 5331
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_APPROVALS_CHANGE_OVERAGE_ACTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5333
    :cond_183
    const-string v2, "device_approvals_change_unlink_action"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_184

    .line 5334
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_APPROVALS_CHANGE_UNLINK_ACTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5336
    :cond_184
    const-string v2, "device_approvals_remove_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_185

    .line 5337
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DEVICE_APPROVALS_REMOVE_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5339
    :cond_185
    const-string v2, "directory_restrictions_add_members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_186

    .line 5340
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DIRECTORY_RESTRICTIONS_ADD_MEMBERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5342
    :cond_186
    const-string v2, "directory_restrictions_remove_members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_187

    .line 5343
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DIRECTORY_RESTRICTIONS_REMOVE_MEMBERS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5345
    :cond_187
    const-string v2, "dropbox_passwords_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_188

    .line 5346
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DROPBOX_PASSWORDS_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5348
    :cond_188
    const-string v2, "email_ingest_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_189

    .line 5349
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMAIL_INGEST_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5351
    :cond_189
    const-string v2, "emm_add_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18a

    .line 5352
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_ADD_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5354
    :cond_18a
    const-string v2, "emm_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18b

    .line 5355
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5357
    :cond_18b
    const-string v2, "emm_remove_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18c

    .line 5358
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EMM_REMOVE_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5360
    :cond_18c
    const-string v2, "extended_version_history_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18d

    .line 5361
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXTENDED_VERSION_HISTORY_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5363
    :cond_18d
    const-string v2, "external_drive_backup_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18e

    .line 5364
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->EXTERNAL_DRIVE_BACKUP_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5366
    :cond_18e
    const-string v2, "file_comments_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18f

    .line 5367
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_COMMENTS_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5369
    :cond_18f
    const-string v2, "file_locking_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_190

    .line 5370
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_LOCKING_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5372
    :cond_190
    const-string v2, "file_provider_migration_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_191

    .line 5373
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_PROVIDER_MIGRATION_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5375
    :cond_191
    const-string v2, "file_requests_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_192

    .line 5376
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUESTS_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5378
    :cond_192
    const-string v2, "file_requests_emails_enabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_193

    .line 5379
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUESTS_EMAILS_ENABLED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5381
    :cond_193
    const-string v2, "file_requests_emails_restricted_to_team_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_194

    .line 5382
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_REQUESTS_EMAILS_RESTRICTED_TO_TEAM_ONLY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5384
    :cond_194
    const-string v2, "file_transfers_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_195

    .line 5385
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FILE_TRANSFERS_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5387
    :cond_195
    const-string v2, "folder_link_restriction_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_196

    .line 5388
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->FOLDER_LINK_RESTRICTION_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5390
    :cond_196
    const-string v2, "google_sso_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_197

    .line 5391
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GOOGLE_SSO_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5393
    :cond_197
    const-string v2, "group_user_management_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_198

    .line 5394
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GROUP_USER_MANAGEMENT_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5396
    :cond_198
    const-string v2, "integration_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_199

    .line 5397
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->INTEGRATION_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5399
    :cond_199
    const-string v2, "invite_acceptance_email_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19a

    .line 5400
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->INVITE_ACCEPTANCE_EMAIL_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5402
    :cond_19a
    const-string v2, "member_requests_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19b

    .line 5403
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_REQUESTS_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5405
    :cond_19b
    const-string v2, "member_send_invite_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19c

    .line 5406
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SEND_INVITE_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5408
    :cond_19c
    const-string v2, "member_space_limits_add_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19d

    .line 5409
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_ADD_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5411
    :cond_19d
    const-string v2, "member_space_limits_change_caps_type_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19e

    .line 5412
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_CHANGE_CAPS_TYPE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5414
    :cond_19e
    const-string v2, "member_space_limits_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19f

    .line 5415
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5417
    :cond_19f
    const-string v2, "member_space_limits_remove_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a0

    .line 5418
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SPACE_LIMITS_REMOVE_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5420
    :cond_1a0
    const-string v2, "member_suggestions_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a1

    .line 5421
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MEMBER_SUGGESTIONS_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5423
    :cond_1a1
    const-string v2, "microsoft_office_addin_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a2

    .line 5424
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->MICROSOFT_OFFICE_ADDIN_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5426
    :cond_1a2
    const-string v2, "network_control_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a3

    .line 5427
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->NETWORK_CONTROL_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5429
    :cond_1a3
    const-string v2, "paper_change_deployment_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a4

    .line 5430
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CHANGE_DEPLOYMENT_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5432
    :cond_1a4
    const-string v2, "paper_change_member_link_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a5

    .line 5433
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CHANGE_MEMBER_LINK_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5435
    :cond_1a5
    const-string v2, "paper_change_member_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a6

    .line 5436
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CHANGE_MEMBER_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5438
    :cond_1a6
    const-string v2, "paper_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a7

    .line 5439
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5441
    :cond_1a7
    const-string v2, "paper_default_folder_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a8

    .line 5442
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DEFAULT_FOLDER_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5444
    :cond_1a8
    const-string v2, "paper_desktop_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a9

    .line 5445
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_DESKTOP_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5447
    :cond_1a9
    const-string v2, "paper_enabled_users_group_addition"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1aa

    .line 5448
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_ENABLED_USERS_GROUP_ADDITION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5450
    :cond_1aa
    const-string v2, "paper_enabled_users_group_removal"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ab

    .line 5451
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PAPER_ENABLED_USERS_GROUP_REMOVAL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5453
    :cond_1ab
    const-string v2, "password_strength_requirements_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ac

    .line 5454
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PASSWORD_STRENGTH_REQUIREMENTS_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5456
    :cond_1ac
    const-string v2, "permanent_delete_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ad

    .line 5457
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->PERMANENT_DELETE_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5459
    :cond_1ad
    const-string v2, "reseller_support_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ae

    .line 5460
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->RESELLER_SUPPORT_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5462
    :cond_1ae
    const-string v2, "rewind_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1af

    .line 5463
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->REWIND_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5465
    :cond_1af
    const-string v2, "send_for_signature_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b0

    .line 5466
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SEND_FOR_SIGNATURE_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5468
    :cond_1b0
    const-string v2, "sharing_change_folder_join_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b1

    .line 5469
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARING_CHANGE_FOLDER_JOIN_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5471
    :cond_1b1
    const-string v2, "sharing_change_link_allow_change_expiration_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b2

    .line 5472
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARING_CHANGE_LINK_ALLOW_CHANGE_EXPIRATION_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5474
    :cond_1b2
    const-string v2, "sharing_change_link_default_expiration_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b3

    .line 5475
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARING_CHANGE_LINK_DEFAULT_EXPIRATION_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5477
    :cond_1b3
    const-string v2, "sharing_change_link_enforce_password_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b4

    .line 5478
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARING_CHANGE_LINK_ENFORCE_PASSWORD_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5480
    :cond_1b4
    const-string v2, "sharing_change_link_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b5

    .line 5481
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARING_CHANGE_LINK_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5483
    :cond_1b5
    const-string v2, "sharing_change_member_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b6

    .line 5484
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHARING_CHANGE_MEMBER_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5486
    :cond_1b6
    const-string v2, "showcase_change_download_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b7

    .line 5487
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_CHANGE_DOWNLOAD_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5489
    :cond_1b7
    const-string v2, "showcase_change_enabled_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b8

    .line 5490
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_CHANGE_ENABLED_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5492
    :cond_1b8
    const-string v2, "showcase_change_external_sharing_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b9

    .line 5493
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SHOWCASE_CHANGE_EXTERNAL_SHARING_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5495
    :cond_1b9
    const-string v2, "smarter_smart_sync_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ba

    .line 5496
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SMARTER_SMART_SYNC_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5498
    :cond_1ba
    const-string v2, "smart_sync_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1bb

    .line 5499
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SMART_SYNC_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5501
    :cond_1bb
    const-string v2, "smart_sync_not_opt_out"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1bc

    .line 5502
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SMART_SYNC_NOT_OPT_OUT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5504
    :cond_1bc
    const-string v2, "smart_sync_opt_out"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1bd

    .line 5505
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SMART_SYNC_OPT_OUT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5507
    :cond_1bd
    const-string v2, "sso_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1be

    .line 5508
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->SSO_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5510
    :cond_1be
    const-string v2, "team_branding_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1bf

    .line 5511
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_BRANDING_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5513
    :cond_1bf
    const-string v2, "team_extensions_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    .line 5514
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_EXTENSIONS_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5516
    :cond_1c0
    const-string v2, "team_selective_sync_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c1

    .line 5517
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_SELECTIVE_SYNC_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5519
    :cond_1c1
    const-string v2, "team_sharing_whitelist_subjects_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c2

    .line 5520
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_SHARING_WHITELIST_SUBJECTS_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5522
    :cond_1c2
    const-string v2, "tfa_add_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c3

    .line 5523
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_ADD_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5525
    :cond_1c3
    const-string v2, "tfa_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c4

    .line 5526
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5528
    :cond_1c4
    const-string v2, "tfa_remove_exception"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c5

    .line 5529
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_REMOVE_EXCEPTION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5531
    :cond_1c5
    const-string v2, "two_account_change_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c6

    .line 5532
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TWO_ACCOUNT_CHANGE_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5534
    :cond_1c6
    const-string v2, "viewer_info_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c7

    .line 5535
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->VIEWER_INFO_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5537
    :cond_1c7
    const-string v2, "watermarking_policy_changed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c8

    .line 5538
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->WATERMARKING_POLICY_CHANGED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5540
    :cond_1c8
    const-string v2, "web_sessions_change_active_session_limit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c9

    .line 5541
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->WEB_SESSIONS_CHANGE_ACTIVE_SESSION_LIMIT:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5543
    :cond_1c9
    const-string v2, "web_sessions_change_fixed_length_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ca

    .line 5544
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->WEB_SESSIONS_CHANGE_FIXED_LENGTH_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5546
    :cond_1ca
    const-string v2, "web_sessions_change_idle_length_policy"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1cb

    .line 5547
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->WEB_SESSIONS_CHANGE_IDLE_LENGTH_POLICY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5549
    :cond_1cb
    const-string v2, "data_residency_migration_request_successful"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1cc

    .line 5550
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DATA_RESIDENCY_MIGRATION_REQUEST_SUCCESSFUL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5552
    :cond_1cc
    const-string v2, "data_residency_migration_request_unsuccessful"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1cd

    .line 5553
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->DATA_RESIDENCY_MIGRATION_REQUEST_UNSUCCESSFUL:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5555
    :cond_1cd
    const-string v2, "team_merge_from"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ce

    .line 5556
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_FROM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5558
    :cond_1ce
    const-string v2, "team_merge_to"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1cf

    .line 5559
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_TO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5561
    :cond_1cf
    const-string v2, "team_profile_add_background"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d0

    .line 5562
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_ADD_BACKGROUND:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5564
    :cond_1d0
    const-string v2, "team_profile_add_logo"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d1

    .line 5565
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_ADD_LOGO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5567
    :cond_1d1
    const-string v2, "team_profile_change_background"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d2

    .line 5568
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_CHANGE_BACKGROUND:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5570
    :cond_1d2
    const-string v2, "team_profile_change_default_language"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d3

    .line 5571
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_CHANGE_DEFAULT_LANGUAGE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5573
    :cond_1d3
    const-string v2, "team_profile_change_logo"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d4

    .line 5574
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_CHANGE_LOGO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5576
    :cond_1d4
    const-string v2, "team_profile_change_name"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d5

    .line 5577
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_CHANGE_NAME:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5579
    :cond_1d5
    const-string v2, "team_profile_remove_background"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d6

    .line 5580
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_REMOVE_BACKGROUND:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5582
    :cond_1d6
    const-string v2, "team_profile_remove_logo"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d7

    .line 5583
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_PROFILE_REMOVE_LOGO:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5585
    :cond_1d7
    const-string v2, "tfa_add_backup_phone"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d8

    .line 5586
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_ADD_BACKUP_PHONE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5588
    :cond_1d8
    const-string v2, "tfa_add_security_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d9

    .line 5589
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_ADD_SECURITY_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5591
    :cond_1d9
    const-string v2, "tfa_change_backup_phone"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1da

    .line 5592
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_CHANGE_BACKUP_PHONE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5594
    :cond_1da
    const-string v2, "tfa_change_status"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1db

    .line 5595
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_CHANGE_STATUS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5597
    :cond_1db
    const-string v2, "tfa_remove_backup_phone"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1dc

    .line 5598
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_REMOVE_BACKUP_PHONE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5600
    :cond_1dc
    const-string v2, "tfa_remove_security_key"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1dd

    .line 5601
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_REMOVE_SECURITY_KEY:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5603
    :cond_1dd
    const-string v2, "tfa_reset"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1de

    .line 5604
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TFA_RESET:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5606
    :cond_1de
    const-string v2, "changed_enterprise_admin_role"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1df

    .line 5607
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CHANGED_ENTERPRISE_ADMIN_ROLE:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5609
    :cond_1df
    const-string v2, "changed_enterprise_connected_team_status"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e0

    .line 5610
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->CHANGED_ENTERPRISE_CONNECTED_TEAM_STATUS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5612
    :cond_1e0
    const-string v2, "ended_enterprise_admin_session"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e1

    .line 5613
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ENDED_ENTERPRISE_ADMIN_SESSION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5615
    :cond_1e1
    const-string v2, "ended_enterprise_admin_session_deprecated"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e2

    .line 5616
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ENDED_ENTERPRISE_ADMIN_SESSION_DEPRECATED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5618
    :cond_1e2
    const-string v2, "enterprise_settings_locking"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e3

    .line 5619
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ENTERPRISE_SETTINGS_LOCKING:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5621
    :cond_1e3
    const-string v2, "guest_admin_change_status"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e4

    .line 5622
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->GUEST_ADMIN_CHANGE_STATUS:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5624
    :cond_1e4
    const-string v2, "started_enterprise_admin_session"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e5

    .line 5625
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->STARTED_ENTERPRISE_ADMIN_SESSION:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5627
    :cond_1e5
    const-string v2, "team_merge_request_accepted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e6

    .line 5628
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_ACCEPTED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5630
    :cond_1e6
    const-string v2, "team_merge_request_accepted_shown_to_primary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e7

    .line 5631
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_ACCEPTED_SHOWN_TO_PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5633
    :cond_1e7
    const-string v2, "team_merge_request_accepted_shown_to_secondary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e8

    .line 5634
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_ACCEPTED_SHOWN_TO_SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5636
    :cond_1e8
    const-string v2, "team_merge_request_auto_canceled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e9

    .line 5637
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_AUTO_CANCELED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5639
    :cond_1e9
    const-string v2, "team_merge_request_canceled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ea

    .line 5640
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_CANCELED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5642
    :cond_1ea
    const-string v2, "team_merge_request_canceled_shown_to_primary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1eb

    .line 5643
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_CANCELED_SHOWN_TO_PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5645
    :cond_1eb
    const-string v2, "team_merge_request_canceled_shown_to_secondary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ec

    .line 5646
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_CANCELED_SHOWN_TO_SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5648
    :cond_1ec
    const-string v2, "team_merge_request_expired"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ed

    .line 5649
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_EXPIRED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5651
    :cond_1ed
    const-string v2, "team_merge_request_expired_shown_to_primary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ee

    .line 5652
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_EXPIRED_SHOWN_TO_PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto/16 :goto_1

    .line 5654
    :cond_1ee
    const-string v2, "team_merge_request_expired_shown_to_secondary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ef

    .line 5655
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_EXPIRED_SHOWN_TO_SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5657
    :cond_1ef
    const-string v2, "team_merge_request_rejected_shown_to_primary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f0

    .line 5658
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_REJECTED_SHOWN_TO_PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5660
    :cond_1f0
    const-string v2, "team_merge_request_rejected_shown_to_secondary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f1

    .line 5661
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_REJECTED_SHOWN_TO_SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5663
    :cond_1f1
    const-string v2, "team_merge_request_reminder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f2

    .line 5664
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_REMINDER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5666
    :cond_1f2
    const-string v2, "team_merge_request_reminder_shown_to_primary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f3

    .line 5667
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_REMINDER_SHOWN_TO_PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5669
    :cond_1f3
    const-string v2, "team_merge_request_reminder_shown_to_secondary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f4

    .line 5670
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_REMINDER_SHOWN_TO_SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5672
    :cond_1f4
    const-string v2, "team_merge_request_revoked"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f5

    .line 5673
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_REVOKED:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5675
    :cond_1f5
    const-string v2, "team_merge_request_sent_shown_to_primary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f6

    .line 5676
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_SENT_SHOWN_TO_PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5678
    :cond_1f6
    const-string v2, "team_merge_request_sent_shown_to_secondary_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f7

    .line 5679
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->TEAM_MERGE_REQUEST_SENT_SHOWN_TO_SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    goto :goto_1

    .line 5682
    :cond_1f7
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->OTHER:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    :goto_1
    if-nez v1, :cond_1f8

    .line 5685
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 5686
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_1f8
    return-object v0

    .line 4170
    :cond_1f9
    new-instance v0, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v1, "Required field missing: .tag"

    invoke-direct {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 2130
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/EventTypeArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 2135
    sget-object v0, Lcom/dropbox/core/v2/teamlog/EventTypeArg$1;->$SwitchMap$com$dropbox$core$v2$teamlog$EventTypeArg:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/EventTypeArg;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 4149
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4145
    :pswitch_0
    const-string p1, "team_merge_request_sent_shown_to_secondary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4141
    :pswitch_1
    const-string p1, "team_merge_request_sent_shown_to_primary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4137
    :pswitch_2
    const-string p1, "team_merge_request_revoked"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4133
    :pswitch_3
    const-string p1, "team_merge_request_reminder_shown_to_secondary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4129
    :pswitch_4
    const-string p1, "team_merge_request_reminder_shown_to_primary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4125
    :pswitch_5
    const-string p1, "team_merge_request_reminder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4121
    :pswitch_6
    const-string p1, "team_merge_request_rejected_shown_to_secondary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4117
    :pswitch_7
    const-string p1, "team_merge_request_rejected_shown_to_primary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4113
    :pswitch_8
    const-string p1, "team_merge_request_expired_shown_to_secondary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4109
    :pswitch_9
    const-string p1, "team_merge_request_expired_shown_to_primary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4105
    :pswitch_a
    const-string p1, "team_merge_request_expired"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4101
    :pswitch_b
    const-string p1, "team_merge_request_canceled_shown_to_secondary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4097
    :pswitch_c
    const-string p1, "team_merge_request_canceled_shown_to_primary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4093
    :pswitch_d
    const-string p1, "team_merge_request_canceled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4089
    :pswitch_e
    const-string p1, "team_merge_request_auto_canceled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4085
    :pswitch_f
    const-string p1, "team_merge_request_accepted_shown_to_secondary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4081
    :pswitch_10
    const-string p1, "team_merge_request_accepted_shown_to_primary_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4077
    :pswitch_11
    const-string p1, "team_merge_request_accepted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4073
    :pswitch_12
    const-string p1, "started_enterprise_admin_session"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4069
    :pswitch_13
    const-string p1, "guest_admin_change_status"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4065
    :pswitch_14
    const-string p1, "enterprise_settings_locking"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4061
    :pswitch_15
    const-string p1, "ended_enterprise_admin_session_deprecated"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4057
    :pswitch_16
    const-string p1, "ended_enterprise_admin_session"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4053
    :pswitch_17
    const-string p1, "changed_enterprise_connected_team_status"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4049
    :pswitch_18
    const-string p1, "changed_enterprise_admin_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4045
    :pswitch_19
    const-string p1, "tfa_reset"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4041
    :pswitch_1a
    const-string p1, "tfa_remove_security_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4037
    :pswitch_1b
    const-string p1, "tfa_remove_backup_phone"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4033
    :pswitch_1c
    const-string p1, "tfa_change_status"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4029
    :pswitch_1d
    const-string p1, "tfa_change_backup_phone"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4025
    :pswitch_1e
    const-string p1, "tfa_add_security_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4021
    :pswitch_1f
    const-string p1, "tfa_add_backup_phone"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4017
    :pswitch_20
    const-string p1, "team_profile_remove_logo"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4013
    :pswitch_21
    const-string p1, "team_profile_remove_background"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4009
    :pswitch_22
    const-string p1, "team_profile_change_name"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4005
    :pswitch_23
    const-string p1, "team_profile_change_logo"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 4001
    :pswitch_24
    const-string p1, "team_profile_change_default_language"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3997
    :pswitch_25
    const-string p1, "team_profile_change_background"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3993
    :pswitch_26
    const-string p1, "team_profile_add_logo"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3989
    :pswitch_27
    const-string p1, "team_profile_add_background"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3985
    :pswitch_28
    const-string p1, "team_merge_to"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3981
    :pswitch_29
    const-string p1, "team_merge_from"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3977
    :pswitch_2a
    const-string p1, "data_residency_migration_request_unsuccessful"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3973
    :pswitch_2b
    const-string p1, "data_residency_migration_request_successful"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3969
    :pswitch_2c
    const-string p1, "web_sessions_change_idle_length_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3965
    :pswitch_2d
    const-string p1, "web_sessions_change_fixed_length_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3961
    :pswitch_2e
    const-string p1, "web_sessions_change_active_session_limit"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3957
    :pswitch_2f
    const-string p1, "watermarking_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3953
    :pswitch_30
    const-string p1, "viewer_info_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3949
    :pswitch_31
    const-string p1, "two_account_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3945
    :pswitch_32
    const-string p1, "tfa_remove_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3941
    :pswitch_33
    const-string p1, "tfa_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3937
    :pswitch_34
    const-string p1, "tfa_add_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3933
    :pswitch_35
    const-string p1, "team_sharing_whitelist_subjects_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3929
    :pswitch_36
    const-string p1, "team_selective_sync_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3925
    :pswitch_37
    const-string p1, "team_extensions_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3921
    :pswitch_38
    const-string p1, "team_branding_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3917
    :pswitch_39
    const-string p1, "sso_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3913
    :pswitch_3a
    const-string p1, "smart_sync_opt_out"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3909
    :pswitch_3b
    const-string p1, "smart_sync_not_opt_out"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3905
    :pswitch_3c
    const-string p1, "smart_sync_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3901
    :pswitch_3d
    const-string p1, "smarter_smart_sync_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3897
    :pswitch_3e
    const-string p1, "showcase_change_external_sharing_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3893
    :pswitch_3f
    const-string p1, "showcase_change_enabled_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3889
    :pswitch_40
    const-string p1, "showcase_change_download_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3885
    :pswitch_41
    const-string p1, "sharing_change_member_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3881
    :pswitch_42
    const-string p1, "sharing_change_link_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3877
    :pswitch_43
    const-string p1, "sharing_change_link_enforce_password_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3873
    :pswitch_44
    const-string p1, "sharing_change_link_default_expiration_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3869
    :pswitch_45
    const-string p1, "sharing_change_link_allow_change_expiration_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3865
    :pswitch_46
    const-string p1, "sharing_change_folder_join_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3861
    :pswitch_47
    const-string p1, "send_for_signature_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3857
    :pswitch_48
    const-string p1, "rewind_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3853
    :pswitch_49
    const-string p1, "reseller_support_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3849
    :pswitch_4a
    const-string p1, "permanent_delete_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3845
    :pswitch_4b
    const-string p1, "password_strength_requirements_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3841
    :pswitch_4c
    const-string p1, "paper_enabled_users_group_removal"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3837
    :pswitch_4d
    const-string p1, "paper_enabled_users_group_addition"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3833
    :pswitch_4e
    const-string p1, "paper_desktop_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3829
    :pswitch_4f
    const-string p1, "paper_default_folder_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3825
    :pswitch_50
    const-string p1, "paper_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3821
    :pswitch_51
    const-string p1, "paper_change_member_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3817
    :pswitch_52
    const-string p1, "paper_change_member_link_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3813
    :pswitch_53
    const-string p1, "paper_change_deployment_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3809
    :pswitch_54
    const-string p1, "network_control_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3805
    :pswitch_55
    const-string p1, "microsoft_office_addin_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3801
    :pswitch_56
    const-string p1, "member_suggestions_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3797
    :pswitch_57
    const-string p1, "member_space_limits_remove_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3793
    :pswitch_58
    const-string p1, "member_space_limits_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3789
    :pswitch_59
    const-string p1, "member_space_limits_change_caps_type_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3785
    :pswitch_5a
    const-string p1, "member_space_limits_add_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3781
    :pswitch_5b
    const-string p1, "member_send_invite_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3777
    :pswitch_5c
    const-string p1, "member_requests_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3773
    :pswitch_5d
    const-string p1, "invite_acceptance_email_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3769
    :pswitch_5e
    const-string p1, "integration_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3765
    :pswitch_5f
    const-string p1, "group_user_management_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3761
    :pswitch_60
    const-string p1, "google_sso_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3757
    :pswitch_61
    const-string p1, "folder_link_restriction_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3753
    :pswitch_62
    const-string p1, "file_transfers_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3749
    :pswitch_63
    const-string p1, "file_requests_emails_restricted_to_team_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3745
    :pswitch_64
    const-string p1, "file_requests_emails_enabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3741
    :pswitch_65
    const-string p1, "file_requests_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3737
    :pswitch_66
    const-string p1, "file_provider_migration_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3733
    :pswitch_67
    const-string p1, "file_locking_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3729
    :pswitch_68
    const-string p1, "file_comments_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3725
    :pswitch_69
    const-string p1, "external_drive_backup_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3721
    :pswitch_6a
    const-string p1, "extended_version_history_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3717
    :pswitch_6b
    const-string p1, "emm_remove_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3713
    :pswitch_6c
    const-string p1, "emm_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3709
    :pswitch_6d
    const-string p1, "emm_add_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3705
    :pswitch_6e
    const-string p1, "email_ingest_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3701
    :pswitch_6f
    const-string p1, "dropbox_passwords_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3697
    :pswitch_70
    const-string p1, "directory_restrictions_remove_members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3693
    :pswitch_71
    const-string p1, "directory_restrictions_add_members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3689
    :pswitch_72
    const-string p1, "device_approvals_remove_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3685
    :pswitch_73
    const-string p1, "device_approvals_change_unlink_action"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3681
    :pswitch_74
    const-string p1, "device_approvals_change_overage_action"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3677
    :pswitch_75
    const-string p1, "device_approvals_change_mobile_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3673
    :pswitch_76
    const-string p1, "device_approvals_change_desktop_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3669
    :pswitch_77
    const-string p1, "device_approvals_add_exception"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3665
    :pswitch_78
    const-string p1, "data_placement_restriction_satisfy_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3661
    :pswitch_79
    const-string p1, "data_placement_restriction_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3657
    :pswitch_7a
    const-string p1, "content_administration_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3653
    :pswitch_7b
    const-string p1, "computer_backup_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3649
    :pswitch_7c
    const-string p1, "classification_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3645
    :pswitch_7d
    const-string p1, "capture_transcript_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3641
    :pswitch_7e
    const-string p1, "camera_uploads_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3637
    :pswitch_7f
    const-string p1, "app_permissions_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3633
    :pswitch_80
    const-string p1, "allow_download_enabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3629
    :pswitch_81
    const-string p1, "allow_download_disabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3625
    :pswitch_82
    const-string p1, "admin_email_reminders_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3621
    :pswitch_83
    const-string p1, "account_capture_change_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3617
    :pswitch_84
    const-string p1, "team_selective_sync_settings_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3613
    :pswitch_85
    const-string p1, "team_folder_rename"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3609
    :pswitch_86
    const-string p1, "team_folder_permanently_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3605
    :pswitch_87
    const-string p1, "team_folder_downgrade"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3601
    :pswitch_88
    const-string p1, "team_folder_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3597
    :pswitch_89
    const-string p1, "team_folder_change_status"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3593
    :pswitch_8a
    const-string p1, "sso_remove_logout_url"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3589
    :pswitch_8b
    const-string p1, "sso_remove_login_url"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3585
    :pswitch_8c
    const-string p1, "sso_remove_cert"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3581
    :pswitch_8d
    const-string p1, "sso_change_saml_identity_mode"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3577
    :pswitch_8e
    const-string p1, "sso_change_logout_url"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3573
    :pswitch_8f
    const-string p1, "sso_change_login_url"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3569
    :pswitch_90
    const-string p1, "sso_change_cert"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3565
    :pswitch_91
    const-string p1, "sso_add_logout_url"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3561
    :pswitch_92
    const-string p1, "sso_add_login_url"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3557
    :pswitch_93
    const-string p1, "sso_add_cert"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3553
    :pswitch_94
    const-string p1, "showcase_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3549
    :pswitch_95
    const-string p1, "showcase_untrashed_deprecated"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3545
    :pswitch_96
    const-string p1, "showcase_untrashed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3541
    :pswitch_97
    const-string p1, "showcase_unresolve_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3537
    :pswitch_98
    const-string p1, "showcase_trashed_deprecated"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3533
    :pswitch_99
    const-string p1, "showcase_trashed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3529
    :pswitch_9a
    const-string p1, "showcase_restored"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3525
    :pswitch_9b
    const-string p1, "showcase_resolve_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3521
    :pswitch_9c
    const-string p1, "showcase_request_access"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3517
    :pswitch_9d
    const-string p1, "showcase_renamed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3513
    :pswitch_9e
    const-string p1, "showcase_remove_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3509
    :pswitch_9f
    const-string p1, "showcase_post_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3505
    :pswitch_a0
    const-string p1, "showcase_permanently_deleted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3501
    :pswitch_a1
    const-string p1, "showcase_file_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3497
    :pswitch_a2
    const-string p1, "showcase_file_removed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3493
    :pswitch_a3
    const-string p1, "showcase_file_download"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3489
    :pswitch_a4
    const-string p1, "showcase_file_added"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3485
    :pswitch_a5
    const-string p1, "showcase_edit_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3481
    :pswitch_a6
    const-string p1, "showcase_edited"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3477
    :pswitch_a7
    const-string p1, "showcase_delete_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3473
    :pswitch_a8
    const-string p1, "showcase_created"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3469
    :pswitch_a9
    const-string p1, "showcase_archived"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3465
    :pswitch_aa
    const-string p1, "showcase_add_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3461
    :pswitch_ab
    const-string p1, "showcase_access_granted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3457
    :pswitch_ac
    const-string p1, "shmodel_group_share"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3453
    :pswitch_ad
    const-string p1, "shmodel_enable_downloads"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3449
    :pswitch_ae
    const-string p1, "shmodel_disable_downloads"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3445
    :pswitch_af
    const-string p1, "shared_note_opened"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3441
    :pswitch_b0
    const-string p1, "shared_link_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3437
    :pswitch_b1
    const-string p1, "shared_link_share"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3433
    :pswitch_b2
    const-string p1, "shared_link_settings_remove_password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3429
    :pswitch_b3
    const-string p1, "shared_link_settings_remove_expiration"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3425
    :pswitch_b4
    const-string p1, "shared_link_settings_change_password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3421
    :pswitch_b5
    const-string p1, "shared_link_settings_change_expiration"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3417
    :pswitch_b6
    const-string p1, "shared_link_settings_change_audience"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3413
    :pswitch_b7
    const-string p1, "shared_link_settings_allow_download_enabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3409
    :pswitch_b8
    const-string p1, "shared_link_settings_allow_download_disabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3405
    :pswitch_b9
    const-string p1, "shared_link_settings_add_password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3401
    :pswitch_ba
    const-string p1, "shared_link_settings_add_expiration"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3397
    :pswitch_bb
    const-string p1, "shared_link_remove_expiry"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3393
    :pswitch_bc
    const-string p1, "shared_link_download"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3389
    :pswitch_bd
    const-string p1, "shared_link_disable"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3385
    :pswitch_be
    const-string p1, "shared_link_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3381
    :pswitch_bf
    const-string p1, "shared_link_copy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3377
    :pswitch_c0
    const-string p1, "shared_link_change_visibility"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3373
    :pswitch_c1
    const-string p1, "shared_link_change_expiry"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3369
    :pswitch_c2
    const-string p1, "shared_link_add_expiry"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3365
    :pswitch_c3
    const-string p1, "shared_folder_unmount"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3361
    :pswitch_c4
    const-string p1, "shared_folder_transfer_ownership"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3357
    :pswitch_c5
    const-string p1, "shared_folder_nest"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3353
    :pswitch_c6
    const-string p1, "shared_folder_mount"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3349
    :pswitch_c7
    const-string p1, "shared_folder_decline_invitation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3345
    :pswitch_c8
    const-string p1, "shared_folder_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3341
    :pswitch_c9
    const-string p1, "shared_folder_change_members_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3337
    :pswitch_ca
    const-string p1, "shared_folder_change_members_management_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3333
    :pswitch_cb
    const-string p1, "shared_folder_change_members_inheritance_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3329
    :pswitch_cc
    const-string p1, "shared_folder_change_link_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3325
    :pswitch_cd
    const-string p1, "shared_content_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3321
    :pswitch_ce
    const-string p1, "shared_content_unshare"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3317
    :pswitch_cf
    const-string p1, "shared_content_restore_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3313
    :pswitch_d0
    const-string p1, "shared_content_restore_invitees"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3309
    :pswitch_d1
    const-string p1, "shared_content_request_access"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3305
    :pswitch_d2
    const-string p1, "shared_content_remove_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3301
    :pswitch_d3
    const-string p1, "shared_content_remove_link_password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3297
    :pswitch_d4
    const-string p1, "shared_content_remove_link_expiry"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3293
    :pswitch_d5
    const-string p1, "shared_content_remove_invitees"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3289
    :pswitch_d6
    const-string p1, "shared_content_relinquish_membership"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3285
    :pswitch_d7
    const-string p1, "shared_content_download"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3281
    :pswitch_d8
    const-string p1, "shared_content_copy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3277
    :pswitch_d9
    const-string p1, "shared_content_claim_invitation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3273
    :pswitch_da
    const-string p1, "shared_content_change_viewer_info_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3269
    :pswitch_db
    const-string p1, "shared_content_change_member_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3265
    :pswitch_dc
    const-string p1, "shared_content_change_link_password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3261
    :pswitch_dd
    const-string p1, "shared_content_change_link_expiry"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3257
    :pswitch_de
    const-string p1, "shared_content_change_link_audience"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3253
    :pswitch_df
    const-string p1, "shared_content_change_invitee_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3249
    :pswitch_e0
    const-string p1, "shared_content_change_downloads_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3245
    :pswitch_e1
    const-string p1, "shared_content_add_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3241
    :pswitch_e2
    const-string p1, "shared_content_add_link_password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3237
    :pswitch_e3
    const-string p1, "shared_content_add_link_expiry"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3233
    :pswitch_e4
    const-string p1, "shared_content_add_invitees"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3229
    :pswitch_e5
    const-string p1, "sf_team_uninvite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3225
    :pswitch_e6
    const-string p1, "sf_team_join_from_oob_link"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3221
    :pswitch_e7
    const-string p1, "sf_team_join"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3217
    :pswitch_e8
    const-string p1, "sf_team_invite_change_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3213
    :pswitch_e9
    const-string p1, "sf_team_invite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3209
    :pswitch_ea
    const-string p1, "sf_team_grant_access"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3205
    :pswitch_eb
    const-string p1, "sf_invite_group"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3201
    :pswitch_ec
    const-string p1, "sf_fb_uninvite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3197
    :pswitch_ed
    const-string p1, "sf_fb_invite_change_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3193
    :pswitch_ee
    const-string p1, "sf_fb_invite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3189
    :pswitch_ef
    const-string p1, "sf_external_invite_warn"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3185
    :pswitch_f0
    const-string p1, "sf_allow_non_members_to_view_shared_links"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3181
    :pswitch_f1
    const-string p1, "sf_add_group"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3177
    :pswitch_f2
    const-string p1, "replay_project_team_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3173
    :pswitch_f3
    const-string p1, "replay_project_team_add"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3169
    :pswitch_f4
    const-string p1, "replay_file_shared_link_modified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3165
    :pswitch_f5
    const-string p1, "replay_file_shared_link_created"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3161
    :pswitch_f6
    const-string p1, "open_note_shared"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3157
    :pswitch_f7
    const-string p1, "note_share_receive"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3153
    :pswitch_f8
    const-string p1, "note_shared"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3149
    :pswitch_f9
    const-string p1, "note_acl_team_link"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3145
    :pswitch_fa
    const-string p1, "note_acl_link"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3141
    :pswitch_fb
    const-string p1, "note_acl_invite_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3137
    :pswitch_fc
    const-string p1, "file_transfers_transfer_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3133
    :pswitch_fd
    const-string p1, "file_transfers_transfer_send"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3129
    :pswitch_fe
    const-string p1, "file_transfers_transfer_download"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3125
    :pswitch_ff
    const-string p1, "file_transfers_transfer_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3121
    :pswitch_100
    const-string p1, "file_transfers_file_add"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3117
    :pswitch_101
    const-string p1, "collection_share"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3113
    :pswitch_102
    const-string p1, "team_activity_create_report_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3109
    :pswitch_103
    const-string p1, "team_activity_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3105
    :pswitch_104
    const-string p1, "smart_sync_create_admin_privilege_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3101
    :pswitch_105
    const-string p1, "ransomware_alert_create_report_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3097
    :pswitch_106
    const-string p1, "ransomware_alert_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3093
    :pswitch_107
    const-string p1, "paper_admin_export_start"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3089
    :pswitch_108
    const-string p1, "outdated_link_view_report_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3085
    :pswitch_109
    const-string p1, "outdated_link_view_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3081
    :pswitch_10a
    const-string p1, "no_password_link_view_report_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3077
    :pswitch_10b
    const-string p1, "no_password_link_view_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3073
    :pswitch_10c
    const-string p1, "no_password_link_gen_report_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3069
    :pswitch_10d
    const-string p1, "no_password_link_gen_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3065
    :pswitch_10e
    const-string p1, "no_expiration_link_gen_report_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3061
    :pswitch_10f
    const-string p1, "no_expiration_link_gen_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3057
    :pswitch_110
    const-string p1, "external_sharing_report_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3053
    :pswitch_111
    const-string p1, "external_sharing_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3049
    :pswitch_112
    const-string p1, "export_members_report_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3045
    :pswitch_113
    const-string p1, "export_members_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3041
    :pswitch_114
    const-string p1, "emm_create_usage_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3037
    :pswitch_115
    const-string p1, "emm_create_exceptions_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3033
    :pswitch_116
    const-string p1, "classification_create_report_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3029
    :pswitch_117
    const-string p1, "classification_create_report"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3025
    :pswitch_118
    const-string p1, "password_reset_all"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3021
    :pswitch_119
    const-string p1, "password_reset"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3017
    :pswitch_11a
    const-string p1, "password_change"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3013
    :pswitch_11b
    const-string p1, "paper_published_link_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3009
    :pswitch_11c
    const-string p1, "paper_published_link_disabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3005
    :pswitch_11d
    const-string p1, "paper_published_link_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 3001
    :pswitch_11e
    const-string p1, "paper_published_link_change_permission"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2997
    :pswitch_11f
    const-string p1, "paper_folder_team_invite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2993
    :pswitch_120
    const-string p1, "paper_folder_followed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2989
    :pswitch_121
    const-string p1, "paper_folder_deleted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2985
    :pswitch_122
    const-string p1, "paper_folder_change_subscription"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2981
    :pswitch_123
    const-string p1, "paper_external_view_forbid"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2977
    :pswitch_124
    const-string p1, "paper_external_view_default_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2973
    :pswitch_125
    const-string p1, "paper_external_view_allow"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2969
    :pswitch_126
    const-string p1, "paper_doc_view"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2965
    :pswitch_127
    const-string p1, "paper_doc_untrashed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2961
    :pswitch_128
    const-string p1, "paper_doc_unresolve_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2957
    :pswitch_129
    const-string p1, "paper_doc_trashed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2953
    :pswitch_12a
    const-string p1, "paper_doc_team_invite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2949
    :pswitch_12b
    const-string p1, "paper_doc_slack_share"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2945
    :pswitch_12c
    const-string p1, "paper_doc_revert"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2941
    :pswitch_12d
    const-string p1, "paper_doc_resolve_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2937
    :pswitch_12e
    const-string p1, "paper_doc_request_access"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2933
    :pswitch_12f
    const-string p1, "paper_doc_ownership_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2929
    :pswitch_130
    const-string p1, "paper_doc_mention"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2925
    :pswitch_131
    const-string p1, "paper_doc_followed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2921
    :pswitch_132
    const-string p1, "paper_doc_edit_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2917
    :pswitch_133
    const-string p1, "paper_doc_edit"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2913
    :pswitch_134
    const-string p1, "paper_doc_download"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2909
    :pswitch_135
    const-string p1, "paper_doc_delete_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2905
    :pswitch_136
    const-string p1, "paper_doc_deleted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2901
    :pswitch_137
    const-string p1, "paper_doc_change_subscription"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2897
    :pswitch_138
    const-string p1, "paper_doc_change_sharing_policy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2893
    :pswitch_139
    const-string p1, "paper_doc_change_member_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2889
    :pswitch_13a
    const-string p1, "paper_doc_add_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2885
    :pswitch_13b
    const-string p1, "paper_content_restore"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2881
    :pswitch_13c
    const-string p1, "paper_content_rename"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2877
    :pswitch_13d
    const-string p1, "paper_content_remove_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2873
    :pswitch_13e
    const-string p1, "paper_content_remove_from_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2869
    :pswitch_13f
    const-string p1, "paper_content_permanently_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2865
    :pswitch_140
    const-string p1, "paper_content_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2861
    :pswitch_141
    const-string p1, "paper_content_archive"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2857
    :pswitch_142
    const-string p1, "paper_content_add_to_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2853
    :pswitch_143
    const-string p1, "paper_content_add_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2849
    :pswitch_144
    const-string p1, "binder_reorder_section"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2845
    :pswitch_145
    const-string p1, "binder_reorder_page"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2841
    :pswitch_146
    const-string p1, "binder_rename_section"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2837
    :pswitch_147
    const-string p1, "binder_rename_page"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2833
    :pswitch_148
    const-string p1, "binder_remove_section"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2829
    :pswitch_149
    const-string p1, "binder_remove_page"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2825
    :pswitch_14a
    const-string p1, "binder_add_section"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2821
    :pswitch_14b
    const-string p1, "binder_add_page"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2817
    :pswitch_14c
    const-string p1, "secondary_mails_policy_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2813
    :pswitch_14d
    const-string p1, "secondary_email_verified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2809
    :pswitch_14e
    const-string p1, "secondary_email_deleted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2805
    :pswitch_14f
    const-string p1, "pending_secondary_email_added"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2801
    :pswitch_150
    const-string p1, "member_transfer_account_contents"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2797
    :pswitch_151
    const-string p1, "member_suggest"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2793
    :pswitch_152
    const-string p1, "member_space_limits_remove_custom_quota"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2789
    :pswitch_153
    const-string p1, "member_space_limits_change_status"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2785
    :pswitch_154
    const-string p1, "member_space_limits_change_custom_quota"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2781
    :pswitch_155
    const-string p1, "member_space_limits_add_custom_quota"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2777
    :pswitch_156
    const-string p1, "member_set_profile_photo"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2773
    :pswitch_157
    const-string p1, "member_remove_external_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2769
    :pswitch_158
    const-string p1, "member_permanently_delete_account_contents"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2765
    :pswitch_159
    const-string p1, "member_delete_profile_photo"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2761
    :pswitch_15a
    const-string p1, "member_delete_manual_contacts"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2757
    :pswitch_15b
    const-string p1, "member_change_status"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2753
    :pswitch_15c
    const-string p1, "member_change_reseller_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2749
    :pswitch_15d
    const-string p1, "member_change_name"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2745
    :pswitch_15e
    const-string p1, "member_change_membership_type"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2741
    :pswitch_15f
    const-string p1, "member_change_external_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2737
    :pswitch_160
    const-string p1, "member_change_email"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2733
    :pswitch_161
    const-string p1, "member_change_admin_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2729
    :pswitch_162
    const-string p1, "member_add_name"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2725
    :pswitch_163
    const-string p1, "member_add_external_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2721
    :pswitch_164
    const-string p1, "delete_team_invite_link"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2717
    :pswitch_165
    const-string p1, "create_team_invite_link"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2713
    :pswitch_166
    const-string p1, "backup_invitation_opened"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2709
    :pswitch_167
    const-string p1, "backup_admin_invitation_sent"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2705
    :pswitch_168
    const-string p1, "sso_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2701
    :pswitch_169
    const-string p1, "sign_in_as_session_start"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2697
    :pswitch_16a
    const-string p1, "sign_in_as_session_end"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2693
    :pswitch_16b
    const-string p1, "reseller_support_session_start"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2689
    :pswitch_16c
    const-string p1, "reseller_support_session_end"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2685
    :pswitch_16d
    const-string p1, "logout"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2681
    :pswitch_16e
    const-string p1, "login_success"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2677
    :pswitch_16f
    const-string p1, "login_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2673
    :pswitch_170
    const-string p1, "guest_admin_signed_out_via_trusted_teams"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2669
    :pswitch_171
    const-string p1, "guest_admin_signed_in_via_trusted_teams"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2665
    :pswitch_172
    const-string p1, "emm_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2661
    :pswitch_173
    const-string p1, "account_lock_or_unlocked"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2657
    :pswitch_174
    const-string p1, "group_rename"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2653
    :pswitch_175
    const-string p1, "group_remove_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2649
    :pswitch_176
    const-string p1, "group_remove_external_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2645
    :pswitch_177
    const-string p1, "group_moved"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2641
    :pswitch_178
    const-string p1, "group_join_policy_updated"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2637
    :pswitch_179
    const-string p1, "group_description_updated"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2633
    :pswitch_17a
    const-string p1, "group_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2629
    :pswitch_17b
    const-string p1, "group_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2625
    :pswitch_17c
    const-string p1, "group_change_member_role"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2621
    :pswitch_17d
    const-string p1, "group_change_management_type"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2617
    :pswitch_17e
    const-string p1, "group_change_external_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2613
    :pswitch_17f
    const-string p1, "group_add_member"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2609
    :pswitch_180
    const-string p1, "group_add_external_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2605
    :pswitch_181
    const-string p1, "file_request_receive_file"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2601
    :pswitch_182
    const-string p1, "file_request_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2597
    :pswitch_183
    const-string p1, "file_request_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2593
    :pswitch_184
    const-string p1, "file_request_close"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2589
    :pswitch_185
    const-string p1, "file_request_change"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2585
    :pswitch_186
    const-string p1, "email_ingest_receive_file"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2581
    :pswitch_187
    const-string p1, "user_tags_removed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2577
    :pswitch_188
    const-string p1, "user_tags_added"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2573
    :pswitch_189
    const-string p1, "undo_organize_folder_with_tidy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2569
    :pswitch_18a
    const-string p1, "undo_naming_convention"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2565
    :pswitch_18b
    const-string p1, "rewind_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2561
    :pswitch_18c
    const-string p1, "replay_file_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2557
    :pswitch_18d
    const-string p1, "organize_folder_with_tidy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2553
    :pswitch_18e
    const-string p1, "object_label_updated_value"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2549
    :pswitch_18f
    const-string p1, "object_label_removed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2545
    :pswitch_190
    const-string p1, "object_label_added"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2541
    :pswitch_191
    const-string p1, "folder_overview_item_unpinned"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2537
    :pswitch_192
    const-string p1, "folder_overview_item_pinned"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2533
    :pswitch_193
    const-string p1, "folder_overview_description_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2529
    :pswitch_194
    const-string p1, "file_save_copy_reference"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2525
    :pswitch_195
    const-string p1, "file_rollback_changes"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2521
    :pswitch_196
    const-string p1, "file_revert"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2517
    :pswitch_197
    const-string p1, "file_restore"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2513
    :pswitch_198
    const-string p1, "file_rename"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2509
    :pswitch_199
    const-string p1, "file_preview"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2505
    :pswitch_19a
    const-string p1, "file_permanently_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2501
    :pswitch_19b
    const-string p1, "file_move"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2497
    :pswitch_19c
    const-string p1, "file_locking_lock_status_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2493
    :pswitch_19d
    const-string p1, "file_get_copy_reference"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2489
    :pswitch_19e
    const-string p1, "file_edit"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2485
    :pswitch_19f
    const-string p1, "file_download"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2481
    :pswitch_1a0
    const-string p1, "file_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2477
    :pswitch_1a1
    const-string p1, "file_copy"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2473
    :pswitch_1a2
    const-string p1, "file_add_from_automation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2469
    :pswitch_1a3
    const-string p1, "file_add"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2465
    :pswitch_1a4
    const-string p1, "create_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2461
    :pswitch_1a5
    const-string p1, "apply_naming_convention"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2457
    :pswitch_1a6
    const-string p1, "team_encryption_key_schedule_key_deletion"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2453
    :pswitch_1a7
    const-string p1, "team_encryption_key_rotate_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2449
    :pswitch_1a8
    const-string p1, "team_encryption_key_enable_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2445
    :pswitch_1a9
    const-string p1, "team_encryption_key_disable_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2441
    :pswitch_1aa
    const-string p1, "team_encryption_key_delete_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2437
    :pswitch_1ab
    const-string p1, "team_encryption_key_create_key"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2433
    :pswitch_1ac
    const-string p1, "team_encryption_key_cancel_key_deletion"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2429
    :pswitch_1ad
    const-string p1, "enabled_domain_invites"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2425
    :pswitch_1ae
    const-string p1, "domain_verification_remove_domain"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2421
    :pswitch_1af
    const-string p1, "domain_verification_add_domain_success"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2417
    :pswitch_1b0
    const-string p1, "domain_verification_add_domain_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2413
    :pswitch_1b1
    const-string p1, "domain_invites_set_invite_new_user_pref_to_yes"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2409
    :pswitch_1b2
    const-string p1, "domain_invites_set_invite_new_user_pref_to_no"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2405
    :pswitch_1b3
    const-string p1, "domain_invites_request_to_join_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2401
    :pswitch_1b4
    const-string p1, "domain_invites_email_existing_users"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2397
    :pswitch_1b5
    const-string p1, "domain_invites_decline_request_to_join_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2393
    :pswitch_1b6
    const-string p1, "domain_invites_approve_request_to_join_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2389
    :pswitch_1b7
    const-string p1, "disabled_domain_invites"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2385
    :pswitch_1b8
    const-string p1, "account_capture_relinquish_account"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2381
    :pswitch_1b9
    const-string p1, "account_capture_notification_emails_sent"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2377
    :pswitch_1ba
    const-string p1, "account_capture_migrate_account"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2373
    :pswitch_1bb
    const-string p1, "account_capture_change_availability"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2369
    :pswitch_1bc
    const-string p1, "external_drive_backup_status_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2365
    :pswitch_1bd
    const-string p1, "external_drive_backup_eligibility_status_checked"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2361
    :pswitch_1be
    const-string p1, "emm_refresh_auth_token"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2357
    :pswitch_1bf
    const-string p1, "dropbox_passwords_new_device_enrolled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2353
    :pswitch_1c0
    const-string p1, "dropbox_passwords_exported"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2349
    :pswitch_1c1
    const-string p1, "device_unlink"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2345
    :pswitch_1c2
    const-string p1, "device_sync_backup_status_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2341
    :pswitch_1c3
    const-string p1, "device_management_enabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2337
    :pswitch_1c4
    const-string p1, "device_management_disabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2333
    :pswitch_1c5
    const-string p1, "device_link_success"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2329
    :pswitch_1c6
    const-string p1, "device_link_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2325
    :pswitch_1c7
    const-string p1, "device_delete_on_unlink_success"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2321
    :pswitch_1c8
    const-string p1, "device_delete_on_unlink_fail"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2317
    :pswitch_1c9
    const-string p1, "device_change_ip_web"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2313
    :pswitch_1ca
    const-string p1, "device_change_ip_mobile"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2309
    :pswitch_1cb
    const-string p1, "device_change_ip_desktop"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2305
    :pswitch_1cc
    const-string p1, "legal_holds_report_a_hold"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2301
    :pswitch_1cd
    const-string p1, "legal_holds_remove_members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2297
    :pswitch_1ce
    const-string p1, "legal_holds_release_a_hold"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2293
    :pswitch_1cf
    const-string p1, "legal_holds_export_removed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2289
    :pswitch_1d0
    const-string p1, "legal_holds_export_downloaded"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2285
    :pswitch_1d1
    const-string p1, "legal_holds_export_cancelled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2281
    :pswitch_1d2
    const-string p1, "legal_holds_export_a_hold"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2277
    :pswitch_1d3
    const-string p1, "legal_holds_change_hold_name"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2273
    :pswitch_1d4
    const-string p1, "legal_holds_change_hold_details"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2269
    :pswitch_1d5
    const-string p1, "legal_holds_add_members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2265
    :pswitch_1d6
    const-string p1, "legal_holds_activate_a_hold"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2261
    :pswitch_1d7
    const-string p1, "governance_policy_zip_part_downloaded"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2257
    :pswitch_1d8
    const-string p1, "governance_policy_report_created"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2253
    :pswitch_1d9
    const-string p1, "governance_policy_remove_folders"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2249
    :pswitch_1da
    const-string p1, "governance_policy_export_removed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2245
    :pswitch_1db
    const-string p1, "governance_policy_export_created"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2241
    :pswitch_1dc
    const-string p1, "governance_policy_edit_duration"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2237
    :pswitch_1dd
    const-string p1, "governance_policy_edit_details"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2233
    :pswitch_1de
    const-string p1, "governance_policy_delete"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2229
    :pswitch_1df
    const-string p1, "governance_policy_create"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2225
    :pswitch_1e0
    const-string p1, "governance_policy_content_disposed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2221
    :pswitch_1e1
    const-string p1, "governance_policy_add_folder_failed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2217
    :pswitch_1e2
    const-string p1, "governance_policy_add_folders"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2213
    :pswitch_1e3
    const-string p1, "file_unresolve_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2209
    :pswitch_1e4
    const-string p1, "file_unlike_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2205
    :pswitch_1e5
    const-string p1, "file_resolve_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2201
    :pswitch_1e6
    const-string p1, "file_like_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2197
    :pswitch_1e7
    const-string p1, "file_edit_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2193
    :pswitch_1e8
    const-string p1, "file_delete_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2189
    :pswitch_1e9
    const-string p1, "file_change_comment_subscription"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2185
    :pswitch_1ea
    const-string p1, "file_add_comment"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2181
    :pswitch_1eb
    const-string p1, "integration_disconnected"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2177
    :pswitch_1ec
    const-string p1, "integration_connected"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2173
    :pswitch_1ed
    const-string p1, "app_unlink_user"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2169
    :pswitch_1ee
    const-string p1, "app_unlink_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2165
    :pswitch_1ef
    const-string p1, "app_link_user"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2161
    :pswitch_1f0
    const-string p1, "app_link_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2157
    :pswitch_1f1
    const-string p1, "app_blocked_by_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2153
    :pswitch_1f2
    const-string p1, "ransomware_restore_process_started"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2149
    :pswitch_1f3
    const-string p1, "ransomware_restore_process_completed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2145
    :pswitch_1f4
    const-string p1, "admin_alerting_triggered_alert"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2141
    :pswitch_1f5
    const-string p1, "admin_alerting_changed_alert_config"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 2137
    :pswitch_1f6
    const-string p1, "admin_alerting_alert_state_changed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1f6
        :pswitch_1f5
        :pswitch_1f4
        :pswitch_1f3
        :pswitch_1f2
        :pswitch_1f1
        :pswitch_1f0
        :pswitch_1ef
        :pswitch_1ee
        :pswitch_1ed
        :pswitch_1ec
        :pswitch_1eb
        :pswitch_1ea
        :pswitch_1e9
        :pswitch_1e8
        :pswitch_1e7
        :pswitch_1e6
        :pswitch_1e5
        :pswitch_1e4
        :pswitch_1e3
        :pswitch_1e2
        :pswitch_1e1
        :pswitch_1e0
        :pswitch_1df
        :pswitch_1de
        :pswitch_1dd
        :pswitch_1dc
        :pswitch_1db
        :pswitch_1da
        :pswitch_1d9
        :pswitch_1d8
        :pswitch_1d7
        :pswitch_1d6
        :pswitch_1d5
        :pswitch_1d4
        :pswitch_1d3
        :pswitch_1d2
        :pswitch_1d1
        :pswitch_1d0
        :pswitch_1cf
        :pswitch_1ce
        :pswitch_1cd
        :pswitch_1cc
        :pswitch_1cb
        :pswitch_1ca
        :pswitch_1c9
        :pswitch_1c8
        :pswitch_1c7
        :pswitch_1c6
        :pswitch_1c5
        :pswitch_1c4
        :pswitch_1c3
        :pswitch_1c2
        :pswitch_1c1
        :pswitch_1c0
        :pswitch_1bf
        :pswitch_1be
        :pswitch_1bd
        :pswitch_1bc
        :pswitch_1bb
        :pswitch_1ba
        :pswitch_1b9
        :pswitch_1b8
        :pswitch_1b7
        :pswitch_1b6
        :pswitch_1b5
        :pswitch_1b4
        :pswitch_1b3
        :pswitch_1b2
        :pswitch_1b1
        :pswitch_1b0
        :pswitch_1af
        :pswitch_1ae
        :pswitch_1ad
        :pswitch_1ac
        :pswitch_1ab
        :pswitch_1aa
        :pswitch_1a9
        :pswitch_1a8
        :pswitch_1a7
        :pswitch_1a6
        :pswitch_1a5
        :pswitch_1a4
        :pswitch_1a3
        :pswitch_1a2
        :pswitch_1a1
        :pswitch_1a0
        :pswitch_19f
        :pswitch_19e
        :pswitch_19d
        :pswitch_19c
        :pswitch_19b
        :pswitch_19a
        :pswitch_199
        :pswitch_198
        :pswitch_197
        :pswitch_196
        :pswitch_195
        :pswitch_194
        :pswitch_193
        :pswitch_192
        :pswitch_191
        :pswitch_190
        :pswitch_18f
        :pswitch_18e
        :pswitch_18d
        :pswitch_18c
        :pswitch_18b
        :pswitch_18a
        :pswitch_189
        :pswitch_188
        :pswitch_187
        :pswitch_186
        :pswitch_185
        :pswitch_184
        :pswitch_183
        :pswitch_182
        :pswitch_181
        :pswitch_180
        :pswitch_17f
        :pswitch_17e
        :pswitch_17d
        :pswitch_17c
        :pswitch_17b
        :pswitch_17a
        :pswitch_179
        :pswitch_178
        :pswitch_177
        :pswitch_176
        :pswitch_175
        :pswitch_174
        :pswitch_173
        :pswitch_172
        :pswitch_171
        :pswitch_170
        :pswitch_16f
        :pswitch_16e
        :pswitch_16d
        :pswitch_16c
        :pswitch_16b
        :pswitch_16a
        :pswitch_169
        :pswitch_168
        :pswitch_167
        :pswitch_166
        :pswitch_165
        :pswitch_164
        :pswitch_163
        :pswitch_162
        :pswitch_161
        :pswitch_160
        :pswitch_15f
        :pswitch_15e
        :pswitch_15d
        :pswitch_15c
        :pswitch_15b
        :pswitch_15a
        :pswitch_159
        :pswitch_158
        :pswitch_157
        :pswitch_156
        :pswitch_155
        :pswitch_154
        :pswitch_153
        :pswitch_152
        :pswitch_151
        :pswitch_150
        :pswitch_14f
        :pswitch_14e
        :pswitch_14d
        :pswitch_14c
        :pswitch_14b
        :pswitch_14a
        :pswitch_149
        :pswitch_148
        :pswitch_147
        :pswitch_146
        :pswitch_145
        :pswitch_144
        :pswitch_143
        :pswitch_142
        :pswitch_141
        :pswitch_140
        :pswitch_13f
        :pswitch_13e
        :pswitch_13d
        :pswitch_13c
        :pswitch_13b
        :pswitch_13a
        :pswitch_139
        :pswitch_138
        :pswitch_137
        :pswitch_136
        :pswitch_135
        :pswitch_134
        :pswitch_133
        :pswitch_132
        :pswitch_131
        :pswitch_130
        :pswitch_12f
        :pswitch_12e
        :pswitch_12d
        :pswitch_12c
        :pswitch_12b
        :pswitch_12a
        :pswitch_129
        :pswitch_128
        :pswitch_127
        :pswitch_126
        :pswitch_125
        :pswitch_124
        :pswitch_123
        :pswitch_122
        :pswitch_121
        :pswitch_120
        :pswitch_11f
        :pswitch_11e
        :pswitch_11d
        :pswitch_11c
        :pswitch_11b
        :pswitch_11a
        :pswitch_119
        :pswitch_118
        :pswitch_117
        :pswitch_116
        :pswitch_115
        :pswitch_114
        :pswitch_113
        :pswitch_112
        :pswitch_111
        :pswitch_110
        :pswitch_10f
        :pswitch_10e
        :pswitch_10d
        :pswitch_10c
        :pswitch_10b
        :pswitch_10a
        :pswitch_109
        :pswitch_108
        :pswitch_107
        :pswitch_106
        :pswitch_105
        :pswitch_104
        :pswitch_103
        :pswitch_102
        :pswitch_101
        :pswitch_100
        :pswitch_ff
        :pswitch_fe
        :pswitch_fd
        :pswitch_fc
        :pswitch_fb
        :pswitch_fa
        :pswitch_f9
        :pswitch_f8
        :pswitch_f7
        :pswitch_f6
        :pswitch_f5
        :pswitch_f4
        :pswitch_f3
        :pswitch_f2
        :pswitch_f1
        :pswitch_f0
        :pswitch_ef
        :pswitch_ee
        :pswitch_ed
        :pswitch_ec
        :pswitch_eb
        :pswitch_ea
        :pswitch_e9
        :pswitch_e8
        :pswitch_e7
        :pswitch_e6
        :pswitch_e5
        :pswitch_e4
        :pswitch_e3
        :pswitch_e2
        :pswitch_e1
        :pswitch_e0
        :pswitch_df
        :pswitch_de
        :pswitch_dd
        :pswitch_dc
        :pswitch_db
        :pswitch_da
        :pswitch_d9
        :pswitch_d8
        :pswitch_d7
        :pswitch_d6
        :pswitch_d5
        :pswitch_d4
        :pswitch_d3
        :pswitch_d2
        :pswitch_d1
        :pswitch_d0
        :pswitch_cf
        :pswitch_ce
        :pswitch_cd
        :pswitch_cc
        :pswitch_cb
        :pswitch_ca
        :pswitch_c9
        :pswitch_c8
        :pswitch_c7
        :pswitch_c6
        :pswitch_c5
        :pswitch_c4
        :pswitch_c3
        :pswitch_c2
        :pswitch_c1
        :pswitch_c0
        :pswitch_bf
        :pswitch_be
        :pswitch_bd
        :pswitch_bc
        :pswitch_bb
        :pswitch_ba
        :pswitch_b9
        :pswitch_b8
        :pswitch_b7
        :pswitch_b6
        :pswitch_b5
        :pswitch_b4
        :pswitch_b3
        :pswitch_b2
        :pswitch_b1
        :pswitch_b0
        :pswitch_af
        :pswitch_ae
        :pswitch_ad
        :pswitch_ac
        :pswitch_ab
        :pswitch_aa
        :pswitch_a9
        :pswitch_a8
        :pswitch_a7
        :pswitch_a6
        :pswitch_a5
        :pswitch_a4
        :pswitch_a3
        :pswitch_a2
        :pswitch_a1
        :pswitch_a0
        :pswitch_9f
        :pswitch_9e
        :pswitch_9d
        :pswitch_9c
        :pswitch_9b
        :pswitch_9a
        :pswitch_99
        :pswitch_98
        :pswitch_97
        :pswitch_96
        :pswitch_95
        :pswitch_94
        :pswitch_93
        :pswitch_92
        :pswitch_91
        :pswitch_90
        :pswitch_8f
        :pswitch_8e
        :pswitch_8d
        :pswitch_8c
        :pswitch_8b
        :pswitch_8a
        :pswitch_89
        :pswitch_88
        :pswitch_87
        :pswitch_86
        :pswitch_85
        :pswitch_84
        :pswitch_83
        :pswitch_82
        :pswitch_81
        :pswitch_80
        :pswitch_7f
        :pswitch_7e
        :pswitch_7d
        :pswitch_7c
        :pswitch_7b
        :pswitch_7a
        :pswitch_79
        :pswitch_78
        :pswitch_77
        :pswitch_76
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 2130
    check-cast p1, Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/EventTypeArg$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/EventTypeArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
