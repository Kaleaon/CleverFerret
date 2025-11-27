.class synthetic Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy$1;
.super Ljava/lang/Object;
.source "SecondaryMailsPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$teamlog$SecondaryMailsPolicy:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    invoke-static {}, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;->values()[Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy$1;->$SwitchMap$com$dropbox$core$v2$teamlog$SecondaryMailsPolicy:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;->DISABLED:Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy$1;->$SwitchMap$com$dropbox$core$v2$teamlog$SecondaryMailsPolicy:[I

    sget-object v1, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;->ENABLED:Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/SecondaryMailsPolicy;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
