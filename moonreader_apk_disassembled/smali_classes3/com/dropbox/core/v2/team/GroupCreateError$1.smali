.class synthetic Lcom/dropbox/core/v2/team/GroupCreateError$1;
.super Ljava/lang/Object;
.source "GroupCreateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/GroupCreateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$GroupCreateError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 54
    invoke-static {}, Lcom/dropbox/core/v2/team/GroupCreateError;->values()[Lcom/dropbox/core/v2/team/GroupCreateError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/GroupCreateError$1;->$SwitchMap$com$dropbox$core$v2$team$GroupCreateError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/GroupCreateError;->GROUP_NAME_ALREADY_USED:Lcom/dropbox/core/v2/team/GroupCreateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/GroupCreateError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/team/GroupCreateError$1;->$SwitchMap$com$dropbox$core$v2$team$GroupCreateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/GroupCreateError;->GROUP_NAME_INVALID:Lcom/dropbox/core/v2/team/GroupCreateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/GroupCreateError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/team/GroupCreateError$1;->$SwitchMap$com$dropbox$core$v2$team$GroupCreateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/GroupCreateError;->EXTERNAL_ID_ALREADY_IN_USE:Lcom/dropbox/core/v2/team/GroupCreateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/GroupCreateError;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/team/GroupCreateError$1;->$SwitchMap$com$dropbox$core$v2$team$GroupCreateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/GroupCreateError;->SYSTEM_MANAGED_GROUP_DISALLOWED:Lcom/dropbox/core/v2/team/GroupCreateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/GroupCreateError;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
