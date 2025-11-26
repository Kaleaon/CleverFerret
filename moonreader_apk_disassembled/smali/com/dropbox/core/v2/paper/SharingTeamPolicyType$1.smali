.class synthetic Lcom/dropbox/core/v2/paper/SharingTeamPolicyType$1;
.super Ljava/lang/Object;
.source "SharingTeamPolicyType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$paper$SharingTeamPolicyType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 45
    invoke-static {}, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->values()[Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType$1;->$SwitchMap$com$dropbox$core$v2$paper$SharingTeamPolicyType:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->PEOPLE_WITH_LINK_CAN_EDIT:Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType$1;->$SwitchMap$com$dropbox$core$v2$paper$SharingTeamPolicyType:[I

    sget-object v1, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->PEOPLE_WITH_LINK_CAN_VIEW_AND_COMMENT:Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType$1;->$SwitchMap$com$dropbox$core$v2$paper$SharingTeamPolicyType:[I

    sget-object v1, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->INVITE_ONLY:Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/paper/SharingTeamPolicyType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
