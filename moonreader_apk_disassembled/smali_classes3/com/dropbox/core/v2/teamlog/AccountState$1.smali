.class synthetic Lcom/dropbox/core/v2/teamlog/AccountState$1;
.super Ljava/lang/Object;
.source "AccountState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AccountState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$teamlog$AccountState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    invoke-static {}, Lcom/dropbox/core/v2/teamlog/AccountState;->values()[Lcom/dropbox/core/v2/teamlog/AccountState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AccountState$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AccountState:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccountState;->LOCKED:Lcom/dropbox/core/v2/teamlog/AccountState;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/AccountState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AccountState$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AccountState:[I

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccountState;->UNLOCKED:Lcom/dropbox/core/v2/teamlog/AccountState;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/AccountState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
